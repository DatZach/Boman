draw_sprite_ext(
    sprite_index,
    image_index,
    x,
    y - abs(sin((offset + (get_timer() / 1000)) / 500) * 5),
    1,
    1,
    0,
    c_white,
    1
);


