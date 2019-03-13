/// @description Draw Self

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw self

gpu_set_alphatestref(0);
draw_self();
gpu_set_alphatestref(254);

#endregion

#region Reset surface

surface_reset_target();

#endregion