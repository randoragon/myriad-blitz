/// @description Destroy Condition

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Inherit parent event

event_inherited();

#endregion

#region Destroy condition

if (image_index + image_speed >= image_number) { instance_destroy(); }

#endregion