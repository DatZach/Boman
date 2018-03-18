/// @description  Platforming Logic

if (global.gamePaused) exit;

var jtColliding = false;

// Track previous x/y
px = x;
py = y;

// VELOCITY HANDLING ==================================================

// Clamp velocities
var absXSpeed = abs(xspeed);
if (absXSpeed > xmaxspeed)
{
    if (absXSpeed - xmaxspeed < 1)
        xspeed = xmaxspeed * sign(xspeed);
    else
    {
        xspeed = lerp(xspeed, xmaxspeed * sign(xspeed), 0.01);
    }
}

var absYSpeed = abs(yspeed);
if (absYSpeed > ymaxspeed)
{
    if (absYSpeed - ymaxspeed < 1)
        yspeed = ymaxspeed;
    else
        yspeed = lerp(yspeed, ymaxspeed * sign(yspeed), 0.1);
}

if (isLedgeGrabbing)
    yspeed = 0;

var colInst = instance_place(x, y + 4, pDynamicSolid);
if (colInst != noone || dynPlatformLedgeGrabInst != noone) {
    // ON TOP OF A DYNAMIC SOLID (MOVING PLATFORMS)
    
    if (yspeed > 0)
        yspeed = 0;
    
    if (colInst == noone)
        colInst = dynPlatformLedgeGrabInst;
        
    x += xspeed + colInst.x - colInst.px;
    y += yspeed + colInst.y - colInst.py;
    x = floor(x);
    y = floor(y);
    
    if (place_meeting(x + xspeed, y, pStaticSolid)) {
        x -= xspeed + colInst.x - colInst.px;
        xspeed = 0;
    }
    
    if (dynPlatformLedgeGrabInst == noone)
        move_contact_solid(270, 4);
    else if (!place_meeting(x + 4 * dir, y, pDynamicSolid)) {
        isLedgeGrabbing = false;
        dynPlatformLedgeGrabInst = noone;
    }
}
else {
    // Everything else
    
    // 1. VERTICAL VELOCITY
    if (yspeed >= 0 && collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + yspeed + 1, pJumpThrough, false, true) != noone) {
        // ON TOP OF JUMP-THROUGH PLATFORM
        if (yspeed > 0) {
            isClimbing = false;
            isJumping = false;
            isDismounting = false;
            landing = landing_max;
            dismount = dismount_max;
            y = floor(y);
        }
        
        move_contact_all(point_direction(x, y, x, y + yspeed + 1), yspeed + 1);
        yspeed = 0;
        jtColliding = true;
    }
    else {
        // IN AIR OR COLLIDING WITH STATIC SOLID (BLOCKS)
        
        // HACK This is a bullshit hack to fix mobs not handling collisions with other mobs and the player correctly
        var _inst = instance_place(x, y + yspeed, pStaticSolid);
        if (_inst == noone || _inst == oPlayer.id || object_is_ancestor(_inst.object_index, pMob)) {
              y += yspeed;
        }
        else {
            // Landing.
            if (yspeed > 0) {
                isClimbing = false;
                isJumping = false;
                isDismounting = false;
                landing = landing_max;
                dismount = dismount_max;
                y = floor(y);
            }
            
            move_contact_solid(point_direction(x, y, x, y + yspeed), yspeed);
          
            if (place_meeting(x, y, pStaticSolid))
                move_outside_solid(point_direction(x, y, x, y - max(yspeed, 4)), max(yspeed, 4));
            
            yspeed = 0;
        }
    }
    
    // Horizontal Velocity
    var xSign = sign(xspeed);
    if (xspeed > 0)
        xsave += xspeed - floor(xspeed);
    else if (xspeed < 0)
        xsave += abs(xspeed - ceil(xspeed));
    
    if (xsave >= 1)
        xsave = -1;
    
    var xrep = abs(xspeed);
    if (xsave == -1)
    {
        ++xrep;
        xsave = 0;
    }
    
    xrep = floor(xrep);
    
    repeat(xrep) {
        if (!place_meeting(x + xSign, y + 1, pStaticSolid) &&
             place_meeting(x + xSign, y + 2, pStaticSolid)) {
            // SLOPE DOWN
            // if (id == oPlayer.id) show_debug_message('hspd - slope down');
            x += sign(xspeed);
            y += 1;
        }
        else {
            // HACK This is a bullshit hack to fix mobs not handling collisions with other mobs and the player correctly
            var _inst = instance_place(x + xSign, y, pStaticSolid);
            var horzOnlyCollision = _inst != noone &&
                                    _inst != oPlayer.id &&
                                    _inst.solid; //!object_is_ancestor(_inst.object_index, pMob);
            
            if (_inst != noone && !place_meeting(x + xSign, y - 1, pStaticSolid)) {
                // SLOPE UP
                // if (id == oPlayer.id) show_debug_message('hspd - slope up');
                x += sign(xspeed);
                y -= 1;
            }
            else if (!horzOnlyCollision) {
                // LEFT-RIGHT FREE
                // if (id == oPlayer.id) show_debug_message('hspd - left/right free');
                x += sign(xspeed);
            }
            else {
                // COLLIDING WITH SOLID
                
                // if (id == oPlayer.id) show_debug_message('hspd - colliding with solid');
                
                // HACK This if statement fixes mobs being treated as solid objects
                //      if there's a way to properly fix this in the future it would be better
                //      We have retarded collision checks in place otherwise
                var _mobInst = instance_place(x + xSign, y, pMob);
                if (_inst != oPlayer.id && (_mobInst != noone && _mobInst.solid))
                    move_contact_solid(point_direction(x, y, x + xspeed, y), xspeed);
                    
                xspeed = 0;
                break;
            }
        }
        
        x = floor(x);
    }
}

// ENVIRONMENT INTERACTIONS

isWallsliding = false;

if (isClimbing == false) {
    var prevDir = dir;
  
    // Handle directions
    if (key_check(K_LEFT, E_PRESS) || (key_check(K_LEFT, E_DOWN) && key_check(K_RIGHT, E_RELEASE))) {
        dir = -1;
    }
    
    if (key_check(K_RIGHT, E_PRESS) || (key_check(K_RIGHT, E_DOWN) && key_check(K_LEFT, E_RELEASE))) {
        dir = 1; 
    }
  
    // Ledge Grabbing
    if (isLedgeGrabbing && prevDir != dir) {
        // JUMP ACROSS FROM LEDGE GRAB
        isLedgeGrabbing = false;
        dynPlatformLedgeGrabInst = noone;
        xspeed = xmaxspeed * 4 * dir;
        yspeed = -jumpHeight;
        isJumping = true;
    }
    else if (isLedgeGrabbing && key_check(K_JUMP, E_DOWN)) {
        // JUMP UP FROM LEDGE GRAB
        isLedgeGrabbing = false;
        dynPlatformLedgeGrabInst = noone;
        yspeed = -jumpHeight;
        isJumping = true;
    }
    else if (isLedgeGrabbing && key_check(K_DOWN, E_DOWN)) {
        // DROP DOWN FROM LEDGE GRAB
        isLedgeGrabbing = false;
        dynPlatformLedgeGrabInst = noone;
    }
  
    // Jumping from air
    var floorCollision = place_meeting(x, y + 1, pStaticSolid);
    if (!floorCollision && !jtColliding) {
        // CURRENTLY IN THE AIR
        yspeed += weight;
    
        if (!key_check(K_JUMP, E_DOWN)) {
            canDoubleJump = true;
        }
    
        // Wall jump
        var rightStaticSolidCol = place_meeting(x + 4, y, pStaticSolid);
        var leftStaticSolidCol = place_meeting(x - 4, y, pStaticSolid);
        
        if (availableWallJumps > 0 && canWalljump && key_check(K_JUMP, E_PRESS)) {
            if (rightStaticSolidCol) {
                xspeed = -xmaxspeed * 4;
                yspeed = -jumpHeight;
                isJumping = true;
            }
      
            if (leftStaticSolidCol) {
                xspeed = xmaxspeed * 4;
                yspeed = -jumpHeight;
                isJumping = true;
            }
            
            --availableWallJumps;
        }
        
        // Wall slide
        
        if (rightStaticSolidCol && key_check(K_RIGHT, E_DOWN) ||
            leftStaticSolidCol && key_check(K_LEFT, E_DOWN)) {
            
            if ((dir == -1 && collision_point(bbox_left  - 4, bbox_top - 3, pStaticSolid, false, true) == noone && collision_point(bbox_left  - 4, bbox_top, pStaticSolid, false, true) != noone) ||
                (dir ==  1 && collision_point(bbox_right + 4, bbox_top - 3, pStaticSolid, false, true) == noone && collision_point(bbox_right + 4, bbox_top, pStaticSolid, false, true) != noone))
            {
                isLedgeGrabbing = true;
                dynPlatformLedgeGrabInst = instance_place(x + 4 * dir, y, pDynamicSolid);
            }
            else if (yspeed > ymaxspeed / 6) {
                isWallsliding = true;
                yspeed = ymaxspeed / 6;
            }
        }
        // Double jump
        else if (availableJumps > 0 && key_check(K_JUMP, E_PRESS) && canDoubleJump == true) {
            --availableJumps;
            yspeed = -jumpHeight;
            xspeed = xmaxspeed * (0 - key_check(K_LEFT, E_DOWN) + key_check(K_RIGHT, E_DOWN));
            isJumping = true;
        }
        
        // Jump cancel
        var jumpHeightHalf = -jumpHeight * 0.5;
        if (!key_check(K_JUMP, E_DOWN) && isJumping && yspeed < jumpHeightHalf) {
            yspeed = jumpHeightHalf;
        }
    }
    // Jumping from ground
    else {
        availableJumps = maxDoubleJumps;
        availableWallJumps = maxWallJumps;
        canDoubleJump = false;
        
        if (key_check(K_JUMP, E_PRESS)) {
            yspeed = -jumpHeight;
            xspeed = xmaxspeed * (0 - key_check(K_LEFT, E_DOWN) + key_check(K_RIGHT, E_DOWN));
            isJumping = true;
        }
    }
      
    // Horizontal acceleration.
    if (key_check(K_LEFT, E_DOWN) && xspeed > -xmaxspeed && dir == -1) {
        xspeed -= accel;
    }
    
    if (key_check(K_RIGHT, E_DOWN) && xspeed < xmaxspeed && dir == 1) {
        xspeed += accel;
    }
      
    // Horizontal friction.
    if (!key_check(K_LEFT, E_DOWN) && !key_check(K_RIGHT, E_DOWN)) {
        if (abs(xspeed) > xfriction) {
            xspeed -= sign(xspeed) * xfriction;
        } else {
            xspeed = 0;
        }
    }
      
    // Climbing on to ladder.
    if (place_meeting(x, y, pClimbable) && !isDismounting) {
        if (key_check(K_UP, E_DOWN) && place_meeting(x, y - 8, pClimbable)) {
            isClimbing = true;
            dismount = dismount_max;
        }
        
        if (key_check(K_DOWN, E_DOWN) && place_meeting(x, y + 8, pClimbable) && !floorCollision) {
            isClimbing = true;
            dismount = dismount_max;
        }
    }
    // Drop from jump-through platforms
    else if (key_check(K_DOWN, E_DOWN) && yspeed == 0 && jtColliding && !floorCollision)
        y += 1;
}
// Movement on ladder:
else {
    xspeed = 0;
    yspeed = 0;
  
    // Stop climbing.
    if (!place_meeting(x, y, pClimbable)) {
        isClimbing = false;
    }
  
    // Handle direction.
    if (key_check(K_LEFT, E_PRESS)) {
        dir = -1;
    }
     
    if (key_check(K_RIGHT, E_PRESS)) {
        dir = 1;
    }
  
    if ((key_check(K_LEFT, E_DOWN) || key_check(K_RIGHT, E_DOWN)) && place_meeting(x + dir, y, pClimbable)) {
        xspeed += 2 * dir;
        dismount = dismount_max;
    }
    else if ((key_check(K_LEFT, E_DOWN) || key_check(K_RIGHT, E_DOWN)) && !place_meeting(x + dir, y, pClimbable)) {
        // Dismounting counter.      
        dismount -= 1;
    }
    else {
        dismount = dismount_max;
    }
  
    // Go down the ladder.
    if (place_meeting(x, y+8, pClimbable) && key_check(K_DOWN, E_DOWN)) {
        yspeed = 2.0;
        
        if (place_meeting(x, y+1, pStaticSolid) || jtColliding) {
            is_climbing = false;
        }
    }
    
    // Go up the ladder.
    if (place_meeting(x, y-8, pClimbable) && key_check(K_UP, E_DOWN)) {
        yspeed = -2.0;
    }
  
    // Dismounting.
    if ((key_check(K_UP, E_PRESS) && !place_meeting(x, y - 8, pClimbable)) || dismount <= 0) {
        isClimbing = false;
        isDismounting = true;
        if (dismount <= 0) {
            xspeed = (xmaxspeed / 2) * dir;
        }
        
        if (!key_check(K_DOWN, E_DOWN)) {
            yspeed = -6;
        }
    }
}


