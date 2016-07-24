/// RegisterShrine();
/// Register this shrine in the list of shrines loaded

{
    var metadata = GetCurrentRoom();
    
    var entry = ds_map_create();
        entry[? 'group-id'] = metadata[? 'group-id'];
        entry[? 'room'] = room;
        entry[? 'id'] = id;
        entry[? 'tile-id'] = GetCurrentDungeonTileId();
    ds_list_add(global.shrines, entry);
}

