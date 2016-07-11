/// InitializeMob(hp, level, dropRate)
/*
 *  hp              :   HP of Mob
 *                      -1 means undefeatable
 *  level           :   Level of mob (Used for drops)
 *  dropRate        :   Rate at which mob will drop items
 */

{
    var _hp = argument0;
    var _level = argument1;
    var _dropRate = argument2;
    
    if (_hp < 0)
    {
        _hp = 1;
        undefeatable = true;
    }
    else
        undefeatable = false;
    
    maxHp = _hp;
    hp = maxHp;
    level = _level;
    dropRate = _dropRate;
    
    if (sprite_index != -1)
    {
        var aabbWidth = bbox_right - bbox_left;
        var aabbHeight = bbox_bottom - bbox_top;
        var xx = 0, yy = 0;
        
        repeat(max(irandom(aabbWidth / aabbHeight * 6), 3))
        {
            xx += irandom(aabbWidth / 3) + 3;
            yy += irandom(aabbHeight / 3) + 3;
            xx %= aabbWidth;
            yy %= aabbHeight;
            
            ds_list_add(flamePoints, xx);
            ds_list_add(flamePoints, yy);
        }
    }
}

