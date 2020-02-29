/// @description part_type_gravity_pro(part_id, speed, acceleration, dir_min, dir_max)
/// @param part_id
/// @param speed
/// @param acceleration
/// @param dir_min
/// @param dir_max

var part = global.part_type[argument[0]];
var a = 22;

part[| a++] = argument[1];
part[| a++] = argument[2];
part[| a++] = argument[3];
part[| a]   = argument[4];