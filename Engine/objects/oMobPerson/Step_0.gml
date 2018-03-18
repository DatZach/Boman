/// @description  Handle random movement

moveJump = false;

if (irandom(8) == 1)
{
    var i = irandom(7);
    moveLeft = iff(i == 0, moveLeft, iff(irandom(4) != 1, moveLeft, !moveLeft));
    moveRight = iff(i == 1, moveRight, iff(irandom(12) != 1, moveRight, !moveRight));
    moveUp = iff(i == 3, moveUp, iff(irandom(5) != 1, moveUp, !moveUp));
    if (!moveUp)
        moveDown = iff(i == 4, moveDown, iff(irandom(5) != 1, moveDown, !moveDown));
    
    if (i == 5)
        moveJump = true;
}

if (place_meeting(x, y, oPlayer))
{
    with (oPlayer)
    {
        if (AddHp(-1))
            Knockback(other.px, other.py, 1);
    }
}


action_inherited();
///Image Handling

// Draw the appropriate sprites:
if (place_meeting(x, y+1, pStaticSolid) || (collision_line(x, y, x, y + yspeed + 1, pJumpThrough, false, true) != noone && yspeed >= 0)) {
  if (xspeed == 0) {
    // Idle.
    sprite_index = s_dude_idle;
  }
  else {
    // Running.
    if (sign(xspeed) == sign(dir)) {
      sprite_index = s_dude_run;
    }
    // Skidding.
    else {
      sprite_index = s_dude_skid;
    }
  }
}
else {
  // Jumping.
  sprite_index = s_dude_jump;
  image_index = 1 + sign(yspeed);
  if (abs(yspeed) < 2) {
    image_index = 1;
  }
}
// Landing.
if (landing > 0) {
  landing -= 1;
  sprite_index = s_dude_land;
}
// Climbing.
if (isClimbing) {
    sprite_index = s_dude_climb;
    if (dismount < dismount_max && yspeed == 0) {
      sprite_index = s_dude_climb_off;
    }
    if (!place_meeting(x, y-8, oDBGLadder) && !place_meeting(x, y-8, oVine)) {
      sprite_index = s_dude_climb_top;
    }
  
  image_index = floor(y/16); 
}

// Configure image speeds.
image_speed = 1.0;

if (sprite_index == s_dude_run || s_dude_gun_run) {
  image_speed = 0.2;
}

// Handle image direction.
image_xscale = dir;

if (dying) {
    sprite_index = s_dude_dead;
}


