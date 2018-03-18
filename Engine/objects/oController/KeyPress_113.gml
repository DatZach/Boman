repeat(5)
{
    var xx = choose(irandom_range(oPlayer.x - 80, oPlayer.x - 32), irandom_range(oPlayer.x + 32, oPlayer.x + 80));
    var yy = oPlayer.y - 48;
    
    if (!place_meeting(xx, yy, pStaticSolid))
        instance_create(xx, yy, oMobPerson);
}

