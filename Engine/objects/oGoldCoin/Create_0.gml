action_inherited();
/// Initialize physics

InitializePhysicsEntity(
    irandom_range(90 - 50, 90 + 50),
    max(1, irandom(3)),
    0.25,
    true
);

image_index = irandom(sprite_get_number(sprite_index));
image_speed = 0.25;

offset = irandom(500);
value = 0;

show_debug_message("Gold spawn");

