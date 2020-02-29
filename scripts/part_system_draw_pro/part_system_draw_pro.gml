/// @description part_system_draw_pro(system);
/// @param system

var grid       = argument[0];
var oldtonew   = grid[# 0, 1];
var grid_width = ds_grid_width(grid);
var part, source, sprite, scale, life_percentage;

if (oldtonew == 1) { 
    for (var i = 1; i < grid_width; i++) {
        part = grid[# i, 0];
        if (part ==  -1) { continue; }
		source = global.part_type[part];
        sprite          = source[| 0];
        scale           = grid[# i, 3] / max(sprite_get_width(sprite), sprite_get_height(sprite));
        life_percentage = grid[# i, 2] / grid[# i, 13];
        gpu_set_blendmode(source[| 26]);
        draw_sprite_ext(sprite, grid[# i, 1], grid[# i, 11], grid[# i, 12], scale, scale, grid[# i, 4], merge_color(grid[# i, 9], grid[# i, 15], 1 - life_percentage), lerp(grid[# i, 10], grid[# i, 16], 1 - life_percentage));
    }
} else {
    for (var i = grid_width - 1; i > 1; i--) {
        part = grid[# i, 0];
        if (part ==  -1) { continue; }
        sprite          = source[| 0];
        scale           = grid[# i, 3] / max(sprite_get_width(sprite), sprite_get_height(sprite));
        life_percentage = grid[# i, 2] / grid[# i, 13];
        gpu_set_blendmode(source[| 26]);
        draw_sprite_ext(sprite, grid[# i, 1], grid[# i, 11], grid[# i, 12], scale, scale, grid[# i, 4], merge_color(grid[# i, 9], grid[# i, 15], 1 - life_percentage), lerp(grid[# i, 10], grid[# i, 16], 1 - life_percentage));
    }
}

gpu_set_blendmode(bm_normal);