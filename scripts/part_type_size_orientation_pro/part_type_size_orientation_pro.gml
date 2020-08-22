/// @description part_type_size_orientation_pro(part_id, size_min, size_max, size_incr, size_wiggle, ang_min, ang_max, ang_incr, ang_wiggle, ang_relative);
/// @param part_id
/// @param size_min
/// @param size_max
/// @param size_incr
/// @param size_wiggle
/// @param ang_min
/// @param ang_max
/// @param ang_incr
/// @param ang_wiggle
/// @param ang_relative
function part_type_size_orientation_pro() {

	var part = global.part_type[argument[0]];
	var a = 5;

	part[| a++] = argument[1];
	part[| a++] = argument[2];
	part[| a++] = argument[3];
	part[| a++] = argument[4];
	part[| a++] = argument[5];
	part[| a++] = argument[6];
	part[| a++] = argument[7];
	part[| a++] = argument[8];
	part[| a]   = argument[9];



}
