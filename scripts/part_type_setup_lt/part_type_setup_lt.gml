/// @description part_type_setup_lt(sprite, subimg, life_min, life_max);
/// @param sprite
/// @param subimg
/// @param life_min
/// @param life_max

// The height in the 2d array is the unique ID of each part type.

var grid, a;
if (!ds_exists(global.part_type_lt_grid[0], ds_type_grid)) {
    global.part_type_lt_grid[0] = ds_grid_create(1, 21);
    grid                        = global.part_type_lt_grid[0];
    a                           = 0;
} else {
    grid = global.part_type_lt_grid[0];
    if (ds_grid_value_exists(grid, 0, 0, ds_grid_width(grid) - 1, 0, -1)) {
        a =  ds_grid_value_x(grid, 0, 0, ds_grid_width(grid) - 1, 0, -1);
    } else {
        ds_grid_resize(grid, ds_grid_width(grid) + 1, 21);
        a = ds_grid_width(grid) - 1;
    }
}

var b = 0;

grid[# a, b++] = argument[0]; // 0. sprite_index
grid[# a, b++] = argument[1]; // 1. image_index
grid[# a, b++] = argument[2]; // 2. life_min
grid[# a, b++] = argument[3]; // 3. life_max

grid[# a, b++] = 1; // 4. size_min
grid[# a, b++] = 1; // 5. size_max
grid[# a, b++] = 0; // 6. size_incr
grid[# a, b++] = 0; // 7. angle_min
grid[# a, b++] = 0; // 8. angle_max
grid[# a, b++] = 0; // 9. angle_incr
grid[# a, b++] = 0; // 10. rotation_dir

grid[# a, b++] = 0; // 11. dir_min
grid[# a, b++] = 0; // 12. dir_max
grid[# a, b++] = 0; // 13. speed_min
grid[# a, b++] = 0; // 14. speed_max
grid[# a, b++] = 0; // 15. speed_incr

grid[# a, b++] = bm_normal; // 16. blend_mode
grid[# a, b++] = c_white;   // 17. color1
grid[# a, b++] = c_white;   // 18. color2
grid[# a, b++] = 1;         // 19. alpha1
grid[# a, b]   = 1;         // 20. alpha2

return a;