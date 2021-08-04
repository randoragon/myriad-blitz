/// @description play_sfx(soundid, loops, 'pitch%)
/// @param soundid
/// @param loops
/// @param 'pitch[%]
function play_sfx() {

	var soundid, priority, loops, pitch;
	soundid = argument[0];
	loops = argument[1];
	pitch = (argument_count == 3)? argument[2] / 100 : 1;

	priority = global.sound_priority[? "sfx"];
	if (ds_map_exists(global.sound_priority, audio_get_name(argument[0]))) {
		priority = global.sound_priority[? audio_get_name(argument[0])];
	}

	for (var sfxcount=0; sfxcount < array_length(global.sfx); sfxcount++) {
	    if (!audio_is_playing(global.sfx[sfxcount]) || (audio_sound_get_gain(global.sfx[sfxcount]) == 0 && global.sfxpercentage > 0)) {
	        if (audio_is_playing(global.sfx[sfxcount])) {
				audio_stop_sound(global.sfx[sfxcount]);
			}
	        global.sfx[sfxcount] = audio_play_sound(soundid, priority, loops);
	        audio_sound_gain (global.sfx[sfxcount], global.sfxpercentage / 100, 0);
	        audio_sound_pitch(global.sfx[sfxcount], pitch);
	        return global.sfx[sfxcount];
	    }
	}

	global.sfx[array_length(global.sfx)] = audio_play_sound(soundid, priority, loops);
	audio_sound_gain (global.sfx[array_length(global.sfx) - 1], global.sfxpercentage / 100, 0);
	audio_sound_pitch(global.sfx[array_length(global.sfx) - 1], pitch);
	return global.sfx[array_length(global.sfx) - 1];


}
