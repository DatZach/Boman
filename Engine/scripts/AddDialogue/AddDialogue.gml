/// @description  AddDialogue(dialogue, side, portrait, name, value);
/// @function  AddDialogue
/// @param dialogue
/// @param  side
/// @param  portrait
/// @param  name
/// @param  value

{
    with(argument0)
    {
        var entry = ds_map_create();
        entry[? "type"] = 0;
        entry[? "side"] = argument1;
        entry[? "portrait"] = argument2;
        entry[? "name"] = argument3;
        entry[? "script"] = noone;
        entry[? "value"] = argument4;
        
        ds_list_add(dialogue, entry);
    }
}

