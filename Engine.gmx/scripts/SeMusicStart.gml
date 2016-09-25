/// SeMusicStart(sound, flags)
/// Plays a song with the specified flags

enum MusicFlags {
    None        = 0,
    HardStart   = 1,
    Transition  = 2
}

{
    var sound = argument0;
    var flags = argument1;
    
    if (sound == noone)
    {
        if (global.SE_CurrentMusic != noone)
        {
            audio_sound_gain(global.SE_CurrentMusic, 0, 1000);
            global.SE_PreviousMusic = global.SE_CurrentMusic;
            global.SE_CurrentMusic = noone;
            oController.alarm[11] = 1000;
        }
        
        return 0;
    }
    
    if (global.SE_CurrentMusic == sound)
        return 0;
    
    if (HasFlag(flags, MusicFlags.Transition))
    {
        audio_sound_gain(sound, 0, 0);
        audio_sound_gain(sound, global.SE_MusicVolume, 1000);
        
        if (global.SE_CurrentMusic != noone)
        {
            audio_sound_gain(global.SE_CurrentMusic, 0, 1000);
            oController.alarm[11] = 1000;
        }
    }
    
    var tmp = audio_play_sound(sound, 100, true);
    global.SE_PreviousMusic = global.SE_CurrentMusic;
    global.SE_CurrentMusic = tmp;
    
    return 1;
}

