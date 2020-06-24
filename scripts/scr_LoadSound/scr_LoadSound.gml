/// @description scr_LoadSound(data)
/// @param data

var args = argument[0];

var aindex, apitch, apos, snd;

aindex = string_readln_real(args);
if (!ds_map_exists(global.save_aname, aindex)) {
	show_debug_message("WARNING: aindex " + string(aindex) + " has no corresponding value in global.save_aname!");
}

aid    = asset_get_index(global.save_aname[? aindex]);
apitch = string_readln_real(args);
apos   = string_readln_real(args);

if (string_copy(global.save_aname[? aindex], 1, 4) == "mus_") {
	snd = play_music(aid, 1, apitch * 100);
} else {
	snd = play_sfx(aid, 0, apitch * 100);
}

audio_sound_set_track_position(snd, apos);
audio_sound_gain(snd, 0, 0);
audio_pause_sound(snd);