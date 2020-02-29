/// @description part_type_blend_color_alpha_ult(part_id, blend_mode, color, alpha, alpha_incr)
/// @param part_id
/// @param blend_mode
/// @param color
/// @param alpha
/// @param alpha_incr

var part = global.part_type[argument[0]];
var a = 8;

part[| a++] = argument[1];
part[| a++] = argument[2];
part[| a++] = argument[3];
part[| a]   = argument[4];