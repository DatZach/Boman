/// LoadMapData(region, relative-path);
/// Loads map data from the datafiles

{
    var region = argument0;
    var relativePath = argument1;
    
    var tmpMaps = ds_list_create();
    var tmpDoors = ds_list_create(); 
    
    // Load Rooms
    var f = file_text_open_read(working_directory + relativePath + '\Rooms.txt');
    if (f == -1)
    {
        ConsolePrint(oController.debugConsole, concat('Failed to load map data (Rooms) for ', region));
        ds_list_destroy(tmpMap);
        ds_list_destroy(tmpDoors);
        return false;
    }
    
    var height = real(file_text_readln(f));
    while(!file_text_eof(f))
    {
        // NOTE Setting map to 0 is intended
        var map = 0;
        for(var i = height - 1; i >= 0; --i)
            map[i] = '';
        
        for(var i = 0; i < height; ++i)
            map[i] = string_replace(file_text_readln(f), chr(13) + chr(10), '');
        
        ds_list_add(tmpMaps, map);
        file_text_readln(f);
    }
    
    file_text_close(f);

    // Load Doors
    var f = file_text_open_read(working_directory + '\' + relativePath + '\Doors.txt');
    if (f == -1)
    {
        ConsolePrint(oController.debugConsole, concat('Failed to load map data (Doors) for ', region));
        ds_list_destroy(tmpMap);
        ds_list_destroy(tmpDoors);
        return false;
    }

    var height = real(file_text_readln(f));
    while(!file_text_eof(f))
    {
        // NOTE Setting doors to 0 is intended
        var doors = 0;
        for(var i = height - 1; i >= 0; --i)
            doors[i] = '';
            
        for(var i = 0; i < height; ++i)
            doors[i] = string_replace(file_text_readln(f), chr(13) + chr(10), '');
        
        ds_list_add(tmpDoors, doors);
        file_text_readln(f);
    }
    
    file_text_close(f);
    
    // Simple verification of data
    if (ds_list_size(tmpMaps) != ds_list_size(tmpDoors))
    {
        ConsolePrint(oController.debugConsole, concat('Map ', region, ' maps/doors mismatch.'));
        return false;
    }
    
    // Build map entry
    var entry = ds_list_create();
    for(var i = 0; i < ds_list_size(tmpMaps); ++i)
    {
        var layer = ds_list_create();
            ds_list_add(layer, tmpMaps[| i]);
            ds_list_add(layer, tmpDoors[| i]);
        ds_list_add(entry, layer);
    }
    
    global.dungeonMaps[? region] = entry;
        
    ds_list_destroy(tmpMaps);
    ds_list_destroy(tmpDoors);
        
    return true;
}

