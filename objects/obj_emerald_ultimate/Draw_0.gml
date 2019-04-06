/// @description Draw self

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw self

image_xscale *= sign(rot);
draw_self();
image_xscale *= sign(rot);

#endregion

#region Reset surface

surface_reset_target();

#endregion