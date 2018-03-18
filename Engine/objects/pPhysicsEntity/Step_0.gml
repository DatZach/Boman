/// @description  Handle physics

if (hspd != 0 || vspd != 0)
{
    // Clamp velocities
    var absHspd = abs(hspd);
    if (absHspd > maxHspd)
    {
        if (absHspd - maxHspd < 1)
            hspd = maxHspd * sign(hspd);
        else
            hspd = lerp(hspd, maxHspd * sign(hspd), 0.01);
    }
    
    var absVspd = abs(vspd);
    if (absVspd > maxVspd)
    {
        if (absVspd - maxVspd < 1)
            vspd = maxVspd * sign(vspd);
        else
            vspd = lerp(vspd, maxVspd * sign(vspd), 0.01);
    }
    
    // Calculate x/y speed including subpixels
    var ySign = sign(vspd);
    if (vspd > 0)
        vsave += vspd - floor(vspd);
    else if (vspd < 0)
        vsave += abs(vspd - ceil(vspd));
    
    if (vsave >= 1)
        vsave = -1;
    
    var vrep = abs(vspd);
    if (vsave == -1)
    {
        ++vrep;
        vsave = 0;
    }
    
    var xSign = sign(hspd);
    if (hspd > 0)
        hsave += hspd - floor(hspd);
    else if (hspd < 0)
        hsave += abs(hspd - ceil(hspd));
    
    if (hsave >= 1)
        hsave = -1;
    
    var hrep = abs(hspd);
    if (hsave == -1)
    {
        ++hrep;
        hsave = 0;
    }
    
    hrep = floor(hrep);
    vrep = floor(vrep);
    
    // Move each pixel until a collision is detected
    repeat(vrep)
    {
        if (!place_free(x, y + sign(vspd)))
        {
            if (vspd < 0) // Bounce off ceilings
                vspd = -vspd * 0.9;
            else
            {
                // If hspd or vspd is really low and we're hitting the ground then
                // just stop hspd and vspd. This is so we stop doing havoc calculations
                if (hspd <= 0.5)
                    hspd = 0;
                
                if (vspd <= 0.5 || (bouncy && bounceCount > maxBounces))
                {
                    move_contact_solid(270, sprite_height);
                    vspd = 0;
                    exit;
                }
                
                if (bouncy)
                {
                    // Bounce off a floor if we're bouncy
                    vspd = -vspd * 0.55;
                    hspd *= 0.8;
                    ++bounceCount;
                }
                else
                {
                    // Otherwise just stick there
                    vspd = 0;
                    move_contact_solid(270, sprite_height);
                    exit;
                }
            }
        }

        y += sign(vspd);
    }
    
    repeat(hrep)
    {
        if (!place_free(x + sign(hspd), y))
            hspd = -hspd * 0.8;
        
        x += sign(hspd);
    }
    
    hspd += weight * lengthdir_x(velocity, 270);
    vspd += weight * lengthdir_y(velocity, 270);
}
else if (place_free(x, y + 1))
{
    velocity = 1;
    vspd = 1;
}


