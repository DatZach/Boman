if (global.gamePaused) exit;

var inst = instance_place(x + xspeed, y, pStaticSolid);
if (inst != noone && inst != id)
    xspeed = -xspeed;

inst = instance_place(x + xspeed, y, pPlatformingEntity);
if (inst != noone)
    xspeed = -xspeed;


inst = instance_place(x, y + yspeed, pStaticSolid);
if (inst != noone && inst != id)
    yspeed = -yspeed;

inst = instance_place(x, y + yspeed, pPlatformingEntity);
if (inst != noone)
{
    with(inst)
    {
        if (place_meeting(x, y + other.yspeed, pStaticSolid))
            other.yspeed = -other.yspeed;
            
        if (place_meeting(x + other.xspeed, y, pStaticSolid))
            other.xspeed = -other.xspeed;
    }
}

if (x < 0 || x > room_width)
    xspeed = -xspeed;
    
if (y < 0 || y > room_height)
    yspeed = -yspeed;

px = x;
py = y;
x += xspeed;
y += yspeed;

