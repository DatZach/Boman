var inst = collision_rectangle(x - 1, y, x + sprite_width + 1, y + sprite_height, pPlatformingEntity, false, true);
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

event_inherited();


