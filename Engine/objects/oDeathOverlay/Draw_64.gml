/// @description  Draw death overlay

var width = display_get_gui_width();
var height = display_get_gui_height();

draw_set_color(blackColor);
draw_set_alpha(intensity);
draw_rectangle(0, 0, width, height, false);
draw_set_alpha(intensity * 2);

draw_set_color(whiteColor);
draw_set_font(fAreaToast);
var titleHeight = string_height(string_hash_to_newline("W"));

draw_set_halign(fa_center);
draw_text_outline(width / 2, height / 2 - height / 3, "Your Story has come to an End", 2, outlineColor, 8);
draw_set_font(fAreaToast_Subtitle);
draw_text_outline(width / 2, height / 2 - height / 3 + titleHeight, flavorText, 2, outlineColor, 8);

if ((get_timer() / 1000) % 3000 < 2500)
{
    draw_text_outline(
        width / 2,
        height / 2 + height / 3,
        concat("Press [", GetKeyNameU(global.k_action), "] to be reborn"),
        2, outlineColor, 8
    );
}

draw_set_halign(fa_left);

draw_set_alpha(1);


