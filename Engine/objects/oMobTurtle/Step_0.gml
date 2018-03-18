/// @description  Handle player jumping on me

solid = immobile;

// NOTE Keep these if statements nested like this for performance reasons
if (!immobile)
{
    var inst = instance_place(x, y - 1, oPlayer);
    if (inst != noone && inst.yspeed > 0)
    {
        moveLeft = false;
        moveRight = false;
        inst.yspeed = -inst.ymaxspeed * 0.4;
        immobile = true;
        alarm[1] = room_speed * immobileSeconds;
    }
}
else
{
    var inst = collision_rectangle(bbox_left - 1, bbox_top, bbox_right + 1, bbox_bottom, pPlatformingEntity, false, true);
    if (inst == noone) {
        moveLeft = false;
        moveRight = false;
    }
    else {
        if (inst.xspeed < 0) {
            moveLeft = true;
            moveRight = false;
        } else if (inst.xspeed > 0) {
            moveLeft = false;
            moveRight = true;
        } else {
            moveLeft = false;
            moveRight = false;
        }
    }
}

action_inherited();
/// Handle animations

image_xscale = dir;
sprite_index = iff(immobile, sMobTurtleImmobile, sMobTurtleIdle);


