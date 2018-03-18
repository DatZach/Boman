/// @description  DbRooms();
/// @function  DbRooms

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
    global.dungeonReveals = ds_list_create();
    global.dungeonCompasses = ds_list_create();
    
    // Regions
    global.regions = ds_map_create();
    global.regions[? "DEBUG_TOWN"] = 1;
    global.regions[? "DEBUG_LAKE"] = 2;
    global.regions[? "DEBUG"] = 3;
    
    // Dungeon Maps
    global.dungeonMaps = ds_map_create();
    global.visitedAreasDungeons = ds_map_create();
    LoadMapData("DEBUG", "Maps\\DEBUG");    
    
    // System Rooms
    RoomAdd(rInitialize, "SYSTEM", "Initialization", RoomFlags.None, 0, 0, noone);
    
    // Debug Rooms
    RoomAddZ(rDebug01_Platforming, "DEBUG_LAKE", "DEBUG - Platforming", RoomFlags.None, 0, 0, 0, noone);
    RoomAddZ(rDebug02_Mechanics, "DEBUG", "DEBUG - Mechanics", RoomFlags.None, 0, 0, 0, noone);
    RoomAddZ(rDebug03_Particles, "DEBUG", "DEBUG - Particles", RoomFlags.None, 0, 0, 0, noone);
    RoomAddZ(rDebug04_Dungeon01, "DEBUG", "Mysterious Cave", RoomFlags.Dungeon, 5, 4, 0, bgOverworld02);
    RoomAddZ(rDebug04_Dungeon02, "DEBUG", "Mysterious Cave", RoomFlags.Dungeon, 6, 4, 0, bgOverworld02);
    RoomAdd(rDebug04_Dungeon03, "DEBUG_LAKE", "Outside the Mysterious Cave", RoomFlags.None, 5, 9, bgOverworld01);
    RoomAddZ(rDebug04_Dungeon04, "DEBUG", "Mysterious Cave", RoomFlags.Dungeon, 5, 4, 1, bgOverworld02);
    RoomAddZ(rDebug04_Town, "DEBUG_TOWN", "Reading Town", RoomFlags.None, 3, 14, 0, bgOverworld01);
    
    // Verify that all rooms exist in database
    var r = room_first;
    do {
        var entry = ds_map_find_value(global.rooms, r);
        
        if (is_undefined(entry))
            ConsolePrint(debugConsole, concat("The room '", room_get_name(r), "' has not be registered."));
            
        var region = entry[? "group-id"];
        if (is_undefined(ds_map_find_value(global.regions, region)) && region != "SYSTEM")
            ConsolePrint(debugConsole, concat("The region '", entry[? "group-id"], "' has not been registered."));
        
        r = room_next(r);
    } until(r == room_last);
}

