/// @description play_music(soundid, priority, loops, pitch[%])
/// @param soundid
/// @param priority
/// @param loops
/// @param pitch[%]

var pitchpercentage = (argument_count >= 4 ? argument[3] : 100);

for (var musiccount = 0; musiccount < array_length_1d(global.music); musiccount++) {
    if ((!audio_is_playing(global.music[musiccount]) || (audio_sound_get_gain(global.music[musiccount]) == 0 && global.muspercentage > 0))) {
        if (audio_is_playing(global.music[musiccount])) { audio_stop_sound(global.music[musiccount]); }
        global.music[musiccount] = audio_play_sound(argument[0], argument[1], argument[2]);
        audio_sound_gain (global.music[musiccount], global.muspercentage / 100, 0);
        audio_sound_pitch(global.music[musiccount], pitchpercentage / 100);
        return global.music[musiccount];
        exit;
    }
}

global.music[array_length_1d(global.music)] = audio_play_sound(argument[0], argument[1], argument[2]);
audio_sound_gain (global.music[array_length_1d(global.music) - 1], global.muspercentage / 100, 0);
audio_sound_pitch(global.music[array_length_1d(global.music) - 1], pitchpercentage / 100);
return global.music[array_length_1d(global.music) - 1];