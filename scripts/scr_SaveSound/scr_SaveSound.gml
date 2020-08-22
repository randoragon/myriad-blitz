/// @description scr_SaveSound(args)
/// @param args
function scr_SaveSound() {

	var args = argument[0];
	var sid  = args[2];
	var sname = audio_get_name(sid);

	// Sanity check
	if (!ds_map_exists(global.save_aindex, sname)) {
		show_debug_message("WARNING: audio resource \"" + sname + "\" (id=" + string(sid) + ") is not mapped in global.save_aindex!");
	}

	save_append(args, SAVE_DATA_SOUND);
	save_append(args, global.save_aindex[? sname]);
	save_append(args, audio_sound_get_pitch(sid));
	save_append(args, audio_sound_get_track_position(sid));

	args[@ 0] += args[@ 1];


}
