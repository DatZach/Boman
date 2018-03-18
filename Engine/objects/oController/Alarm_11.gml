/// @description  SOUND_ENGINE - Fade Timer

if (global.SE_PreviousMusic != noone)
{
    audio_stop_sound(global.SE_PreviousMusic);
    global.SE_PreviousMusic = noone;
}


