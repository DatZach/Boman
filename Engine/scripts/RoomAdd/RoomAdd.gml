/// @description  RoomAdd(room, group-id, name, flags, tileX, tileY, music);
/// @function  RoomAdd
/// @param room
/// @param  group-id
/// @param  name
/// @param  flags
/// @param  tileX
/// @param  tileY
/// @param  music

{
    // Room Entry
    var entry = ds_map_create();
        entry[? "room"] = argument0;
        entry[? "group-id"] = argument1;
        entry[? "name"] = argument2;
        entry[? "flags"] = argument3;
        entry[? "tile-x"] = argument4;
        entry[? "tile-y"] = argument5;
        entry[? "tile-z"] = 0;
        entry[? "bg-music"] = argument6;
    ds_map_add(global.rooms, argument0, entry);
    
    // Key Map Entry
    if (!ds_map_exists(global.keys, argument1))
        ds_map_add(global.keys, argument1, 0);
    
    return entry;
}

