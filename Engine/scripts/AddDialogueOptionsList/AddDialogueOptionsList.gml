/// @description  AddDialogueOptions(dialogue, side, portrait, name, message, script, option-array)
/// @function  AddDialogueOptions
/// @param dialogue
/// @param  side
/// @param  portrait
/// @param  name
/// @param  message
/// @param  script
/// @param  option-array

{
    var options = argument6;
    with(argument0)
    {
        var entry = ds_map_create();
        entry[? "type"] = 1;
        entry[? "side"] = argument1;
        entry[? "portrait"] = argument2;
        entry[? "name"] = argument3;
        entry[? "value"] = argument4;
        entry[? "script"] = argument5;
        entry[? "option-count"] = array_length_1d(options);
        
        for(var i = 0; i < array_length_1d(options); ++i)
            entry[? concat("option_", i)] = options[i];
            
        ds_list_add(dialogue, entry);
    }
}

