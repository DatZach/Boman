/// @description  AddArrowSegments(segments);
/// @function  AddArrowSegments
/// @param segments

{
    var segments = argument0;
    
    global.arrowSegments += segments;
    
    if (global.arrowSegments < 0)
    {
        global.arrowSegments = 0;
        return false;
    }
    
    var maxArrowSegments = sprite_get_number(sHudBrokenArrow);
    if (global.arrowSegments >= maxArrowSegments)
    {
        global.arrowSegments = 0;
        return true;
    }
    
    return false;
}

