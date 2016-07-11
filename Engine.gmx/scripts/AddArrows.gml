/// AddArrows(arrows);

{
    var arrows = floor(argument0);
    
    global.arrows += arrows;
    
    if (global.arrows < 0)
    {
        global.arrows = 0;
        return false;
    }
    
    if (global.arrows > global.maxArrows)
    {
        global.arrows = global.maxArrows;
        return false;
    }
    
    return true;
}

