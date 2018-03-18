/// @description  Handle player interaction

if (opened)
    exit;
    
var collision = place_meeting(x, y, oPlayer);
if (collision)
    NotifyInteraction(InteractionIcon.Hand, "Open Chest");

if (oHud.enabled)
    exit;

if (CheckKey(global.k_action, E_PRESS) && collision)
{
    if (HasFlag(type, ChestType.Level))
    {
        var item = ItemChooseRandom(level);
        SpawnItem(
            item,
            bbox_left + (bbox_right - bbox_left) / 2,
            bbox_top,
            true
        );
    }
    
    if (HasFlag(type, ChestType.Static))
    {
        var count = ds_list_size(items);
        for(var i = 0; i < count; ++i)
        {
            SpawnItem(
                global.dbItems[| items[| i]],
                bbox_left + (bbox_right - bbox_left) / 2,
                bbox_top,
                true
            );
        }
    }
    
    opened = true;
}


