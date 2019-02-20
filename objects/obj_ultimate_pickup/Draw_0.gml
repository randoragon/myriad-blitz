/// @description Draw Self

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw self

draw_set_alpha_test_ref_value(0);
draw_self();
draw_set_alpha_test_ref_value(254);

#endregion

#region Reset surface

surface_reset_target();

#endregion