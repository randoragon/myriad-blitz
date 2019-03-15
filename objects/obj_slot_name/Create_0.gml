/// @description Setup

#region Inherit parent event

event_inherited();

#endregion

#region Setup

image_speed     = 0;
image_index     = 0;
keyboard_string = "";
depth           = gui_depth.slot_name - global.busy + 1;

#endregion