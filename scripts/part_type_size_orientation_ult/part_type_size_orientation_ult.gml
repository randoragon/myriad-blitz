/// @description part_type_size_orientation_ult(part, size_min, size_max, size_incr, ang_min, ang_max, ang_incr);
/// @param part
/// @param size_min
/// @param size_max
/// @param size_incr
/// @param ang_min
/// @param ang_max
/// @param ang_incr

// size_2 = 0; this means the end size is going to be 0
// size_2 = 1; this means the size is going to be constant for the entire lifespan
// size_2 = 2; this means the end size is going to be twice the initial amount
// random_rot_dir is a boolean value that determines whether to randomize the direction of angle spin.

var grid = global.part_type_ult_grid[0];
var a    = argument[0];
var b    = 2;

grid[# a, b++] = argument[1];
grid[# a, b++] = argument[2];
grid[# a, b++] = argument[3];
grid[# a, b++] = argument[4];
grid[# a, b++] = argument[5];
grid[# a, b]   = argument[6];