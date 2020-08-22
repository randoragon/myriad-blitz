/// @description part_type_create_ult(sprite, subimg);
/// @param sprite
/// @param subimg
function part_type_create_ult() {

	// The height in the 2d array is the unique ID of each part type.

	var part = ds_list_create();
	var a = 0;

	part[| a++] = argument[0]; // 0. sprite_index
	part[| a++] = argument[1]; // 1. image_index

	part[| a++] = 1; // 2. size_min
	part[| a++] = 1; // 3. size_max
	part[| a++] = 0; // 4. size_incr
	part[| a++] = 0; // 5. angle_min
	part[| a++] = 0; // 6. angle_max
	part[| a++] = 0; // 7. angle_incr

	part[| a++] = bm_normal; // 8. blend_mode
	part[| a++] = c_white;   // 9. color
	part[| a++] = 1;         // 10. alpha
	part[| a]   = 0;         // 11. alpha_incr

	return part;


}
