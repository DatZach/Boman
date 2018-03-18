/// @description  ConsolePrint(console, message);
/// @function  ConsolePrint
/// @param console
/// @param  message
{
    // Arguments
    var console = argument0;
    var message = argument1;
    
    var history = console[? "history"];
    
    ds_list_add(history, message);
    show_debug_message(message);
}
