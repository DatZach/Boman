/// FlushUncompletedShrines();
/// Removes all shrine entries that do not appear in the completed areas list

{
    for(var i = 0; i < ds_list_size(global.shrines); ++i)
    {
        var entry = global.shrines[| i];
        
        if (ds_list_find_index(global.completedAreas, entry[? 'group-id']) < 0)
        {
            ds_map_destroy(entry);
            ds_list_delete(global.shrines, i);
            --i;
        }
    }
}

