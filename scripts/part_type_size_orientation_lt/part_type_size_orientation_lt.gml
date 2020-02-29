/// @description part_type_size_orientation_lt(part_id, size_min, size_max, size_incr, ang_min, ang_max, ang_incr, random_rot_dir);
/// @param part_id
/// @param size_min
/// @param size_max
/// @param size_incr
/// @param ang_min
/// @param ang_max
/// @param ang_incr
/// @param random_rot_dir

// random_rot_dir is a boolean value that determines whether to randomize the direction of angle spin.

var part = global.part_type[argument[0]];
var a = 4;

part[| a++] = argument[1];
part[| a++] = argument[2];
part[| a++] = argument[3];
part[| a++] = argument[4];
part[| a++] = argument[5];
part[| a++] = argument[6];
part[| a]   = argument[7];