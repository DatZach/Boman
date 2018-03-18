/// @description  Initialize Physics

/*
 *  This parent object enables children to havoc in the world properly.
 *  It is intended for objects that need to havoc but not platform.
 *  Examples: Bombs, Coins, Rubble, etc
 *  
 *  This does NOT include: Pushable blocks, moving blocks, mobs, etc
 */

angle = 0;              // Direction of vector (normal GM directionals)
velocity = 0;           // Velocity of vector
weight = 0;             // How much gravity affects this object
bouncy = true;          // If this entity will bounce when it hits the ground

maxBounces = 5;         // Maximum bounces - kind of a hack
maxVspd = 7;            // Maximum hspd - will lerp back to this if it goes above
maxHspd = 7;            // Maximum vspd - will lerp back to this if it goes above

bounceCount = 0;
hsave = 0;
vsave = 0;

// Initial calculation of hspd/vspd
hspd = lengthdir_x(velocity, angle);
vspd = lengthdir_y(velocity, angle);


/* */
/*  */
