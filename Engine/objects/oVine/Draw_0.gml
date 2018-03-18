draw_self();
if (aflame)
{
    part_particles_create(
        global.dbFx_Flame,
        x + 3 + wx,
        y + 13 + wy,
        global.dbFx_Flame_Type,
        2
    );
    
    part_particles_create(
        global.dbFx_Flame,
        x + 12 - wx,
        y + 7 + wy,
        global.dbFx_Flame_Type,
        2
    );
    
    part_particles_create(
        global.dbFx_Flame,
        x + 4 + wx,
        y + 3 - wy,
        global.dbFx_Flame_Type,
        2
    );
    
    part_particles_create(
        global.dbFx_Flame,
        x + x1,
        y + y1,
        global.dbFx_Flame_Type,
        3
    );
}


