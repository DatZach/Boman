/// @description  Handle health
if (hp <= 0 && !undefeatable && !dying)
{
    dying = true;
    alarm[11] = room_speed * 2;
}

if (dying)
{
    aflame = false;
    moveLeft = false;
    moveRight = false;
    moveJump = false;
    moveDown = false;
    moveUp = false;
    isClimbing = false;
    isJumping = false;
    
    ys = sign(yspeed);
    if (ys == 0)
        ys = 1;
        
    var inst = instance_place(x + sign(xspeed), y + ys, pStaticSolid);
    if (inst != noone && !object_is_ancestor(inst.object_index, pMob) && inst != oPlayer)
        instance_destroy();
}

action_inherited();
