/// SeSfx(sound, flags);
/// Plays a global sound effect

enum SoundFlags {
    None        = 0,
    Global      = 1
}

{
    var sound = argument0;
    var flags = argument1;
    
    if (sound == noone || global.SE_SFXVolume == 0)
        return 0;
    
    if (HasFlag(flags, SoundFlags.Global))
        audio_stop_sound(sound);
    
    var tmp = audio_play_sound(sound, 1, false);
    audio_sound_gain(tmp, global.SE_SFXVolume, 0);
    
    return 1;
}

