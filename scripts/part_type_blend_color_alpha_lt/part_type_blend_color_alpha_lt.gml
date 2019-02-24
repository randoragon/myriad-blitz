/// @description part_type_blend_color_alpha_lt(part, blend_mode, color1, color2, alpha1, alpha2)
/// @param part
/// @param blend_mode
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2

var grid       = global.part_type_lt_grid[0];
var a          = argument[0];
var b          = 16;

grid[# a, b++] = argument[1];
grid[# a, b++] = argument[2];
grid[# a, b++] = argument[3];
grid[# a, b++] = argument[4];
grid[# a, b]   = argument[5];