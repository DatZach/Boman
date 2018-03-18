/// @description  Initialize

if (instance_number(oPauseMenu) > 1)
{
    instance_destroy();
    exit;
}

intensity = 0;
targetIntensity = 1;

selectedIndex = 0;

items[0] = "Options";
items[1] = "Return to Game";
items[2] = "Exit to Main Menu";


