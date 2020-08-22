/// @description part_type_wipe_lt(part_id, system)
/// @param part_id
/// @param part_system
function part_type_wipe_lt() {

	// removes all particles of a provided type from a system.

	// This function works for all particle systems and types (pro, lt, ult).

	// If no particle system is given, all are checked.

	if (argument_count == 2) {
		var part	   = argument[0];
		var grid       = argument[1];
		var grid_width = ds_grid_width(grid);
		for (var i = 1; i < grid_width; i++) {
		    if (grid[# i, 0] == part) {
		        if (grid[# 0, 3] < grid[# 0, 2]) {
		            grid[# i, 0] = -1;
		            grid[# 0, 3]++;
		        } else {
		            if (i < ds_grid_width(grid) - 1) { ds_grid_set_grid_region(grid, grid, i + 1, 0, grid_width - 1, ds_grid_height(grid) - 1, i, 0); }
		            ds_grid_resize(grid, --grid_width, ds_grid_height(grid));
		            i--;
		        }
		    }
		}
	} else {
		for (var i = 0; i < array_length_1d(global.part_system); i++) {
			part_type_wipe_lt(argument[0], global.part_system[i]);
		}
	}



}
