/// @description Draw Self

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw everything

if (global.busy == start_busy) {
	draw_set_color(c_black);
	draw_set_alpha(0.3);
	gpu_set_alphatestref(0);
	gpu_set_blendmode(bm_add);
	draw_rectangle(CANVAS_X, CANVAS_Y, CANVAS_XEND, CANVAS_YEND, 0);
	gpu_set_blendmode(bm_normal);
	gpu_set_colorwriteenable(1, 1, 1, 0);
	draw_rectangle(CANVAS_X, CANVAS_Y, CANVAS_XEND, CANVAS_YEND, 0);
	gpu_set_colorwriteenable(1, 1, 1, 1);
	draw_set_alpha(1);
	gpu_set_alphatestref(254);
}
draw_self();

if (string_length(keyboard_string) > 26) { keyboard_string = string_copy(keyboard_string, 1, 26); }
draw_set_align(fa_left, fa_middle);
draw_text_transformed(x - 208, y + 16, keyboard_string, 3, 3, 0);

#endregion

#region Reset surface

surface_reset_target();

#endregion