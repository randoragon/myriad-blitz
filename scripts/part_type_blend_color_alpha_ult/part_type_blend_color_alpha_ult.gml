/// @description part_type_blend_color_alpha_ult(part, blend_mode, color, alpha, alpha_incr)
/// @param part
/// @param blend_mode
/// @param color
/// @param alpha
/// @param alpha_incr

var grid       = global.part_type_ult_grid[0];
var a          = argument[0];
var b          = 8;

grid[# a, b++] = argument[1];
grid[# a, b++] = argument[2];
grid[# a, b++] = argument[3];
grid[# a, b]   = argument[4];