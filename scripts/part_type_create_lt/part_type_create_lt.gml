/// @description part_type_create_lt(sprite, subimg, life_min, life_max);
/// @param sprite
/// @param subimg
/// @param life_min
/// @param life_max

var part = ds_list_create();
var a = 0;

part[| a++] = argument[0]; // 0. sprite_index
part[| a++] = argument[1]; // 1. image_index
part[| a++] = argument[2]; // 2. life_min
part[| a++] = argument[3]; // 3. life_max

part[| a++] = 1; // 4. size_min
part[| a++] = 1; // 5. size_max
part[| a++] = 0; // 6. size_incr
part[| a++] = 0; // 7. angle_min
part[| a++] = 0; // 8. angle_max
part[| a++] = 0; // 9. angle_incr
part[| a++] = 0; // 10. rotation_dir

part[| a++] = 0; // 11. dir_min
part[| a++] = 0; // 12. dir_max
part[| a++] = 0; // 13. speed_min
part[| a++] = 0; // 14. speed_max
part[| a++] = 0; // 15. speed_incr

part[| a++] = bm_normal; // 16. blend_mode
part[| a++] = c_white;   // 17. color1
part[| a++] = c_white;   // 18. color2
part[| a++] = 1;         // 19. alpha1
part[| a]   = 1;         // 20. alpha2

return part;