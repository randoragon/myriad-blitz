/// @description screen_darken(alpha)
/// @param alpha

draw_set_color(c_black);
draw_set_alpha(argument[0]);
draw_set_alpha_test_ref_value(0);
draw_set_blend_mode(bm_add);
draw_rectangle(GUI_X, GUI_Y, GUI_XEND, GUI_YEND, 0);
draw_set_blend_mode(bm_normal);
draw_set_color_write_enable(1, 1, 1, 0);
draw_rectangle(GUI_X, GUI_Y, GUI_XEND, GUI_YEND, 0);
draw_set_color_write_enable(1, 1, 1, 1);
draw_set_alpha(1);
draw_set_alpha_test_ref_value(254);
