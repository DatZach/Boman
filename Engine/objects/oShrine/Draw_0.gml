/// @description  Draw shrine

if (!active)
{
    draw_sprite(sprite_index, 0, x, y);
}
else
{
    draw_sprite(sprite_index, 2, x, y - abs(sin((get_timer() / 1000) / 800) * 6) * (offset / targetOffset) - offset);
    draw_sprite(sprite_index, 1, x, y);
}


