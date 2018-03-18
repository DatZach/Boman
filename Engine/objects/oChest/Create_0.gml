/// @description  Initialize chest

enum ChestType {
    None        = 0,
    Level       = 1,
    Static      = 2
}

image_speed = 0;
type = ChestType.None;
level = 0;
items = noone;
opened = false;
locked = false;

if (!RELEASE_MODE)
    alarm[0] = 1;


