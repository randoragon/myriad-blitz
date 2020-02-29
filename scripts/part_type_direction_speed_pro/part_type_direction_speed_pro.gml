/// @description part_type_direction_speed_pro(part_id, dir_min, dir_max, dir_incr, dir_wiggle, speed_min, speed_max, speed_incr, speed_wiggle);
/// @param part_id
/// @param dir_min
/// @param dir_max
/// @param dir_incr
/// @param dir_wiggle
/// @param speed_min
/// @param speed_max
/// @param speed_incr
/// @param speed_wiggle

var part = global.part_type[argument[0]];
var a = 14;

part[| a++] = argument[1];
part[| a++] = argument[2];
part[| a++] = argument[3];
part[| a++] = argument[4];
part[| a++] = argument[5];
part[| a++] = argument[6];
part[| a++] = argument[7];
part[| a]   = argument[8];