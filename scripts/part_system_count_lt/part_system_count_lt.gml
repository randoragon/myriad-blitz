/// @description part_system_count_lt(system)
/// @param system
function part_system_count_lt() {

	//Returns how many particles there are in a system.
	//Works on both lite and pro systems.

	var grid = argument[0];
	return (ds_grid_width(grid) - 1 - grid[# 0, 3]);


}
