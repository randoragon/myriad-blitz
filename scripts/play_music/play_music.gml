/// @description play_music(soundid, loops, 'pitch%)
/// @param soundid
/// @param loops
/// @param 'pitch[%]

var soundid, priority, loops, pitch;
soundid = argument[0];
loops = argument[1];
pitch = (argument_count == 3)? argument[2] / 100 : 1;

priority = global.sound_priority[? "music"];
if (ds_map_exists(global.sound_priority, audio_get_name(argument[0]))) {
	priority = global.sound_priority[? audio_get_name(argument[0])];
}

for (var musiccount = 0; musiccount < array_length_1d(global.music); musiccount++) {
    if ((!audio_is_playing(global.music[musiccount]) || (audio_sound_get_gain(global.music[musiccount]) == 0 && global.muspercentage > 0))) {
        if (audio_is_playing(global.music[musiccount])) {
			audio_stop_sound(global.music[musiccount]);
		}
        global.music[musiccount] = audio_play_sound(soundid, priority, loops);
        audio_sound_gain(global.music[musiccount], global.muspercentage / 100, 0);
        audio_sound_pitch(global.music[musiccount], pitch);
        return global.music[musiccount];
    }
}

global.music[array_length_1d(global.music)] = audio_play_sound(soundid, priority, loops);
audio_sound_gain(global.music[array_length_1d(global.music) - 1], global.muspercentage / 100, 0);
audio_sound_pitch(global.music[array_length_1d(global.music) - 1], pitch);
return global.music[array_length_1d(global.music) - 1];
