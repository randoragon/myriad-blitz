/// @description draw_text_outline(x, y, text, xscale, yscale, color, outlinetype, outlinecolor);
/// @param x
/// @param y
/// @param text
/// @param xscale
/// @param yscale
/// @param color
/// @param outlinetype
/// @param outlinecolor
function draw_text_outline() {

	/* OUTLINE TYPES:
	 * 0 'underline'  - 2x drawing
	 * 1 'smooth'     - 5x drawing
	 * 2 'rough'      - 17x drawing
	 */

	// var r = (argument_count == 9)? argument[8] : min(argument[3], argument[4]);
	var prevcolor  = draw_get_color();
	var halign = draw_get_halign();
	var valign = draw_get_valign();
	/*
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
	*/
	//#####################################################################

	if (argument[6] == 1 || argument[6] == 2) {
		var prevalpharef = gpu_get_alphatestref();
		var xx	   = argument[0];
		var yy	   = argument[1];
		var text   = argument[2];
		var tcolor = argument[5];
		var ocolor;
		ocolor[2] = color_get_blue(argument[7])  / 255;
		ocolor[1] = color_get_green(argument[7]) / 255;
		ocolor[0] = color_get_red(argument[7])   / 255;

		var suf1 = surface_create(string_width(text) + 2, string_height(text) + 2);
		var xsize, ysize, xdest, ydest;
		xsize    = texture_get_texel_width(surface_get_texture(suf1));
		ysize    = texture_get_texel_height(surface_get_texture(suf1));
		surface_set_target(suf1);
		draw_clear_alpha(0, 0);
		switch(halign) {
			case fa_left:   xdest = 1; break;
			case fa_center: xdest = floor(surface_get_width(suf1) / 2); break;
			case fa_right:  xdest = surface_get_width(suf1) - 1; break;
		}
		switch(valign) {
			case fa_top:    ydest = 1; break;
			case fa_middle: ydest = floor(surface_get_height(suf1) / 2); break;
			case fa_bottom: ydest = surface_get_height(suf1) - 1; break;
		}
		if (tcolor != -1) { draw_set_color(tcolor); }
		draw_text(xdest, ydest, text);
		surface_reset_target();

		var suf2 = surface_create(string_width(text) + 2, string_height(text) + 2);
		surface_set_target(suf2);
		draw_clear_alpha(0, 0);
		shader_set(shd_outline);
		shader_set_uniform_f(global.shd_outline_uni[| 0], xsize, ysize);
		shader_set_uniform_f(global.shd_outline_uni[| 1], ocolor[0], ocolor[1], ocolor[2]);
		shader_set_uniform_f(global.shd_outline_uni[| 2], (argument[6] == 2));
		gpu_set_alphatestref(0);
		draw_surface(suf1, 0, 0);
		shader_reset();
		surface_reset_target();
		gpu_set_alphatestref(254);
		surface_free(suf1);
	
		var xorig, yorig;
		var xscale = argument[3], yscale = argument[4];
		switch(halign) {
			case fa_left:   xorig = 0;										break;
			case fa_center: xorig = -surface_get_width(suf2) * xscale / 2;	break;
			case fa_right:  xorig = -surface_get_width(suf2) * xscale;		break;
		}
		switch(valign) {
			case fa_top:    yorig = 0;										break;
			case fa_middle: yorig = -surface_get_height(suf2) * yscale / 2; break;
			case fa_bottom: yorig = -surface_get_height(suf2) * yscale;		break;
		}
	
		yorig -= yscale;
	
		gpu_set_alphatestref(prevalpharef);
		draw_surface_stretched(suf2, xx + xorig, yy + yorig, argument[3] * surface_get_width(suf2), argument[4] * surface_get_height(suf2));
		surface_free(suf2);
	} else {
		draw_set_color(argument[7]);
		draw_text_transformed(argument[0], argument[1] + argument[4], argument[2], argument[3], argument[4], 0);
		draw_set_color(argument[5]);
		draw_text_transformed(argument[0], argument[1], argument[2], argument[3], argument[4], 0);
	}

	draw_set_color(prevcolor);


}
