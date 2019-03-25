/// @description Setup

#region Inherit parent event

event_inherited();

#endregion

#region Setup

image_speed  = 0;
image_index  = 0;
image_xscale = 0;
image_yscale = 0;
depth		 = layer_get_depth(layer_get_id("Popups")) - global.busy + 1;

#endregion