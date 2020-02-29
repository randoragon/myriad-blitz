/// @description part_system_draw_lt(system);
/// @param system

var grid       = argument[0];
var oldtonew   = grid[# 0, 1];
var grid_width = ds_grid_width(grid);
var part, source, percentage;

if (oldtonew == 1) {
    for (var i = 1; i < grid_width; i++) {
        part = grid[# i, 0];
        if (part == -1) { continue; }
		source = global.part_type[part];
        percentage = 1 - (grid[# i, 2] / grid[# i, 3]);
        gpu_set_blendmode(source[| 16]);
        draw_sprite_ext(source[| 0], grid[# i, 1], grid[# i, 8], grid[# i, 9], grid[# i, 4], grid[# i, 4], grid[# i, 5], merge_color(source[| 17], source[| 18], percentage), lerp(source[| 19], source[| 20], percentage));
    }
} else {
    for (var i = grid_width - 1; i > 1; i--) {
    part = grid[# i, 0];
    if (part == -1) { continue; }
    percentage = 1 - (grid[# i, 2] / grid[# i, 3]);
    gpu_set_blendmode(source[| 16]);
    draw_sprite_ext(source[| 0], grid[# i, 1], grid[# i, 8], grid[# i, 9], grid[# i, 4], grid[# i, 4], grid[# i, 5], merge_color(source[| 17], source[| 18], percentage), lerp(source[| 19], source[| 20], percentage));
    }
}

gpu_set_blendmode(bm_normal);