/// @description GUI_SURFACE set
surface_set_target(GUI_SURFACE);

///draw self
draw_set_alpha_test_ref_value(0);
draw_self();
draw_set_alpha_test_ref_value(254);

///SURFACE RESET
surface_reset_target();

