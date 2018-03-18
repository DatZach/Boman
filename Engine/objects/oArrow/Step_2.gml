/// @description  Update Image Angle

if (hspd != 0 && vspd != 0)
{
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
        
    angle = lerp(angle, newAngle, 0.25);
}


