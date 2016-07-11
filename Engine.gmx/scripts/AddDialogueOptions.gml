/// AddDialogueOptions(dialogue, side, portrait, name, message, script, option0, option1, ...)

{
    var ARG_OFFSET = 6;
    
    with(argument[0])
    {
        var entry = ds_map_create();
        entry[? 'type'] = 1;
        entry[? 'side'] = argument[1];
        entry[? 'portrait'] = argument[2];
        entry[? 'name'] = argument[3];
        entry[? 'value'] = argument[4];
        entry[? 'script'] = argument[5];
        entry[? 'option-count'] = argument_count - ARG_OFFSET;
        
        for(var i = ARG_OFFSET; i < argument_count; ++i)
            entry[? concat('option_', i - ARG_OFFSET)] = argument[i];
            
        ds_list_add(dialogue, entry);
    }
}

