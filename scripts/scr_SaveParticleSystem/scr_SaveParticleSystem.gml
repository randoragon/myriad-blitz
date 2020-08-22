/// @description scr_SaveParticleSystem(args)
/// @param args
function scr_SaveParticleSystem() {

	var args = argument[0];

	if (!global.save_particles || !ds_exists(args[@ 2], ds_type_grid)) {
		exit;
	}

	save_append(args, SAVE_DATA_PART_SYSTEM);

	/* We have to save the index of the particle system,
	 * not the ds_grid ID. To find the index we traverse
	 * the global.part_system array.
	 */
	var j = -1;
	for (var i = 0; i < array_length_1d(global.part_system); i++) {
		if (global.part_system[i] == args[@ 2]) {
			j = i;
		}
	}
	if (j == -1) {
		show_debug_message("WARNING: No part_system index found for ds_grid " + string(args[@ 2]) + "!");
	}
	save_append(args, j);

	args[@ 0] += ds_grid_export(args[@ 2]);

	args[@ 0] += args[@ 1];


}
