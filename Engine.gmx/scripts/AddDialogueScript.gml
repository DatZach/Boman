/// AddDialogueScript(dialogue, side, portrait, name, script, value);

{
    with(argument0)
    {
        var entry = ds_map_create();
        entry[? 'side'] = argument1;
        entry[? 'portrait'] = argument2;
        entry[? 'name'] = argument3;
        entry[? 'script'] = argument4;
        entry[? 'value'] = argument5;
        
        ds_list_add(dialogue, entry);
    }
}

