/// @description  Draw overlay

draw_set_font(fAreaToast);

draw_set_alpha(value * 4);

var roomName = GetCurrentRoomName();

var guiWidth = display_get_gui_width();
var guiHeight = display_get_gui_height();
var width = string_width(string_hash_to_newline(roomName));

var lineHeight = string_height(string_hash_to_newline("M"));
var left = floor(guiWidth * 0.5 - width * 0.5);
var right = floor(guiWidth * 0.5 + width * 0.5);
var top = floor(guiHeight * 0.5 - lineHeight * 1);
var bottom = floor(guiHeight * 0.5 + lineHeight * 1);

// Top line
draw_set_color(c_black);
draw_rectangle(left - 2, top - 2, floor(left + 2 + (right - left) * value), top + 2 + 2, false);
draw_set_color(c_white);
draw_rectangle(left, top, floor(left + (right - left) * value), top + 2, false);

// Draw text
var partialName = string_copy(roomName, 1, ceil(string_length(roomName) * value));
draw_set_valign(fa_middle);
draw_text_outline(guiWidth * 0.5 - width * 0.5, guiHeight * 0.5 + 1, partialName, 2, c_black, 4);
draw_set_valign(fa_top);

// Bottom line
draw_set_color(c_black);
draw_rectangle(floor(right - 2 - (right - left) * value), bottom - 2, right + 2, bottom + 2 + 2, false);
draw_set_color(c_white);
draw_rectangle(floor(right - (right - left) * value), bottom, right, bottom + 2, false);

draw_set_alpha(1);


