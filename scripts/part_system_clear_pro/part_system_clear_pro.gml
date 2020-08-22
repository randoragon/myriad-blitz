/// @description part_system_clear_pro(system)
/// @param system
function part_system_clear_pro() {

	//removes all particles from a system. Works for lite systems as well.

	var grid = argument[0];
	ds_grid_resize(grid, grid[# 0, 2] + 1, ds_grid_height(grid));
	ds_grid_set_region(grid, 1, 0, ds_grid_width(grid)-1, 0, -1);
	grid[# 0, 3] = grid[# 0, 2];


}
