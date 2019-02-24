/// @description play_sfx(soundid, priority, loops, pitch[%])
/// @param soundid
/// @param priority
/// @param loops
/// @param pitch[%]

var pitchpercentage = (argument_count >= 4 ? argument[3] : 100);

for (var sfxcount=0; sfxcount<array_length_1d(global.sfx); sfxcount++) {
    if (!audio_is_playing(global.sfx[sfxcount]) || (audio_sound_get_gain(global.sfx[sfxcount]) == 0 && global.sfxpercentage > 0)) {
        if (audio_is_playing(global.sfx[sfxcount])) { audio_stop_sound(global.sfx[sfxcount]); }
        global.sfx[sfxcount] = audio_play_sound(argument[0], argument[1], argument[2]);
        audio_sound_gain (global.sfx[sfxcount], global.sfxpercentage / 100, 0);
        audio_sound_pitch(global.sfx[sfxcount], pitchpercentage / 100);
        return global.sfx[sfxcount];
        exit;
    }
}

global.sfx[array_length_1d(global.sfx)] = audio_play_sound(argument[0], argument[1], argument[2]);
audio_sound_gain (global.sfx[array_length_1d(global.sfx) - 1], global.sfxpercentage / 100, 0);
audio_sound_pitch(global.sfx[array_length_1d(global.sfx) - 1], pitchpercentage / 100);
return global.sfx[array_length_1d(global.sfx) - 1];