/// @description  Update toasts

var count = ds_list_size(toasts);
for(var i = 0; i < count; ++i)
{
    var toast = toasts[| i];
    toast[? "frames"] += toast[? "frame-inc"];
    
    if (toast[? "frames"] <= 0)
    {
        ds_map_destroy(toast);
        ds_list_delete(toasts, i);
        --count;
        ++i;
    }
}


/// Update desaturated-blur intensity / Game Paused

intensity = lerp(intensity, targetIntensity, 0.25);
enabled = intensity > 0.01;

global.gamePaused = enabled
                 || (!RELEASE_MODE && ConsoleActive(oController.debugConsole))
                 || instance_exists(oDialogue)
                 || instance_exists(oTeleportOverlay)
                 || instance_exists(oPauseMenu);


/// Handle input

if (instance_exists(oDialogue))
    exit;

if (CheckKey(global.k_toggle_item_overlay, E_PRESS))
{
    if (instance_exists(oTeleportOverlay))
        exit;
    
    itemOverlayEnabled = !itemOverlayEnabled;
    targetIntensity = iff(itemOverlayEnabled, 0.7, 0);
    
    if (itemOverlayEnabled)
    {
        var metadata = GetCurrentRoom();
        mapLayer = metadata[? "tile-z"];
    }
}

if (CheckKey(global.k_toggle_pause_menu, E_PRESS))
{
    instance_create(0, 0, oPauseMenu);
    exit;
}

var inventory = noone;
if (menuTabIndex == HudMenuTab.Inventory)
    inventory = global.inventory;
else if (menuTabIndex == HudMenuTab.KnickKnacks)
    inventory = global.knickKnacks;

if (enabled)
{
    if (CheckKey(global.k_down, E_PRESS) && inventory != noone)
    {
        // Inventory Down
        var OFFSET = 12;
        var top = OFFSET;
        var bottom = display_get_gui_height() - OFFSET;
        var windowCount = floor(((bottom - itemRubyHeight + 3 - OFFSET - 20) - (top + sIOIcons_Height + 4 + 6)) / 20);
        
        ++itemIndex;
        if (itemIndex >= ds_list_size(inventory))
        {
            itemIndex = 0;
            windowOffset = 0;
        }
        
        if (itemIndex - windowOffset > windowCount)
            ++windowOffset;
    }
    else if (CheckKey(global.k_up, E_PRESS) && inventory != noone)
    {
        // Inventory Up
        var OFFSET = 12;
        var top = OFFSET;
        var bottom = display_get_gui_height() - OFFSET;
        var windowCount = floor(((bottom - itemRubyHeight + 3 - OFFSET - 20) - (top + sIOIcons_Height + 4 + 6)) / 20);
        
        --itemIndex;
        if (itemIndex < 0)
        {
            itemIndex = ds_list_size(inventory) - 1;
            windowOffset = ds_list_size(inventory) - windowCount - 1;
        }
        
        if (itemIndex - windowOffset < 0)
            --windowOffset;
    }
    else if (CheckKey(global.k_right, E_PRESS))
    {
        itemIndex = 0;
        windowOffset = 0;
        var metadata = GetCurrentRoom();
        mapLayer = metadata[? "tile-z"];
        
        ++menuTabIndex;
        if (menuTabIndex >= HudMenuTab.Count)
            menuTabIndex = 0;
    }
    else if (CheckKey(global.k_left, E_PRESS))
    {
        itemIndex = 0;
        windowOffset = 0;
        var metadata = GetCurrentRoom();
        mapLayer = metadata[? "tile-z"];
    
        --menuTabIndex;
        if (menuTabIndex < 0)
            menuTabIndex = HudMenuTab.Count - 1;
    }
    else if (CheckKey(global.k_action, E_PRESS) && inventory == global.inventory &&
             (itemIndex > 0 || itemIndex < ds_list_size(inventory)))
    {
        var item = inventory[| itemIndex];
        var itemMeta = global.dbItems[| item[? "db-item-index"]];
        
        if (ItemIsType(itemMeta, ItemType.Consumable))
            ConsumeItem(itemIndex);
        else if (ItemIsType(itemMeta, ItemType.Equipable))
        {
            // Prevent us from using a BUNCH of memory for no reason
            if (ds_stack_size(global.equipStack) > 16)
            {
                ds_stack_clear(global.equipStack)
                ds_stack_push(global.equipStack, noone);
            }
            
            if (ds_stack_top(global.equipStack) != global.primaryItemIndex)
                ds_stack_push(global.equipStack, global.primaryItemIndex);
                
            global.primaryItemIndex = itemIndex;
            
            show_debug_message(concat("Equipped item-index ", global.primaryItemIndex, "; stack = ", ds_stack_size(global.equipStack)));
        }
    }
    
    else if (CheckKey(global.k_up, E_PRESS) && menuTabIndex == HudMenuTab.Map)
    {
        // Map Up
        var metadata = GetCurrentRoom();
        if (HasFlag(metadata[? "flags"], RoomFlags.Dungeon))
        {
            --mapLayer;
            if (mapLayer < 0)
                mapLayer = 0;
        }
    }
    else if (CheckKey(global.k_down, E_PRESS) && menuTabIndex == HudMenuTab.Map)
    {
        // Map Down
        var metadata = GetCurrentRoom();
        if (HasFlag(metadata[? "flags"], RoomFlags.Dungeon))
        {
            var layers = global.dungeonMaps[? metadata[? "group-id"]];
            ++mapLayer;
            if (mapLayer >= ds_list_size(layers))
                mapLayer = ds_list_size(layers) - 1;
        }
    }
}

if (inventory != noone)
{
    var len = max(ds_list_size(inventory) - 1, 0);
    itemIndex = median(0, itemIndex, len);
    windowOffset = median(0, windowOffset, len);
}


