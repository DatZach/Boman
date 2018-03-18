/// @description  AddHp(points);
/// @function  AddHp
/// @param points

{
    var hp = floor(argument0);
    if (hp < 0)
    {
        if (instance_exists(oPlayer))
        {
            if (oPlayer.invincible)
                return false;
                
            with(oPlayer)
                event_user(0);
        }
    }
    
    var prevHp = global.hp;
    global.hp += hp;
    
    if (global.hp < 0)
        global.hp = 0;
    
    if (global.hp > global.maxHp)
        global.hp = global.maxHp;
    
    return global.hp != prevHp;
}
