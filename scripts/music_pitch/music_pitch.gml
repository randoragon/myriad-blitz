/// @description music_pitch(pitch)
/// @param pitch
for(var i=0; i<array_length_1d(global.music); i++) {
    if(audio_is_playing(global.music[i])) {
        audio_sound_pitch(global.music[i],argument[0]);
    }
}

