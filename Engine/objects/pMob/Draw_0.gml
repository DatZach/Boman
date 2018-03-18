if (invincible && (alarm[2] % 15) < 6 && !dying)
    exit;

if (dying)
{
    part_particles_create(
        global.dbFx_MobSmoke,
        bbox_left + (bbox_right - bbox_left) / 2,
        bbox_top + (bbox_bottom - bbox_top) / 2,
        global.dbFx_MobSmoke_Type,
        1
    );
    
    shader_set(shWhiteSprite);
    draw_self();
    shader_reset();
}
else
    draw_self();

if (global.DBG_ShowHP)
{
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text_outline((bbox_right - bbox_left) / 2 + bbox_left, bbox_bottom + 2, string(hp) + " / " + string(maxHp), 1, c_black, 4);
    draw_set_halign(fa_left);
}

if (aflame)
{
    for(var i = 0; i < ds_list_size(flamePoints); i += 2)
    {
        part_particles_create(
            global.dbFx_Flame,
            bbox_left + flamePoints[| i],
            bbox_top + flamePoints[| i + 1],
            global.dbFx_Flame_Type,
            2
        );
    }
}


