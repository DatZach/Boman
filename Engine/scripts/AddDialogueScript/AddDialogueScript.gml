/// @description  AddDialogueScript(dialogue, side, portrait, name, script, value);
/// @function  AddDialogueScript
/// @param dialogue
/// @param  side
/// @param  portrait
/// @param  name
/// @param  script
/// @param  value

{
    with(argument0)
    {
        var entry = ds_map_create();
        entry[? "type"] = 0;
        entry[? "side"] = argument1;
        entry[? "portrait"] = argument2;
        entry[? "name"] = argument3;
        entry[? "script"] = argument4;
        entry[? "value"] = argument5;
        
        ds_list_add(dialogue, entry);
    }
}

