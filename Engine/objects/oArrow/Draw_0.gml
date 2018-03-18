/// @description  Draw arrow

draw_sprite_ext(sprite_index, 0, x, y, 1, 1, angle - 90, c_white, 1);

switch(statusEffect)
{
    case global.ITEM_Lantern:
        if (fireActive)
        {
            part_particles_create(
                global.dbFx_Flame,
                x + lengthdir_x(6, angle),
                y + lengthdir_y(6, angle),
                global.dbFx_Flame_Type,
                3
            );
        }
        break;
        
    case global.ITEM_Bomb:
        draw_sprite_ext(sItemIcons16, 2, x + lengthdir_x(6, angle), y + lengthdir_y(6, angle), 0.75, 0.75, angle - 180, c_white, 1);
        break;
}


