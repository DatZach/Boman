/// @description  Draw overlay - Interactive Action Toast

if (global.interactionIcon != InteractionIcon.None)
{
    var xx = oPlayer.x;
    var yy = oPlayer.bbox_bottom + 4;
    
    draw_set_color(whiteColor);
    draw_set_font(fHudOverlay);
    var textWidth = string_width(string_hash_to_newline(global.interactionText));
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_outline(xx + (18 + 4) / 2, yy + 18 / 2 + 2, global.interactionText, 2, blackColor, 8);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    
    draw_sprite(sInteractIcons18, global.interactionIcon, xx - 18 / 2 - 4 - textWidth / 2, yy);
}


