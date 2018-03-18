/// @description  ConsoleToggle(console);
/// @function  ConsoleToggle
/// @param console
{
    var console = argument0;
    console[? "active"] = !console[? "active"];
    console[? "seen-history"] = ds_list_size(console[? "history"]);
    keyboard_string = "";
}
