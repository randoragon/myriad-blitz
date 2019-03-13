/// @description draw_text_full(x, y, text, xscale, yscale, angle, alpha, halign, valign, color);
/// @param x
/// @param y
/// @param text
/// @param xscale
/// @param yscale
/// @param angle
/// @param alpha
/// @param halign
/// @param valign
/// @param color

draw_set_halign(argument[7]);
draw_set_valign(argument[8]);
draw_set_color(argument[9]);
var prealpha = draw_get_alpha();

draw_set_alpha(argument[6]);
if (argument[6] < 1) { gpu_set_alphatestref(254); }
draw_text_transformed(argument[0], argument[1], string_hash_to_newline(argument[2]), argument[3], argument[4], argument[5]);
if (prealpha == 1) { gpu_set_alphatestref(0); }
draw_set_alpha(prealpha);
