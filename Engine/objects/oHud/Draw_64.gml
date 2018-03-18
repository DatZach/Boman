/// @description  Draw overlay - Toasts

var OFFSET = 12;
var TOAST_HEIGHT = 19;
var toastY = OFFSET;
var toastX = OFFSET;

var count = ds_list_size(toasts);
for(var i = 0; i < count; ++i)
{
    var toast = toasts[| i];
    var frames = toast[? "frames"];
    var itemMeta = global.dbItems[| toast[? "item-index"]];
    var name = itemMeta[? "name"];
    
    draw_set_font(fItemOverlay_Item);
    var width = floor(max(125, string_width(string_hash_to_newline(name)) + 32));
    var rectWidth = width - 49 * 2;
    
    var alphaMul = min(8, frames) / 8;
    var slideOffset = ((8 - min(8, frames)) / 8) * width;
    var tX = floor(toastX - slideOffset);
    
    // Draw toast backdrop
    draw_set_alpha(0.55 * alphaMul);
    draw_set_color(blackColor);
    draw_sprite(sToast, 0, tX, toastY);
    draw_rectangle(tX + 49, toastY, tX + 49 + rectWidth - 1, toastY + 19 - 1, false);
    draw_sprite(sToast, 1, tX + 49 + rectWidth, toastY);
    draw_set_alpha(1 * alphaMul);
    
    // Draw name
    draw_set_color(whiteColor);
    draw_set_valign(fa_middle);
    draw_text_outline(tX + 8, toastY + TOAST_HEIGHT / 2, name, 1, outlineColor, 4);
    draw_set_valign(fa_top);
    
    // Draw icon
    draw_sprite(sItemIcons16, itemMeta[? "image-index"], tX + width - 8, toastY + TOAST_HEIGHT / 2 - 1);
    
    draw_set_alpha(1);
    
    toastY += TOAST_HEIGHT + 6;
}


/// Draw overlay - TAB Menu

if (enabled)
{

var OFFSET = 12;

var width = display_get_gui_width();
var height = display_get_gui_height();
var left = OFFSET;
var top = OFFSET;
var right = width - OFFSET;
var bottom = height - OFFSET;

// Obscure game world
draw_set_color(c_black);
draw_set_alpha(intensity);
draw_rectangle(0, 0, width, height, false);

//FxInitializeDesaturatedBlur();

draw_set_alpha(intensity * 2);

// Draw passive items view
for(var i = 0; i < 3; ++i)
    draw_sprite(sIOItemRuby, 0, left, top + (sIOItemRuby_Height + OFFSET) * i);

draw_sprite(sIOHeartContainer, global.heartPieces, left, top + (sIOHeartContainer_Height + OFFSET) * 3 + OFFSET * 2);

// Draw item list header
var left2 = left + sIOItemRuby_Width + OFFSET;
var xx = left2;
var headerWidths;
headerWidths[4] = 0;
headerWidths[0] = xx;

draw_set_color(c_white);
draw_set_font(fItemOverlay_Header);
draw_set_valign(fa_middle);

draw_sprite(sIOIcons, 0, xx, top);
xx += sIOIcons_Width + 4;
draw_text_outline(xx, top + sIOIcons_Height / 2 + 2, "Knap Sack", 2, outlineColor, 4);
xx += string_width(string_hash_to_newline("Knap Sack"));
xx += 8;
headerWidths[1] = xx;

draw_sprite(sIOIcons, 1, xx, top);
xx += sIOIcons_Width + 4;
draw_text_outline(xx, top + sIOIcons_Height / 2 + 2, "Knick-Knacks", 2, outlineColor, 4);
xx += string_width(string_hash_to_newline("Knick-Knacks"));
xx += 8;
headerWidths[2] = xx;

draw_sprite(sIOIcons, 2, xx, top);
xx += sIOIcons_Width + 4;
draw_text_outline(xx, top + sIOIcons_Height / 2 + 2, "Relics", 2, outlineColor, 4);
xx += string_width(string_hash_to_newline("Relics"));
xx += 8;
headerWidths[3] = xx;

draw_sprite(sIOIcons, 3, xx, top);
xx += sIOIcons_Width + 8;
draw_text_outline(xx, top + sIOIcons_Height / 2 + 2, "Map", 2, outlineColor, 4);
xx += string_width(string_hash_to_newline("Map"));
xx += 8;
headerWidths[4] = xx;

draw_set_valign(fa_top);

// Draw item list header line
draw_set_color(c_white);
var itemListHeaderLineY = top + sIOIcons_Height + 4;
draw_line_width(left2, itemListHeaderLineY, right, itemListHeaderLineY, 2);
draw_set_color(selectColor);
draw_line_width(headerWidths[menuTabIndex], itemListHeaderLineY, headerWidths[menuTabIndex + 1] - 8, itemListHeaderLineY, 2);
draw_set_color(c_white);

switch(menuTabIndex)
{
    case HudMenuTab.Inventory:
    case HudMenuTab.KnickKnacks:
    {
        // Draw inventory
        var inventory = iff(menuTabIndex == HudMenuTab.Inventory, global.inventory, global.knickKnacks);
        var itemMenuX = left2 + 5;
        var itemMenuY = top + sIOIcons_Height + 4 + 6;
        var itemMenuHeight = bottom - itemRubyHeight + 3 - OFFSET - 20;
        var inventorySize = ds_list_size(inventory);
        
        draw_set_font(fItemOverlay_Item);
        draw_set_valign(fa_middle);
        
        // Highlight selected item
        if (inventorySize > 0)
        {
            var selectedItemIndexY = itemMenuY - 1 + (itemIndex - windowOffset) * 20;
            draw_set_color(selectColor);
            draw_set_alpha(intensity / targetIntensity * 0.5);
            draw_rectangle(left2, selectedItemIndexY, headerWidths[3], selectedItemIndexY + 17, false);
            draw_set_alpha(intensity * 2);
            draw_rectangle(left2, selectedItemIndexY, left2 + 2, selectedItemIndexY + 17, false);
        }
        
        draw_set_color(c_white);
        
        // Draw items in inventory
        var i = windowOffset;
        for(; i < inventorySize && itemMenuY < itemMenuHeight; ++i)
        {
            var item = inventory[| i];
            var itemMeta = global.dbItems[| item[? "db-item-index"]];
            
            draw_sprite(sItemIcons16, itemMeta[? "image-index"], itemMenuX + 8, itemMenuY + 8);
            draw_text(itemMenuX + 16 + 5, itemMenuY + 9, string_hash_to_newline(itemMeta[? "name"]));
            
            var txx = headerWidths[3] - 2;
            
            draw_set_halign(fa_right);
            
            if (i == itemIndex)
            {
                // ITEM SELECTED
                
                if (ItemIsType(itemMeta, ItemType.Equipable))
                {
                    var displayText = concat(GetKeyNameU(global.k_action), "  |  Equip >");
                    draw_text(txx, itemMenuY + 9, string_hash_to_newline(displayText));
                    
                    txx -= string_width(string_hash_to_newline(displayText)) + 16;
                }
                else if (ItemIsType(itemMeta, ItemType.Consumable))
                {
                    var displayText = concat(GetKeyNameU(global.k_action), "  |  Consume >");
                    draw_text(txx, itemMenuY + 9, string_hash_to_newline(displayText));
                    
                    txx -= string_width(string_hash_to_newline(displayText)) + 16;
                }
            }
            
            if (ItemIsType(itemMeta, ItemType.Stackable))
            {
                var maxStock = item[? "max-stock"];
                var stockMsg = iff(
                    maxStock > 0,
                    concat(item[? "stock"], " / ", maxStock, " Stock"),
                    concat(item[? "stock"], " Stock")
                );
                
                draw_text(txx, itemMenuY + 9, string_hash_to_newline(stockMsg));
            }
            
            draw_set_halign(fa_left);
            
            itemMenuY += 20;
        }
        
        if (i < inventorySize)
        {
            var displayText = concat(inventorySize - i, " More Items");
            var itemMenuCenterX = (headerWidths[3] - itemMenuX) / 2 + itemMenuX;
            var messageWidth = string_width(string_hash_to_newline(displayText));
            
            draw_set_halign(fa_center);
            draw_text(itemMenuCenterX, itemMenuY + 9, string_hash_to_newline(displayText));
            draw_set_halign(fa_left);
            
            draw_line_width(itemMenuX, itemMenuY + 8, itemMenuCenterX - messageWidth / 2 - 8, itemMenuY + 8, 2);
            draw_line_width(itemMenuCenterX + messageWidth / 2 + 8, itemMenuY + 8, headerWidths[3], itemMenuY + 8, 2);
        }
        
        draw_set_valign(fa_top);
        
        // Draw item preview
        if (inventorySize != 0 && itemIndex < inventorySize)
        {
            var left3 = headerWidths[3] + OFFSET;
            var ipCenterX = left3 + (right - left3) / 2 - 12;
            var ipCenterY = top + 24 + OFFSET + 64;
            
            var item = inventory[| itemIndex];
            var itemMeta = global.dbItems[| item[? "db-item-index"]];
            
            draw_sprite(sItemIcons24, itemMeta[? "image-index"], ipCenterX, ipCenterY);
            
            draw_set_halign(fa_center);
            draw_text_outline_width(ipCenterX, ipCenterY + OFFSET + 64, itemMeta[? "name"] + "##" + itemMeta[? "description"], 1, outlineColor, 8, (VIEW_WIDTH - OFFSET - left3));
            draw_set_halign(fa_left);
        }
        else
        {
            var itemMenuCenterX = (headerWidths[3] - itemMenuX) / 2 + itemMenuX;
            var itemMenuCenterY = (itemMenuHeight - itemMenuY) / 2 + itemMenuY;
            
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_outline(itemMenuCenterX, itemMenuCenterY, "*Cricket Noises*", 2, outlineColor, 4);
            draw_set_valign(fa_top);
            draw_set_halign(fa_left);
        }
        break;
    }
    
    case HudMenuTab.Relics:
        break;
        
    case HudMenuTab.Map:
    {
        var metadata = GetCurrentRoom();
        
        var ct = (top + sIOIcons_Height + 4 + 6);
        var centerX = (right - left2) / 2 + left2;
        var centerY = ((bottom - itemRubyHeight + 3 - OFFSET - 20) - ct) / 2 + ct + 32;
        var mapLeft = floor(centerX - 295 / 2);
        var mapTop = floor(centerY - 293 / 2);
        
        if (HasFlag(metadata[? "flags"], RoomFlags.Dungeon))
        {
            DrawDungeonMap(
                mapLeft,
                mapTop,
                layer,
                ds_list_find_index(global.dungeonReveals, metadata[? "group-id"]) != -1,
                ds_list_find_index(global.dungeonCompasses, metadata[? "group-id"]) != -1
            );
        }
        else
        {
            var mapRight = mapLeft + 295;
            var mapBottom = mapTop + 293;
            
            draw_sprite(sHudWorldMap, 0, centerX, centerY);
            
            var count = ds_map_size(global.regions);
            var itr = ds_map_find_first(global.regions);
            for(var i = 0; i < count; ++i)
            {
                if (ds_list_find_index(global.visitedAreas, itr) == -1)
                {
                    draw_sprite(
                        sHudWorldMap,
                        global.regions[? itr],
                        centerX,
                        centerY
                    );
                }
                
                itr = ds_map_find_next(global.regions, itr);
            }
            
            /*
            // DRAW DEBUG OVERLAY -- RENDER CO-ORD GRID
            draw_set_color(c_black);
            draw_set_font(font7); // Arial 4pt no AA
            for(var xx = mapLeft; xx < mapRight; xx += 8)
            {
                draw_text(xx + 4, mapTop - 12, string((xx - mapLeft) / 8));
                draw_line(xx, mapTop, xx, mapBottom);
            }
            
            for(var yy = mapTop; yy < mapBottom; yy += 8)
            {
                draw_text(mapLeft - 12, yy + 4, string((yy - mapTop) / 8));
                draw_line(mapLeft, yy, mapRight, yy);
            }
            */
            
            draw_sprite(
                sHudMapMarker, 0,
                mapLeft + 4 + metadata[? "tile-x"] * 8,
                mapTop + 4 + metadata[? "tile-y"] * 8
            );
            
            draw_set_font(fItemOverlay_Item);
            draw_set_halign(fa_center);
            draw_set_color(c_white);
            draw_text_outline(centerX, mapBottom - 12, metadata[? "name"], 2, outlineColor, 4);
            draw_set_halign(fa_left);
        }
        break;
    }
}

draw_set_alpha(1);
}


/* */
/// Draw overlay - Game

var OFFSET = 12;
var xx = OFFSET;
var yy = display_get_gui_height() - OFFSET;
var xxr = display_get_gui_width() - OFFSET;

draw_set_font(fHudOverlay);

// Item Ruby & Arrow pieces indicator
draw_sprite(sHudItemRuby, 0, xx, yy - itemRubyHeight);
draw_sprite(sHudBrokenArrow, global.arrowSegments, xx + itemRubyWidth / 2, yy - itemRubyHeight - OFFSET - brokenArrowHeight);

if (global.primaryItemIndex != noone)
{
    var item = global.inventory[| global.primaryItemIndex];
    var itemMeta = global.dbItems[| item[? "db-item-index"]];
    
    draw_sprite(sItemIcons24, itemMeta[? "image-index"], xx + itemRubyWidth / 2, yy - itemRubyHeight / 2);
    if (HasFlag(itemMeta[? "type"], ItemType.Stackable))
    {
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text_outline(xx + 38, yy - itemRubyHeight + 42, string(item[? "stock"]), 2, outlineColor, 4);
        draw_set_valign(fa_top);
        draw_set_halign(fa_left);
    }
}

// Hearts
var fullHearts = floor(global.hp / POINTS_PER_HEART);
for(var i = 0; i < global.maxHp / POINTS_PER_HEART; ++i)
{
    var chp = (global.hp - i * POINTS_PER_HEART) % POINTS_PER_HEART;
    if (i > fullHearts)
        chp = 0;
    else if (i < fullHearts)
        chp = POINTS_PER_HEART;
    
    draw_sprite(sHudHeart, chp, xx + itemRubyWidth + 8 + i * (heartWidth + 2), yy - itemRubyHeight + 3);
}

// Arrows
draw_set_color(make_color_rgb(35, 46, 46));
draw_rectangle(
    xx + itemRubyWidth + 12,
    yy - itemRubyHeight + heartHeight + 14 + 4,
    xx + itemRubyWidth + 1 + global.maxArrows * arrowWidth,
    yy - itemRubyHeight + heartHeight + 14 + 4 + 3,
    false
);

for(var i = global.maxArrows - 1; i >= 0; --i)
{
    draw_sprite(sHudArrow, i >= global.arrows, xx + itemRubyWidth + i * arrowWidth, yy - itemRubyHeight + heartHeight + 11);
}

// Gold
draw_sprite(sHudGoldPile, 0, xxr - goldWidth, yy - goldHeight);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_text_outline(xxr - goldWidth - 4, yy - goldHeight + 6, string(global.gold), 2, outlineColor, 4);
draw_set_halign(fa_left);

// Dungeon Keys
if (GuiGetShowKeyCount())
{
    draw_sprite(sHudKey, 0, xxr - keyWidth, yy - goldHeight - 3 - keyHeight);
    draw_set_color(c_white);
    draw_set_halign(fa_right);
    draw_text_outline(xxr - keyWidth - 4, yy - goldHeight - 3 - keyHeight + 6, string(GetRoomKeyCount()), 2, outlineColor, 4);
    draw_set_halign(fa_left);
}


/* */
/*  */
