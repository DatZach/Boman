///key_check(key, event)

/* This script appropriately handles player input, given a key and event.
 * We use this to make support for multiple input types (gamepads) easier.
 * key: K_LEFT, K_RIGHT, K_UP, K_DOWN, K_JUMP, K_FIRE, K_START
 * event: E_PRESS, E_DOWN, E_RELEASE
 */ 

key   = argument0;
event = argument1;

// Define the default keyboard controls for each player.
switch (PLAYER_NUMBER) {
  case 1: { // PLAYER
    switch (key) {
      case K_LEFT: {
        return handle_event(global.k_left);
      }
      case K_RIGHT: {
        return handle_event(global.k_right);
      }
      case K_UP: {
        return handle_event(global.k_up);
      }
      case K_DOWN: {
        return handle_event(global.k_down);
      }
      case K_JUMP: {
        return handle_event(global.k_jump);
      }
      default: {
        assert("Unable to handle unrecognized key: " + string(key));
        break;
      }
    }
    break;
  }
  
  case 2: { // MOB
    switch (key) {
      case K_LEFT: {
        return moveLeft;
      }
      case K_RIGHT: {
        return moveRight;
      }
      case K_UP: {
        return moveUp;
      }
      case K_DOWN: {
        return moveDown;
      }
      case K_JUMP: {
        return moveJump;
      }
      default: {
        assert("Unable to handle unrecognized key: " + string(key));
        break;
      }
    }
    break;
  }
  
  default: {
    assert("Default keyboard controls for player #" + string(PLAYER_NUMBER) + " haven't been specified.");
    break;
  }
}


