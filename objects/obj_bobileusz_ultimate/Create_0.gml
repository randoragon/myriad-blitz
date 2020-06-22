/// @description Setup

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Setup

image_speed = global.gpspeed;
afterimage_ds_grid = -1;

#endregion

#region Inherit parent event

event_inherited();

#endregion