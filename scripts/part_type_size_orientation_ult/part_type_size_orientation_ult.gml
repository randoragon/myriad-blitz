/// @description part_type_size_orientation_ult(part_id, size_min, size_max, size_incr, ang_min, ang_max, ang_incr);
/// @param part_id
/// @param size_min
/// @param size_max
/// @param size_incr
/// @param ang_min
/// @param ang_max
/// @param ang_incr
function part_type_size_orientation_ult() {

	// size_2 = 0; this means the end size is going to be 0
	// size_2 = 1; this means the size is going to be constant for the entire lifespan
	// size_2 = 2; this means the end size is going to be twice the initial amount
	// random_rot_dir is a boolean value that determines whether to randomize the direction of angle spin.

	var part = global.part_type[argument[0]];
	var a = 2;

	part[| a++] = argument[1];
	part[| a++] = argument[2];
	part[| a++] = argument[3];
	part[| a++] = argument[4];
	part[| a++] = argument[5];
	part[| a]   = argument[6];


}
