/// @description  Knockback(originX, originY, power);
/// @function  Knockback
/// @param originX
/// @param  originY
/// @param  power

{
    var originX = argument0;
    var originY = argument1;
    var knockbackPower = argument2;
    
    var dir = point_direction(originX, originY, x, y);
    dir = sign(lengthdir_x(1, dir));
    
    var mspeed = min(xmaxspeed, ymaxspeed);
    xspeed = knockbackPower * 0.8 * mspeed * dir;
    yspeed = knockbackPower * 0.8 * -mspeed;
    
    show_debug_message(concat("xspeed = ", xspeed, "kp = ", knockbackPower, " xms = ", xmaxspeed, " dir = ", dir));
}
