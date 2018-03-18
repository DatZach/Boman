/// @description  ConsoleExecute(console);
/// @function  ConsoleExecute
/// @param console
{
    // Arguments
    var console = argument0;
    
    if (!console[? "active"])
        return 0;
    
    // Parse input
    var rawCommand = string_trim(keyboard_string);
    var commandParts = string_parse(rawCommand, " ", true);
    if (ds_list_size(commandParts) < 1)
    {
        ds_list_destroy(commandParts);
        return 0;
    }
    
    var commandName = string_lower(commandParts[| 0]);
    ds_list_delete(commandParts, 0);
    
    // Execute input
    var commands = console[? "commands"];
    for(var i = 0; i < ds_list_size(commands); ++i)
    {
        var command = commands[| i];
        if (string_lower(command[? "name"]) != commandName)
            continue;
        
        script_execute(command[? "scriptId"], console, commandParts);
        ds_list_destroy(commandParts);
        keyboard_string = "";
        
        ConsoleToggle(console);
        return 1;
    }
    
    // Couldn't find a suitable function
    ConsolePrint(console, "Unrecognized command '" + commandName + "'");
    ds_list_destroy(commandParts);
    
    return 0;
}

