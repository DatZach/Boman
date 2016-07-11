{
    global.dbFx_MobSmoke = part_system_create();
    part_system_depth(global.dbFx_MobSmoke, 500);
    
    global.dbFx_MobSmoke_Type = part_type_create();
    part_type_sprite(
        global.dbFx_MobSmoke_Type,
        sFxMobSmoke,
        false,
        false,
        true
    );
    
    part_type_size(global.dbFx_MobSmoke_Type, 0.75, 1, 0.01, 0.0);
    part_type_speed(global.dbFx_MobSmoke_Type, 0.1, 0.1, 0, 0);
    part_type_direction(global.dbFx_MobSmoke_Type, 0, 360, 0.01, 0);
    part_type_gravity(global.dbFx_MobSmoke_Type, 0.05, 90);
    part_type_orientation(global.dbFx_MobSmoke_Type, 0, 360, 0.1, 0.1, true);
    part_type_alpha2(global.dbFx_MobSmoke_Type, 0.4, 0);
    part_type_blend(global.dbFx_MobSmoke_Type, false);
    part_type_life(global.dbFx_MobSmoke_Type, TARGET_FPS * 0.3, TARGET_FPS * 0.42);
}
