/// @description  Initialize checkpoint toast

// Never allow more than 1 checkpoint toast to exist
if (instance_number(oCheckpointToast) > 1)
{
    instance_destroy();
    exit;
}

// CONSTANTS
MESSAGE = "Checkpoint Reached";

outlineColor = make_color_rgb(107, 126, 136);
selectColor = make_color_rgb(103, 161, 219);
blackColor = make_color_rgb(28, 30, 32);
whiteColor = make_color_rgb(252, 250, 233);

// VARIABLES
length = 0;
incLength = false;
intensity = 1;
targetIntensity = 1;
bugFix = true;

image_speed = 2;
image_index = 0;


