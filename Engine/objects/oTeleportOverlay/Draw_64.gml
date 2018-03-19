/// @description  Draw map overlay

var OFFSET = 12;

var width = display_get_gui_width();
var height = display_get_gui_height();
var left = OFFSET;
var top = OFFSET;
var right = width - OFFSET;
var bottom = height - OFFSET;
var metadata = GetCurrentRoom();

var dmLeft = width / 2 - 240 + 80;
var dmTop = height / 2 - 144 + 48;

draw_sprite(sHudMapOverlay, 0, width / 2, height / 2);
DrawDungeonMap(
    dmLeft,
    dmTop,
    mapLayer,
    ds_list_find_index(global.dungeonReveals, metadata[? "group-id"]) != -1,
    true
);

// NOTE The 80 constant will need to be changed inside of
//      DrawDungeonMap as well. This is a hack.
var mapLeft = dmLeft + 80; 

draw_sprite(sHudMapCell, 8, mapLeft + xx * 12, dmTop + yy * 12);

draw_set_color(c_black);
draw_set_font(fDialogue);
draw_set_halign(fa_center);

if (message == "")
{
    draw_text(
        width / 2,
        height / 2 + 144 - 48,
        string_hash_to_newline(concat("[", GetKeyNameU(global.k_action), "] to teleport | [", GetKeyNameU(global.k_toggle_item_overlay), "] to cancel"))
    );
}
else
    draw_text(width / 2, height / 2 + 144 - 48, string_hash_to_newline(message));

draw_set_halign(fa_left);


