/// @description part_type_create_pro(sprite, subimg, imgspd, life_min, life_max);
/// @param sprite
/// @param subimg
/// @param imgspd
/// @param life_min
/// @param life_max
function part_type_create_pro() {

	var part = ds_list_create();
	var a = 0;

	part[| a++] = argument[0]; // 0. sprite_index
	part[| a++] = argument[1]; // 1. image_index
	part[| a++] = argument[2]; // 2. image_speed
	part[| a++] = argument[3]; // 3. life_min
	part[| a++] = argument[4]; // 4. life_max

	part[| a++] = 1; // 5. size_min
	part[| a++] = 1; // 6. size_max
	part[| a++] = 0; // 7. size_incr
	part[| a++] = 0; // 8. size_wiggle
	part[| a++] = 0; // 9. angle_min
	part[| a++] = 0; // 10. angle_max
	part[| a++] = 0; // 11. angle_incr
	part[| a++] = 0; // 12. angle_wiggle
	part[| a++] = 0; // 13. angle_relative

	part[| a++] = 0; // 14. dir_min
	part[| a++] = 0; // 15. dir_max
	part[| a++] = 0; // 16. dir_incr
	part[| a++] = 0; // 17. dir_wiggle
	part[| a++] = 0; // 18. speed_min
	part[| a++] = 0; // 19. speed_max
	part[| a++] = 0; // 20. speed_incr
	part[| a++] = 0; // 21. speed_wiggle

	part[| a++] = 0; // 22. grav_speed
	part[| a++] = 0; // 23. grav_speed_incr
	part[| a++] = 0; // 24. grav_dir_min
	part[| a++] = 0; // 25. grav_dir_max

	part[| a++] = bm_normal; // 26. blend_mode
	part[| a++] = c_white;   // 27. color1
	part[| a++] = c_white;   // 28. color2
	part[| a++] = 1;         // 29. alpha1
	part[| a]   = 1;         // 30. alpha2

	return part;


}
