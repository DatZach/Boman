{
    var console = argument0;
    var arguments = argument1;
    
    var value = iff(is_undefined(arguments[| 0]), true, arguments[| 0] != '0');
    
    show_debug_overlay(value);
}
