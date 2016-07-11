/// ReflectionInitialize();
/// Initializes reflection

{
    global._ref_Rooms = ds_map_create();
    
    // Open data file
    var filename = working_directory + '\' + 'Engine.win';
    
    // WARNING This might become really slow in the future as file size increases
    var handle = buffer_load(filename);
    if (is_undefined(handle))
    {
        ConsolePrint(oController.debugConsole, 'REFLECTION: Unable to open game data for reflection.');
        ConsolePrint(oController.debugConsole, filename);
        return false;
    }
    
    if (buffer_read(handle, buffer_u32) != $4D524F46) // FORM
    {
        ConsolePrint(oController.debugConsole, 'REFLECTION: Unable to open game data for reflection.');
        ConsolePrint(oController.debugConsole, filename);
        return false;
    }
    
    var formSize = buffer_read(handle, buffer_u32);
    
    // Seek to ROOM section
    var section;
    while (buffer_tell(handle) < formSize)
    {
        section = buffer_read(handle, buffer_u32);
        if (section == $4D4F4F52)
            break;
        
        buffer_seek(handle, buffer_seek_relative, buffer_read(handle, buffer_u32));
    }
    
    if (buffer_tell(handle) >= formSize)
    {
        ConsolePrint(oController.debugConsole, 'REFLECTION: Unable to find ROOM section.');
        return false;
    }
    
    var roomSize = buffer_read(handle, buffer_u32);
    
    // Read rooms
    var roomCount = buffer_read(handle, buffer_u32);
    var offsetStack = ds_stack_create();
    
    for(var i = 0; i < roomCount; ++i)
    {
        var roomDataOffset = buffer_read(handle, buffer_u32);
        ds_stack_push(offsetStack, buffer_tell(handle));
        buffer_seek(handle, buffer_seek_start, roomDataOffset);
        
        // Read room
        var r = ds_map_create();
        r[? 'name'] = RefReadString(handle);
        r[? 'caption'] = RefReadString(handle);
        r[? 'width'] = buffer_read(handle, buffer_u32);
        r[? 'height'] = buffer_read(handle, buffer_u32);
        r[? 'speed'] = buffer_read(handle, buffer_u32);
        r[? 'persistent'] = buffer_read(handle, buffer_u32);
        r[? 'bg-color'] = buffer_read(handle, buffer_u32);
        r[? 'draw-bg-color'] = buffer_read(handle, buffer_u32);
        r[? 'creation-code'] = RefReadString(handle);
        r[? 'clear-display-buffer'] = buffer_read(handle, buffer_u32); // Might also be views
        buffer_read(handle, buffer_u32); // Backgrounds offset
        buffer_read(handle, buffer_u32); // Views offset
        
        // Read instances
        r[? 'instances'] = ds_list_create();
        var instancesDataOffset = buffer_read(handle, buffer_u32);
        ds_stack_push(offsetStack, buffer_tell(handle));
        buffer_seek(handle, buffer_seek_start, instancesDataOffset);
        
        var instanceCount = buffer_read(handle, buffer_u32);
        for(var j = 0; j < instanceCount; ++j)
        {
            var instanceDataOffset = buffer_read(handle, buffer_u32);
            ds_stack_push(offsetStack, buffer_tell(handle));
            buffer_seek(handle, buffer_seek_start, instanceDataOffset);
            
            var inst = ds_map_create();
            inst[? 'x'] = buffer_read(handle, buffer_u32);
            inst[? 'y'] = buffer_read(handle, buffer_u32);
            inst[? 'id'] = buffer_read(handle, buffer_u32);
            inst[? 'creation-code'] = buffer_read(handle, buffer_u32);
            // ????
            
            ds_list_add(r[? 'instances'], inst);
            
            buffer_seek(handle, buffer_seek_start, ds_stack_pop(offsetStack));
        }
        
        buffer_seek(handle, buffer_seek_start, ds_stack_pop(offsetStack));
        
        buffer_read(handle, buffer_u32); // Views offset
        
        ds_map_add(global._ref_Rooms, asset_get_index(r[? 'name']), r);
        
        buffer_seek(handle, buffer_seek_start, ds_stack_pop(offsetStack));
    }
    
    buffer_delete(handle);
    
    // DEBUG - Dump reflected rooms
    show_debug_message(concat('Reflected ', ds_map_size(global._ref_Rooms), ' rooms'));
    var fr = room_first;
    while(fr != room_last)
    {
        var meta = global._ref_Rooms[? fr];
        show_debug_message(concat(fr, ' - ', meta[? 'name']));
        
        fr = room_next(fr);
    }
    
    return true;
}

