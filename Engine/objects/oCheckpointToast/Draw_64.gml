/// @description  Draw toast

var OFFSET = 12;
var width = display_get_width();
var height = display_get_height();
var left = OFFSET;
var top = OFFSET;

draw_set_color(c_white);
draw_set_alpha(intensity);
draw_set_font(fItemOverlay_Item);
draw_sprite(sprite_index, image_index, left, top);
draw_set_valign(fa_middle);
draw_text_outline(
    left + 24 + 8,
    top + 12 + 2,
    string_copy(MESSAGE, 0, min(floor(length), string_length(MESSAGE))),
    1, c_black, 12
);
draw_set_valign(fa_top);
draw_set_alpha(1);


