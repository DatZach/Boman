/// Platforming Initialization
event_inherited();

PLAYER_NUMBER = 0;

dir = 1;               // Player direction. 1 = right, -1 = left.
xspeed = 0.0;          // Horizontal speed.
yspeed = 0.0;          // Vertical speed.
xmaxspeed = 3.0;       // Horizontal speed limit.
ymaxspeed = 8.0;       // Vertical speed limit.

weight = 0.4;          // How fast the player falls.
accel = 1.5;           // How fast the player accelerates horizontally.
xfriction = 1.0;       // How fast the player decelerates horizontally.
jumpHeight = 6.5;      // How high the player jumps.

maxDoubleJumps = 1;    // Number of possible additional jumps. 
availableJumps = 0;    // Number of available additional jumps.
maxWallJumps = 2;
availableWallJumps = 0;
canDoubleJump = false; // Whether or not player can do an additional jump.
canWalljump = true;    // Whether or not player can walljump.

isClimbing = false;    // Whether or not player is climbing.
isJumping = false;     // Whether or not player is jumping.
isDismounting = false; // Whether or not player is dismounting a ladder.
isWallsliding = false; // Whether or not player is sliding down a wall.
isLedgeGrabbing = false;

dismount_max = 20;     // Max number of ladder dismounting frames.
landing_max = 10;      // Max number of landing frames.

dismount = 0;          // Remaining number of ladder dismounting frames.
landing = 0;           // Remaining number of landing frames.

xsave = 0;
ysave = 0;

dynPlatformLedgeGrabInst = noone;
