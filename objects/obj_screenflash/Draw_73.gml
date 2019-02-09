/// @description Draw Flash

#region set GUI_SURFACE

surface_set_target(GUI_SURFACE);

#endregion

#region Draw flash

draw_set_alpha(image_alpha);
draw_set_color(image_blend);
draw_set_alpha_test_ref_value(0);
draw_rectangle(CANVAS_X, CANVAS_Y, CANVAS_XEND, CANVAS_YEND, 0);
draw_set_alpha_test_ref_value(254);
draw_set_alpha(1);

#endregion

#region Reset surface

surface_reset_target();

#endregion