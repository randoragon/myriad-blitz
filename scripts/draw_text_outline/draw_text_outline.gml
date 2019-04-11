/// @description draw_text_outline(x, y, text, xscale, yscale, angle, color, outlinetype, outlinecolor, outlinethickness);
/// @param x
/// @param y
/// @param text
/// @param xscale
/// @param yscale
/// @param angle
/// @param color
/// @param outlinetype
/// @param outlinecolor
/// @param outlinethickness

/* OUTLINE TYPES:
 * 0 'underline'  - 2x drawing
 * 1 'smooth'     - 5x drawing
 * 2 'rough'      - 17x drawing
 */

var r = (argument_count == 10)? argument[9] : min(argument[3], argument[4]);
var prevcolor  = draw_get_color();

draw_set_color(argument[8]);

draw_text_transformed(argument[0], argument[1] + argument[4], argument[2], argument[3], argument[4], argument[5]);

if (argument[7] == 1 || argument[7] == 2) {
	draw_text_transformed(argument[0] + r, argument[1], argument[2], argument[3], argument[4], argument[5]);
	draw_text_transformed(argument[0] - r, argument[1], argument[2], argument[3], argument[4], argument[5]);
	draw_text_transformed(argument[0], argument[1] + r, argument[2], argument[3], argument[4], argument[5]);
	draw_text_transformed(argument[0], argument[1] - r, argument[2], argument[3], argument[4], argument[5]);
	if (argument[7] == 2) {
		draw_text_transformed(argument[0] + r, argument[1] + r, argument[2], argument[3], argument[4], argument[5]);
		draw_text_transformed(argument[0] + r, argument[1] - r, argument[2], argument[3], argument[4], argument[5]);
		draw_text_transformed(argument[0] - r, argument[1] + r, argument[2], argument[3], argument[4], argument[5]);
		draw_text_transformed(argument[0] - r, argument[1] - r, argument[2], argument[3], argument[4], argument[5]);
		
		var r2 = r / 2;
		draw_text_transformed(argument[0] + r, argument[1] + r2, argument[2], argument[3], argument[4], argument[5]);
		draw_text_transformed(argument[0] + r, argument[1] - r2, argument[2], argument[3], argument[4], argument[5]);
		draw_text_transformed(argument[0] - r, argument[1] + r2, argument[2], argument[3], argument[4], argument[5]);
		draw_text_transformed(argument[0] - r, argument[1] - r2, argument[2], argument[3], argument[4], argument[5]);
		draw_text_transformed(argument[0] + r2, argument[1] + r, argument[2], argument[3], argument[4], argument[5]);
		draw_text_transformed(argument[0] + r2, argument[1] - r, argument[2], argument[3], argument[4], argument[5]);
		draw_text_transformed(argument[0] - r2, argument[1] + r, argument[2], argument[3], argument[4], argument[5]);
		draw_text_transformed(argument[0] - r2, argument[1] - r, argument[2], argument[3], argument[4], argument[5]);
	}
}

draw_set_color(argument[6]);
draw_text_transformed(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
draw_set_color(prevcolor);

//#####################################################################
/*
if (argument[7] == 1) {
	var xx	   = argument[0];
	var yy	   = argument[1];
	var text   = argument[2];
	var angle  = (argument[5] % 360) + (argument[5] < 0 ? 360 : 0);
	var tcolor = argument[6];
	var ocolor;
	ocolor[2] = color_get_blue(argument[8]) / 255;
	ocolor[1] = color_get_green(argument[8]) / 255;
	ocolor[0] = color_get_red(argument[8]) / 255;

	var suf1 = surface_create(string_width(text) + 2, string_height(text) + 2);
	var xsize, ysize;
	xsize    = texture_get_texel_width(surface_get_texture(suf1));
	ysize    = texture_get_texel_height(surface_get_texture(suf1));
	surface_set_target(suf1);
	draw_clear_alpha(0, 0);
	draw_set_align(fa_left, fa_top);
	if (tcolor != -1) { draw_set_color(tcolor); }
	draw_text(1, 1, text);
	surface_reset_target();

	var suf2 = surface_create(string_width(text) + 2, string_height(text) + 2);
	surface_set_target(suf2);
	draw_clear_alpha(0, 0);
	shader_set(shd_outline);
	shader_set_uniform_f(global.shd_outline_uni[| 0], xsize, ysize);
	shader_set_uniform_f(global.shd_outline_uni[| 1], ocolor[0], ocolor[1], ocolor[2]);
	shader_set_uniform_f(global.shd_outline_uni[| 2], argument[9]);
	gpu_set_alphatestref(0);
	draw_surface(suf1, 0, 0);
	shader_reset();
	surface_reset_target();
	gpu_set_alphatestref(254);
	surface_free(suf1);

	var xorig, yorig;
	switch(prevhalign) {
		case fa_left:   xorig = 0;							 break;
		case fa_center: xorig = surface_get_width(suf2) / 2; break;
		case fa_right:  xorig = surface_get_width(suf2) - 1; break;
	}

	switch(prevvalign) {
		case fa_top:    yorig = 0;							  break;
		case fa_middle: yorig = surface_get_height(suf2) / 2; break;
		case fa_bottom: yorig = surface_get_height(suf2) - 1; break;
	}

	var sprite = sprite_create_from_surface(suf2, 0, 0, surface_get_width(suf2), surface_get_height(suf2), 0, 0, xorig, yorig);
	draw_sprite_ext(sprite, 0, xx, yy, argument[3], argument[4], angle, c_white, 1);
	surface_free(suf2);
	sprite_delete(sprite);
} else {
	draw_set_color(argument[8]);
	draw_text_transformed(argument[0], argument[1] + (argument[9] * argument[4]), argument[2], argument[3], argument[4], argument[5]);
	draw_set_color(argument[6]);
	draw_text_transformed(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
}

draw_set_align(prevhalign, prevvalign);
draw_set_color(prevcolor);
*/
