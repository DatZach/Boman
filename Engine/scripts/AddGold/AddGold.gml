/// @description  AddGold(gold);
/// @function  AddGold
/// @param gold

{
    var gold = argument0;
    global.gold += gold;
    
    if (global.gold < 0)
    {
        global.gold = 0;
        return false;
    }
    
    if (global.gold > global.maxGold)
    {
        global.gold = global.maxGold;
        return false;
    }
    
    return true;
}
