/// @description  SpawnItem(item, x, y, bounce);
/// @function  SpawnItem
/// @param item
/// @param  x
/// @param  y
/// @param  bounce

{
    var item = argument0;
    var xx = argument1;
    var yy = argument2;
    var bounce = argument3;
    
    if (item == noone)
    {
        ConsolePrint(oController.debugConsole, "Attempted to spawn non-existant item.");
        return false;
    }
    else
        show_debug_message(concat("Spawning item ", item[? "name"]));
    
    var inst = instance_create(xx, yy, oItem);
    inst.item = item;
    inst.image_index = item[? "image-index"];
    
    if (bounce)
    {
        var angle = irandom_range(90 - 45, 90 + 45);
        inst.hspd = lengthdir_x(2, angle);
        inst.vspd = lengthdir_y(2, angle);
    }
    
    return true;
}

