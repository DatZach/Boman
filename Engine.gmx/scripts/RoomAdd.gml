/// RoomAdd(room, group-id, name, flags, level);

{
    // Room Entry
    var entry = ds_map_create();
        entry[? 'room'] = argument0;
        entry[? 'group-id'] = argument1;
        entry[? 'name'] = argument2;
        entry[? 'flags'] = argument3;
        entry[? 'level'] = argument4;
    ds_map_add(global.rooms, argument0, entry);
    
    // Key Map Entry
    if (!ds_map_exists(global.keys, argument1))
        ds_map_add(global.keys, argument1, 0);
    
    return entry;
}

