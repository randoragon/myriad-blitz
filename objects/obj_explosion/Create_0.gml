/// @description Setup

#region Setup

image_index		   = 0;
image_speed		   = 0.25 * gpspeed;
image_angle		   = irandom(359);
depth			   = general_depth.explosion;

#endregion

#region Inherit parent event

event_inherited();

#endregion

