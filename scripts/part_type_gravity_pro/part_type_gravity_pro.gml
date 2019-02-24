/// @description part_type_gravity_pro(part, speed, acceleration, dir_min, dir_max)
/// @param part
/// @param speed
/// @param acceleration
/// @param dir_min
/// @param dir_max

var grid = global.part_type_pro_grid[0];
var a    = argument[0];
var b    = 22;

grid[# a, b++] = argument[1];
grid[# a, b++] = argument[2];
grid[# a, b++] = argument[3];
grid[# a, b]   = argument[4];