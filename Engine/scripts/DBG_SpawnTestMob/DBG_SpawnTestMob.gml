{
    var console = argument0;
    var arguments = argument1;
    
    repeat(10)
    {
        var xx = irandom_range(oPlayer.x - 32, oPlayer.x + 32);
        var yy = oPlayer.y - 48;
        
        if (!place_meeting(xx, yy, pStaticSolid))
            instance_create(xx, yy, oMobPerson);
    }
    
    ConsolePrint(console, "Mob Count = " + string(instance_number(oMobPerson)));
}
