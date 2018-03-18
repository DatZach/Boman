if (global.gamePaused) exit;
if (global.arrows <= 0)
    exit;

var mx = oCursor.x;
var my = oCursor.y;
var rot = point_direction(x, y, mx, my);
var xx = x + lengthdir_x(28, rot);
var yy = y + lengthdir_y(28, rot);
var inst = instance_create(xx, yy, oArrow);
with(inst)
{
    angle = rot;
    hspd = lengthdir_x(other.strength, angle);
    vspd = lengthdir_y(other.strength, angle);
    statusEffect = other.currentArrowStatusEffect;
}
    
show_debug_message("strength = " + string(strength));

AddArrows(-1);


