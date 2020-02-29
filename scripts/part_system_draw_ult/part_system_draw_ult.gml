/// @description part_system_draw_ult(system);
/// @param system

var grid       = argument[0];
var oldtonew   = grid[# 0, 1];
var grid_width = ds_grid_width(grid);
var part, source;

if (oldtonew == 1) {
    for(var i = 1; i < grid_width; i++) {
        part = grid[# i, 0];
        if (part == -1) { continue; }
		source = global.part_type[part];
        gpu_set_blendmode(source[| 8]);
        draw_sprite_ext(source[| 0], source[| 1], grid[# i, 4], grid[# i, 5], grid[# i, 1], grid[# i, 1], grid[# i, 2], source[| 9], grid[# i, 3]);
    }
} else {
    for(var i = grid_width - 1; i > 1; i--) {
        part = grid[# i, 0];
        if (part == -1) { continue; }
        gpu_set_blendmode(source[| 8]);
        draw_sprite_ext(source[| 0], source[| 1], grid[# i, 4], grid[# i, 5], grid[# i, 1], grid[# i, 1], grid[# i, 2], source[| 9], grid[# i, 3]);
    }
}

gpu_set_blendmode(bm_normal);