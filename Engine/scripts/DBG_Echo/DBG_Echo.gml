{
    var console = argument0;
    var arguments = argument1;
    
    var str = "";
    for(var i = 0; i < ds_list_size(arguments); ++i)
        str += arguments[| i] + " ";
    
    ConsolePrint(console, "Echo: " + str);
}
