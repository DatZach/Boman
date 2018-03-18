/// @description  Handle death

if (global.hp <= 0 && alarm[1] < 0 && !instance_exists(oDeathOverlay))
{
    alarm[1] = 2 * room_speed;
}

// Don't do anything if we have no health and have run our timer out
if (global.hp == 0)
{
    sprite_index = s_dude_dead;
    exit;
}

/// Handle platforming

if (global.DBG_NoClip)
{
    var spd = iff(keyboard_check(vk_shift), 10, 4);
    x += (CheckKey(global.k_right, E_DOWN) - CheckKey(global.k_left, E_DOWN)) * spd;
    y += (CheckKey(global.k_down, E_DOWN) - CheckKey(global.k_up, E_DOWN)) * spd;
    
    if (keyboard_check(vk_space))
        global.DBG_NoClip = false;
}
else
{
    // Sound Effects (TODO - Break into another event?)
    if (CheckKey(global.k_jump, E_PRESS))
        sfx(sfxJump);
    
    // Platforming Engine
    event_inherited();
}


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

if (global.hp <= 0)
    sprite_index = s_dude_dead;


/// Calculate Bow Strength

strength = point_distance(oPlayer.x, oPlayer.y, mouse_x, mouse_y) * 0.06;


/// Action Key handling

if (CheckKey(global.k_action, E_PRESS) && !global.gamePaused && global.interactionIcon == InteractionIcon.None)
{
    var item = GetEquippedItem(Slot.Primary);
    if (item == noone)
        exit;
    
    if (mouse_check_button(mb_left))
    {
        // Apply item to arrow
        switch(item[? "db-item-index"])
        {
            case global.ITEM_Bomb:
                if (InventoryRemoveIndex(global.inventory, global.primaryItemIndex))
                    currentArrowStatusEffect = item[? "db-item-index"];
                break;
                
            case global.ITEM_Lantern:
                currentArrowStatusEffect = item[? "db-item-index"];
                break;
        }
    }
    else
    {
        // Do item mechanic
        UseEquippedItem(item);
    }
}


