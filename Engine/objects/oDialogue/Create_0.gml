/// @description  Initialize dialogue

// CONSTANTS
DIALOGUE_SPEED = 100 / room_speed;

enum DSide {
    Left,
    Right
}

// Colors
outlineColor = make_color_rgb(107, 126, 136);
selectColor = make_color_rgb(103, 161, 219);
blackColor = make_color_rgb(28, 30, 32);
whiteColor = make_color_rgb(252, 250, 233);

// Dialogue Variables
surf = -1;
dialogue = ds_list_create();
segments = ds_list_create();
diagIndex = 0;
charIndex = 0;
prevCharIndex = 0;
doubleTap = false;
waiting = false;
canWait = true;
awaitingKey = false;                                    // NOTE This is purely for visuals
optionIndex = 0;
backdrop = noone;
windowOffset = 0;

portrait[DSide.Left] = noone;
portrait[DSide.Right] = noone;
portraitFrame[DSide.Left] = 0;
portraitFrame[DSide.Right] = 0;
namePlate[DSide.Left] = "";
namePlate[DSide.Right] = "";

intensity = 0;
targetIntensity = 0.7;

alarm[0] = 1;


