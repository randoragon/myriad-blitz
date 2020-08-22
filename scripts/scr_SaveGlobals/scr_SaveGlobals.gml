/// @description scr_SaveGlobals(args)
/// @param args
function scr_SaveGlobals() {

	var args = argument[0];
	var progress_max = args[2];

	// These MUST be first in this order, because obj_slot_load needs them
	save_append(args, SAVE_DATA_GLOBALS);
	save_append(args, VER);
	save_append(args, global.chrsel);
	save_append(args, global.points);
	save_append(args, global.realm);

	// This is read when loading slots to render the progress bar and percentage
	save_append(args, progress_max);

	save_append(args, boss.lastpresent);
	save_append(args, global.spawnrate);
	save_append(args, global.gpspeed);
	save_append(args, global.prev_gpspeed);
	save_append(args, global.gpspeed_state);
	save_append(args, global.gpspeed_focus);
	save_append(args, global.gpspeed_ultimate_activation);
	save_append(args, global.gpspeed_ultimate);
	save_append(args, global.gpstep);
	save_append(args, global.viewxstartpos);
	save_append(args, global.viewystartpos);
	save_append(args, random_get_seed());
	save_append(args, global.shader_conditions);
	save_append(args, global.enemy_details_selection);
	save_append(args, boss.last_ult);
	save_append(args, global.kill_count);
	save_append(args, boss.dizzy_alpha);

	for (var i = 0; i < 8; i++) {
		var name, sindex;
		name = sprite_get_name(global.background_sprite[i]);
		sindex = global.save_sindex[? name];
		if (is_undefined(sindex)) {
			if (sindex >= 0) {
				show_debug_message("WARNING: background \"" + name + "\" (sprite_index=" + string(global.background_sprite[i]) + ") is not mapped in global.save_sindex!");
			}
			sindex = -1;
		}
		save_append(args, sindex);
		save_append(args, global.background_image_index[i]);
		save_append(args, global.background_image_speed[i]);
		save_append(args, global.background_x[i]);
		save_append(args, global.background_y[i]);
		save_append(args, global.background_htiled[i]);
		save_append(args, global.background_vtiled[i]);
		save_append(args, global.background_hspeed[i]);
		save_append(args, global.background_hspeed[i]);
	}

	args[@ 0] += args[@ 1];


}
