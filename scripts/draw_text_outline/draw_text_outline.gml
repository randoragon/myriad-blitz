/// @description draw_text_outline(x, y, text, xscale, yscale, angle, color, outlinetype, outlinecolor, thickness);
/// @param x
/// @param y
/// @param text
/// @param xscale
/// @param yscale
/// @param angle
/// @param color
/// @param outlinetype
/// @param outlinecolor
/// @param thickness

/* OUTLINE TYPES:
 * 0 'underline', lighter on CPU
 * 1 'all around', harder on CPU
 */

if (argument[8] != -1) {
	var prevcolor = draw_get_color();
	draw_set_color(argument[8]);
}

if (argument[7] == 0 || argument[7] == 1) {
	draw_text_transformed(argument[0], argument[1] + (argument[9] * argument[4]), string_hash_to_newline(argument[2]), argument[3], argument[4], argument[5]);
}

if (argument[7] == 1) {
	draw_text_transformed(argument[0], argument[1] - (argument[9] * argument[4]), string_hash_to_newline(argument[2]), argument[3], argument[4], argument[5]);
	draw_text_transformed(argument[0] - (argument[9] * argument[3]), argument[1], string_hash_to_newline(argument[2]), argument[3], argument[4], argument[5]);
	draw_text_transformed(argument[0] + (argument[9] * argument[3]), argument[1], string_hash_to_newline(argument[2]), argument[3], argument[4], argument[5]);
	draw_text_transformed(argument[0] - (argument[9] * argument[3]), argument[1] - (argument[9] * argument[4]), string_hash_to_newline(argument[2]), argument[3], argument[4], argument[5]);
	draw_text_transformed(argument[0] + (argument[9] * argument[3]), argument[1] + (argument[9] * argument[4]), string_hash_to_newline(argument[2]), argument[3], argument[4], argument[5]);
	draw_text_transformed(argument[0] - (argument[9] * argument[3]), argument[1] + (argument[9] * argument[4]), string_hash_to_newline(argument[2]), argument[3], argument[4], argument[5]);
	draw_text_transformed(argument[0] + (argument[9] * argument[3]), argument[1] - (argument[9] * argument[4]), string_hash_to_newline(argument[2]), argument[3], argument[4], argument[5]);
}

if (argument[6] != -1) {
	draw_set_color(argument[6]);
}

draw_text_transformed(argument[0], argument[1], string_hash_to_newline(argument[2]), argument[3], argument[4], argument[5]);
draw_set_color(prevcolor);
