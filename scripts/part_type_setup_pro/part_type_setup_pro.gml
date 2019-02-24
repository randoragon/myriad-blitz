/// @description part_type_setup_pro(sprite, subimg, imgspd, life_min, life_max);
/// @param sprite
/// @param subimg
/// @param imgspd
/// @param life_min
/// @param life_max

// The height in the 2d array is the unique ID of each part type.

var grid, a;
if (!ds_exists(global.part_type_pro_grid[0], ds_type_grid)) {
    global.part_type_pro_grid[0] = ds_grid_create(1, 31);
    grid                         = global.part_type_pro_grid[0];
    a                            = 0;
} else {
    grid = global.part_type_pro_grid[0];
    if (ds_grid_value_exists(grid, 0, 0, ds_grid_width(grid) - 1, 0, -1)) {
        a =  ds_grid_value_x(grid, 0, 0, ds_grid_width(grid) - 1, 0, -1);
    } else {
        ds_grid_resize(grid, ds_grid_width(grid) + 1, 31);
        a = ds_grid_width(grid) - 1;
    }
}

var b = 0;

grid[# a, b++] = argument[0]; // 0. sprite_index
grid[# a, b++] = argument[1]; // 1. image_index
grid[# a, b++] = argument[2]; // 2. image_speed
grid[# a, b++] = argument[3]; // 3. life_min
grid[# a, b++] = argument[4]; // 4. life_max

grid[# a, b++] = 1; // 5. size_min
grid[# a, b++] = 1; // 6. size_max
grid[# a, b++] = 0; // 7. size_incr
grid[# a, b++] = 0; // 8. size_wiggle
grid[# a, b++] = 0; // 9. angle_min
grid[# a, b++] = 0; // 10. angle_max
grid[# a, b++] = 0; // 11. angle_incr
grid[# a, b++] = 0; // 12. angle_wiggle
grid[# a, b++] = 0; // 13. angle_relative

grid[# a, b++] = 0; // 14. dir_min
grid[# a, b++] = 0; // 15. dir_max
grid[# a, b++] = 0; // 16. dir_incr
grid[# a, b++] = 0; // 17. dir_wiggle
grid[# a, b++] = 0; // 18. speed_min
grid[# a, b++] = 0; // 19. speed_max
grid[# a, b++] = 0; // 20. speed_incr
grid[# a, b++] = 0; // 21. speed_wiggle

grid[# a, b++] = 0; // 22. grav_speed
grid[# a, b++] = 0; // 23. grav_speed_incr
grid[# a, b++] = 0; // 24. grav_dir_min
grid[# a, b++] = 0; // 25. grav_dir_max

grid[# a, b++] = bm_normal; // 26. blend_mode
grid[# a, b++] = c_white;   // 27. color1
grid[# a, b++] = c_white;   // 28. color2
grid[# a, b++] = 1;         // 29. alpha1
grid[# a, b]   = 1;         // 30. alpha2

return a;