/// @description part_type_count_lt(part_id, 'part_system)
/// @param part_id
/// @param part_system
function part_type_count_lt() {

	// Returns how many of one particle type are in a system.

	// This function works for all particle systems and types (pro, lt, ult).

	// If no particle system is given, all are checked.

	var count = 0;

	if (argument_count == 2) {
		var grid = argument[1];
		for (var i = 1; i < ds_grid_width(argument[1]); i++) {
		    if (grid[# i, 0] == argument[0]) { count++; }
		}
	} else {
		for (var i = 0; i < array_length(global.part_system); i++) {
			count += part_type_count_lt(argument[0], global.part_system[i]);
		}
	}

	return count;


}
