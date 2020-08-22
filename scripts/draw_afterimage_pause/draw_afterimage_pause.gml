/// @description draw_afterimage_pause(frameskip);
/// @param frameskip
function draw_afterimage_pause() {

	// Draws an instance's afterimage without updating it. 

	var grid = afterimage_ds_grid;

	if (!ds_exists(grid, ds_type_grid)) {
		exit;
	}

	// draw the afterimage
	gpu_set_alphatestref(floor(ds_grid_get_min(grid, 1, 7, ds_grid_width(grid)-1, 7) * draw_get_alpha() * 255));
	for (var i=1; i<ds_grid_width(grid); i+=argument[0]+1) {
	    if (grid[# i, 7] > 0) {
	        draw_sprite_ext(grid[# i, 0], grid[# i, 1], grid[# i, 2], grid[# i, 3], grid[# i, 4], grid[# i, 5], grid[# i, 6], image_blend, grid[# i, 7] * draw_get_alpha());
	    }
	}

	gpu_set_alphatestref(254);


}
