/// @description  Initialization

if (instance_number(oDeathOverlay) > 1)
{
    instance_destroy();
    exit;
}

// CONSTANTS
outlineColor = make_color_rgb(107, 126, 136);
selectColor = make_color_rgb(103, 161, 219);
blackColor = make_color_rgb(28, 30, 32);
whiteColor = make_color_rgb(252, 250, 233);

// VARIABLES
intensity = 0;
targetIntensity = 1;

flavorText = "No one will remember you.";


