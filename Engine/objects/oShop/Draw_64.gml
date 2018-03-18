/// @description  Draw coins

var OFFSET = 12;
var xx = OFFSET;
var yy = display_get_gui_height() - OFFSET;
var xxr = display_get_gui_width() - OFFSET;

// Gold
draw_set_font(fHudOverlay);
draw_sprite(sHudGoldPile, 0, xxr - goldWidth, yy - goldHeight);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_text_outline(xxr - goldWidth - 4, yy - goldHeight + 6, string(global.gold), 2, outlineColor, 4);
draw_set_halign(fa_left);


