/// @description  Handle Velocity / Collisions
if (global.gamePaused) exit;

// TODO Move into Begin Step so that it doesn't look like this is lagging
if (attachedEntity != noone)
{
    // We've landed in an object that moves
    //  just follow it
    
    // Unless it doesn't exist -- then fall
    if (!instance_exists(attachedEntity))
    {
        move_contact_solid(270, 2);
        attachedEntity = noone;
        vspd = 1;
        hspd = random_range(-0.5, 0.5);
        exit;
    }
    
    x += attachedEntity.x - attachedEntity.px;
    y += attachedEntity.y - attachedEntity.py;
}
else if (hspd != 0 || vspd != 0)
{
    // Handle vector through air
    var cx, cy, inst;
    
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
    var maxReps = max(hrep, vrep);
    var collisionOccurred = false;
    
    // Move each pixel until a collision is detected
    for(var i = 0; i < maxReps; ++i)
    {
        cx = x + lengthdir_x(6, angle);
        if (i < vrep)
        {
            cy = y + lengthdir_y(6, angle);
            inst = collision_circle(cx, cy, 2, pStaticSolid, false, true);
            if (inst != noone)
            {
                collisionOccurred = true;
                hspd = 0;
                vspd = 0;
                
                break;
            }

            y += ySign;
        }
        
        cy = y + lengthdir_y(6, angle);
        if (i < hrep)
        {
            cx = x + lengthdir_x(6, angle);
            inst = collision_circle(cx, cy, 2, pStaticSolid, false, true);
            if (inst != noone)
            {
                collisionOccurred = true;
                hspd = 0;
                vspd = 0;

                break;
            }

            x += xSign;
        }
    }
    
    if (collisionOccurred)
    {
        HandleArrowCollision(inst);
        exit;
    }
    
    hspd += weight *  cos(270 * pi / 180);
    vspd += weight * -sin(270 * pi / 180);
    
    if (hspd != 0 && vspd != 0)
        angle = CalculateSmoothAngle(hspd, vspd, angle);
}


