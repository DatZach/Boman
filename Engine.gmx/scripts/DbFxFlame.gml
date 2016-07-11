{
    global.dbFx_Flame = part_system_create();
    part_system_depth(global.dbFx_Flame, -500);
    
    global.dbFx_Flame_Type = part_type_create();
    part_type_sprite(
        global.dbFx_Flame_Type,
        sFxFlame,
        false,
        false,
        true
    );
    
    part_type_size(global.dbFx_Flame_Type, 1, 1.5, -0.01, 0.01);
    part_type_speed(global.dbFx_Flame_Type, 0.1, 0.5, 0.03, 0.01);
    part_type_direction(global.dbFx_Flame_Type, 90, 90, 0, 0);
    part_type_gravity(global.dbFx_Flame_Type, 0.01, 90);
    part_type_orientation(global.dbFx_Flame_Type, 90 - 15, 90 + 15, 0, 0.2, true);
    part_type_alpha2(global.dbFx_Flame_Type, 1, 0);
    part_type_colour2(global.dbFx_Flame_Type, c_white, make_colour_rgb(69, 71, 104));
    part_type_blend(global.dbFx_Flame_Type, false);
    part_type_life(global.dbFx_Flame_Type, TARGET_FPS * 0.25, TARGET_FPS * 0.5);
}

