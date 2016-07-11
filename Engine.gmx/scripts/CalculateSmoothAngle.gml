/// CalculateSmoothAngle(hspd, vspd, angle);
{
    var hspd = argument0;
    var vspd = argument1;
    var angle = argument2;
    
    var refAngle = radtodeg(arctan(abs(vspd) / abs(hspd)));
    var newAngle = 0;
    
    if (hspd > 0 && vspd < 0)
        newAngle = refAngle;
    
    if (hspd > 0 && vspd > 0)
        newAngle = -refAngle;
        
    if (hspd < 0 && vspd < 0)
        newAngle = 180 - refAngle;
    
    if (hspd < 0 && vspd > 0)
        newAngle = 180 + refAngle;
        
    return lerp(angle, newAngle, 0.25);
}

