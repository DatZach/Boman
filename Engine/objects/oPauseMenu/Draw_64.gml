/// @description  Draw pause menu

var OFFSET = 80;
var width = display_get_gui_width();
var height = display_get_gui_height();

draw_set_font(fItemOverlay_Header);
var LINE_HEIGHT = string_height(string_hash_to_newline("W"));

draw_set_color(c_black);
draw_set_alpha(intensity);
draw_rectangle(0, 0, width, height, false);

draw_set_alpha(intensity * 2);
draw_set_color(c_white);

var itemCount = array_length_1d(items);
for(var i = 0; i < itemCount; ++i)
{
    var xx = OFFSET;
    var yy = floor(height / 2 - (itemCount * LINE_HEIGHT * 2) / 2);
        yy += i * (LINE_HEIGHT * 2);
    
    draw_text(xx + 32, yy, string_hash_to_newline(items[i]));
    
    if (i == selectedIndex)
    {
        draw_sprite_ext(
            sDialogueFinishMarker, 0,
            xx, yy + 6,
            1, 1,
            get_timer() / 30000,
            c_white, intensity * 2
        );
    }
}

draw_set_alpha(1);


