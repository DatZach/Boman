/// AddBombs(bombs);

{
    var bombs = argument0;
    global.bombs += bombs;
    
    if (global.bombs < 0)
    {
        global.bombs = 0;
        return false;
    }
    
    if (global.bombs > global.maxBombs)
    {
        global.bombs = global.maxBombs;
        return false;
    }
    
    return true;
}
