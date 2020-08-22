/// @description part_system_edit_lt(system, draw_oldtonew,base_slots,limit)
/// @param system
/// @param draw_oldtonew
/// @param base_slots
/// @param limit
function part_system_edit_lt() {

	// set limit to -1 for infinity

	var grid = argument[0];

	grid[# 0, 1] = argument[1];

	if (grid[# 0, 2] != argument[2]) {
	    var prev_base_slots = grid[# 0, 2];
	    grid[# 0, 2]        = argument[2];

	    // if the new base_slots is larger than the current one, increase the grid's size and fill the new places with -1's.
	    if (grid[# 0, 2] > prev_base_slots) {
	        var grid_width = ds_grid_width(grid);
	        ds_grid_resize(grid, max(argument[2] + 1, grid_width), ds_grid_height(grid));
	        if (ds_grid_width(grid) > grid_width) {
	            ds_grid_set_region(grid, grid_width, 0, ds_grid_width(grid) - 1, 0, -1);
	            grid[# 0, 3] += ds_grid_width(grid) - grid_width;
	        }
	    }
	}

	if (grid[# 0, 4] != argument[3]) {
	    grid[# 0, 4] = argument[3];

	    // shrink the grid if the current size is larger than the new limit
	    if (grid[# 0, 4] > 0 && ds_grid_width(grid) - 1 > grid[# 0, 4]) {
	        var free_count = 0;
	        while (ds_grid_value_exists(grid, grid[# 0, 4] + 1, 0, ds_grid_width(grid) - 1, 0, -1)) {
	            grid[# ds_grid_value_x(grid, grid[# 0, 4] + 1, 0, ds_grid_width(grid) - 1, 0, -1), 0] = -2;
	            free_count++;
	        }
	        ds_grid_resize(grid, grid[# 0, 4] + 1, ds_grid_height(grid));
	        grid[# 0, 3] -= free_count;
	    }
	}


}
