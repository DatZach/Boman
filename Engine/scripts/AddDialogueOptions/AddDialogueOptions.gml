/// @description  AddDialogueOptions(dialogue, side, portrait, name, message, script, option0, option1, ...)
/// @function  AddDialogueOptions
/// @param dialogue
/// @param  side
/// @param  portrait
/// @param  name
/// @param  message
/// @param  script
/// @param  option0
/// @param  option1
/// @param  ...

{
    var ARG_OFFSET = 6;
    
    with(argument[0])
    {
        var entry = ds_map_create();
        entry[? "type"] = 1;
        entry[? "side"] = argument[1];
        entry[? "portrait"] = argument[2];
        entry[? "name"] = argument[3];
        entry[? "value"] = argument[4];
        entry[? "script"] = argument[5];
        entry[? "option-count"] = argument_count - ARG_OFFSET;
        
        for(var i = ARG_OFFSET; i < argument_count; ++i)
            entry[? concat("option_", i - ARG_OFFSET)] = argument[i];
            
        ds_list_add(dialogue, entry);
    }
}

