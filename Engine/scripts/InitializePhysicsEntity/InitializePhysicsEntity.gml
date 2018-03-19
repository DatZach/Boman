/// @description  InitializePhysicsEntity(angle, velocity, weight, bouncy);
/// @function  InitializePhysicsEntity
/// @param angle
/// @param  velocity
/// @param  weight
/// @param  bouncy
// Refer to oPhysicsEntity for details on these properties

{
	event_inherited();
	
    angle = argument0;
    velocity = argument1;
    weight = argument2;
    bouncy = argument3;
    
    hspd = lengthdir_x(velocity, angle);
    vspd = lengthdir_y(velocity, angle);
    
    var inst = instance_place(x, y, oBlock);
    if (inst != noone)
    {
        show_debug_message(concat("c1 = ", x, "/", y, "; c2 = ", inst.x, "/", inst.y, "; l1 = ", bbox_left, "; l2 = ", inst.bbox_left, "; r1 = ", bbox_right, "; r2 = ", inst.bbox_right));
        
        if (!(bbox_left >= inst.bbox_left && bbox_right <= inst.bbox_right))
        {
            if (bbox_left < inst.bbox_left)
                x -= bbox_right - inst.bbox_left;
            else
                x += inst.bbox_right - bbox_left;
        }
        
        if (!(bbox_top >= inst.bbox_top && bbox_bottom <= inst.bbox_bottom))
        {
            if (bbox_top > inst.bbox_top)
                y += inst.bbox_bottom - bbox_top;
            else
                y -= bbox_bottom - inst.bbox_top;
        }
    }
}
