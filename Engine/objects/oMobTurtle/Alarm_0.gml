/// @description  Handle movement

if (place_meeting(x + dir, y, pStaticSolid))
{
    moveLeft = !moveLeft;
    moveRight = !moveRight;
}
else
{
    var chance = irandom(100);
    if (chance < 10)
    {
        moveLeft = false;
        moveRight = false;
    }
    else if (chance < 50)
    {
        moveLeft = irandom(100) < 50;
        moveRight = !moveLeft;
    }
}

alarm[0] = room_speed;



