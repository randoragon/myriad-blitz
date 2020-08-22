/// @description part_type_exists_pro(part_id, 'part_system)
/// @param part_id
/// @param part_system
function part_type_exists_pro() {

	// Checks whether or not a given particle type exists,
	// i.e. is being updated and drawn to the screen.

	// This function works for all particle systems and types (pro, lt, ult).

	// If no particle system is given, all are checked.

	if (argument_count == 2) {
		return ds_grid_value_exists(argument[1], 1, 0, ds_grid_width(argument[1])-1, 0, argument[0]);
	} else {
		for (var i = 0; i < array_length_1d(global.part_system); i++) {
			if (part_type_exists_pro(argument[0], global.part_system[i])) {
				return TRUE;
			}
		}
		return FALSE;
	}


}
