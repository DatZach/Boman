/// @description  ResizeWindow(width, height);
/// @function  ResizeWindow
/// @param width
/// @param  height
{
    var width = argument0;
    var height = argument1;
    
    show_debug_message("Resolution = " + string(width) + "x" + string(height));
    window_set_size(width, height);
    surface_resize(application_surface, width, height);
    oController.alarm[0] = 1;
}

