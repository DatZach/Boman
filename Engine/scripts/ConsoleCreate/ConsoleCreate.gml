/// @description  ConsoleCreate
{
    var console = ds_map_create();
    
    console[? "active"] = false;
    console[? "delimiter"] = " ";
    console[? "cursor"] = 0;
    console[? "history"] = ds_list_create();
    console[? "commands"] = ds_list_create();
    console[? "seen-history"] = 0;
    
    return console;
}

