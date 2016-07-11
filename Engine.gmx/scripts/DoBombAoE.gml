/// DoBombAoE(x, y);

{
    var xx = argument0;
    var yy = argument1;
    
    // Nearby bombs are detonated by this explosion
    with(oWeaponBomb)
    {
        if (id != other.id && distance_to_point(xx, yy) < BOMB_AOE_RADIUS)
            instance_destroy();
    }
    
    // Nearby arrows are destroyed
    with(oArrow)
    {
        if (distance_to_point(xx, yy) < BOMB_AOE_RADIUS)
            instance_destroy();
    }
    
    // Nearby vines are destroyed
    with(oVine)
    {
        if (distance_to_point(xx, yy) < BOMB_AOE_RADIUS)
            instance_destroy();
    }
    
    // Nearby mobs and players are hurt
    with(oPlayer)
    {
        var dist = distance_to_point(xx, yy);
        if (dist < BOMB_AOE_RADIUS)
        {
            var harm = floor((BOMB_AOE_RADIUS - dist) / BOMB_AOE_RADIUS * 6);
            if (AddHp(-harm))
                Knockback(xx, yy, harm);
        }
    }
    
    with(pMob)
    {
        var dist = distance_to_point(xx, yy);
        if (dist < BOMB_AOE_RADIUS)
        {
            var harm = floor((BOMB_AOE_RADIUS - dist) / BOMB_AOE_RADIUS * 6);
            if (MobAddHp(-harm, self))
                Knockback(xx, yy, harm);
        }
    }
    
    // Nearby rock walls are destroyed
    with(oRockWall)
    {
        if (distance_to_point(xx, yy) < BOMB_AOE_RADIUS)
            instance_destroy();
    }
}
