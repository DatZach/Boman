/// @description  Update intensity / Handle input

intensity = lerp(intensity, targetIntensity, 0.1);

if (intensity > 0.6 && CheckKey(global.k_action, E_PRESS))
{
    instance_destroy();
    with(oPlayer)
        event_user(1);
}


