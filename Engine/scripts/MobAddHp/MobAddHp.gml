/// @description  MobAddHp(points, inst);
/// @function  MobAddHp
/// @param points
/// @param  inst

{
    var hp = argument0;
    var inst = argument1;
    
    if (hp < 0)
    {
        if (inst.invincible)
            return false;
        
        with(inst)
            event_user(0);
    }
    
    inst.hp += hp;
    
    if (inst.hp < 0)
    {
        inst.hp = 0;
        return false;
    }
    
    if (inst.hp > inst.maxHp)
    {
        inst.hp = inst.maxHp;
        return false;
    }
    
    return true;
}
