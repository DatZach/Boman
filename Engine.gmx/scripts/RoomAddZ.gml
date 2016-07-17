/// RoomAddZ(room, group-id, name, flags, tileX, tileY, tileZ);

{
    // Room Entry
    var entry = RoomAdd(argument0, argument1, argument2, argument3, argument4, argument5);
    entry[? 'tile-z'] = argument6;
    
    return entry;
}

