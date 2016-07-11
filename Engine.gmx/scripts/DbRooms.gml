/// DbRooms();

{
    enum RoomFlags {
        None            = $0000,
        LeveledSpawn    = $0001,
        Dungeon         = $0002,
        Settlement      = $0004
    }
    
    global.rooms = ds_map_create();
    global.keys = ds_map_create();
    global.unlockedDoors = ds_list_create();
    global.visitedAreas = ds_list_create();
    global.completedAreas = ds_list_create();
    global.shrines = ds_list_create();
    
    // System Rooms
    RoomAdd(rInitialize, 'SYSTEM', 'Initialization', RoomFlags.None, 0);
    
    // Debug Rooms
    RoomAdd(rDebug01_Platforming, 'DEBUG', 'DEBUG - Platforming', RoomFlags.None, 0);
    RoomAdd(rDebug02_Mechanics, 'DEBUG', 'DEBUG - Mechanics', RoomFlags.None, 0);
    RoomAdd(rDebug03_Particles, 'DEBUG', 'DEBUG - Particles', RoomFlags.None, 0);
    RoomAdd(rDebug04_Dungeon01, 'DEBUG', 'Mysterious Cave', RoomFlags.Dungeon, 0);
    RoomAdd(rDebug04_Dungeon02, 'DEBUG', 'Mysterious Cave', RoomFlags.Dungeon, 0);
    RoomAdd(rDebug04_Dungeon03, 'DEBUG', 'Mysterious Cave', RoomFlags.Dungeon, 0);
    RoomAdd(rDebug04_Dungeon04, 'DEBUG', 'Mysterious Cave', RoomFlags.Dungeon, 0);
    RoomAdd(rDebug04_Town, 'DEBUG_TOWN', 'Reading Town', RoomFlags.None, 0);
    
    // Verify that all rooms exist in database
    var r = room_first;
    do {
        if (is_undefined(ds_map_find_value(global.rooms, r)))
            ConsolePrint(debugConsole, concat("The room '", room_get_name(r), "' has not be registered."));
        
        r = room_next(r);
    } until(r == room_last);
}

