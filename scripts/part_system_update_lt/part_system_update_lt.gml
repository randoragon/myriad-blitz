/// @description part_system_update_lt(system,  step)
/// @param system
/// @param step
function part_system_update_lt() {

	if (argument[1] == 0)  { exit; }

	var grid       = argument[0];
	var step	   = argument[1];
	var grid_width = ds_grid_width(grid);
	var busy_slots = grid[# 0, 2] - grid[# 0, 3];
	var part, source;

	for(var i = 1; i < grid_width; i++) {
		part = grid[# i, 0];

		if (part != -1) {
			source = global.part_type[part];
			// reduce life and size
			grid[# i, 2] -= step;
			grid[# i, 4] += step * source[| 6];
		}

		// When particle is dead or should be dead
		if (grid[# i, 2] <= 0 || grid[# i, 4] <= 0 || part == -1) {
			if (busy_slots > 0) {
				if (part == -1) continue;
				grid[# i, 0] = -1;
				grid[# 0, 3]++;
				busy_slots--;
			} else if (part != -1 || busy_slots < 0) {
				if (i < ds_grid_width(grid)-1) ds_grid_set_grid_region(grid, grid, i+1, 0, grid_width-1, ds_grid_height(grid)-1, i, 0);
				ds_grid_resize(grid, --grid_width, ds_grid_height(grid));
				if (part == -1) { grid[# 0, 3]--; busy_slots++; }
				i--;
			}
		} else {
			// update other data
			grid[# i, 8] += step * lengthdir_x(grid[# i, 7], grid[# i, 6]); // x
			grid[# i, 9] += step * lengthdir_y(grid[# i, 7], grid[# i, 6]); // y
			grid[# i, 5] += step * source[| 9]*grid[# i, 10];			// angle
			grid[# i, 7] += step * source[| 15];						// speed
		}
	}




}
