/// @description screen_darken(alpha)
/// @param alpha

draw_set_color(c_black);
draw_set_alpha(argument[0]);
gpu_set_alphatestref(0);
gpu_set_blendmode(bm_add);
draw_rectangle(GUI_X, GUI_Y, GUI_XEND, GUI_YEND, 0);
gpu_set_blendmode(bm_normal);
gpu_set_colorwriteenable(1, 1, 1, 0);
draw_rectangle(GUI_X, GUI_Y, GUI_XEND, GUI_YEND, 0);
gpu_set_colorwriteenable(1, 1, 1, 1);
draw_set_alpha(1);
gpu_set_alphatestref(254);
