/// @description  RoomAddZ(room, group-id, name, flags, tileX, tileY, tileZ, music);
/// @function  RoomAddZ
/// @param room
/// @param  group-id
/// @param  name
/// @param  flags
/// @param  tileX
/// @param  tileY
/// @param  tileZ
/// @param  music

{
    // Room Entry
    var entry = RoomAdd(argument0, argument1, argument2, argument3, argument4, argument5, argument7);
    entry[? "tile-z"] = argument6;
    
    return entry;
}

