/// @description part_type_direction_speed_lt(part_id, dir_min, dir_max, speed_min, speed_max, speed_incr);
/// @param part_id
/// @param dir_min
/// @param dir_max
/// @param speed_min
/// @param speed_max
/// @param speed_incr
function part_type_direction_speed_lt() {

	var part = global.part_type[argument[0]];
	var a = 11;

	part[| a++] = argument[1];
	part[| a++] = argument[2];
	part[| a++] = argument[3];
	part[| a++] = argument[4];
	part[| a]   = argument[5];


}
