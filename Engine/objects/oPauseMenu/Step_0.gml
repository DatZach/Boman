/// @description  Handle input / Update intenzity

intensity = lerp(intensity, targetIntensity, 0.3);

if (targetIntensity == 0 && intensity < 0.02)
    instance_destroy();
    
if (targetIntensity == 0)
    exit;

if (CheckKey(global.k_toggle_pause_menu, E_PRESS))
{
    targetIntensity = 0;
}
else if (CheckKey(global.k_down, E_PRESS))
{
    ++selectedIndex;
    if (selectedIndex >= array_length_1d(items))
        selectedIndex = 0;
}
else if (CheckKey(global.k_up, E_PRESS))
{
    --selectedIndex;
    if (selectedIndex < 0)
        selectedIndex = array_length_1d(items) - 1;
}
else if (CheckKey(global.k_action, E_PRESS))
{
    switch(selectedIndex)
    {
        case 0: // Options
            break;
            
        case 1: // Resume Game
            targetIntensity = 0;
            break;
        
        case 2: // Return to Main Meun
            // TODO Return to main menu when one exists
            game_end();
            break;
    }
}


