/// @description music_volume(volume,time)
/// @param volume
/// @param time
for(var i=0; i<array_length_1d(global.music); i++) {
    if(audio_is_playing(global.music[i])) {
        audio_sound_gain(global.music[i],argument[0],argument[1]);
    }
}

