/// ConsoleAddCommand(console, commandName, script);
{
    var console = argument0;
    var commandName = argument1;
    var script = argument2;
    
    var command = ds_map_create();
    command[? 'name'] = string_lower(commandName);
    command[? 'scriptId'] = script;
    
    ds_list_add(console[? 'commands'], command);
}

