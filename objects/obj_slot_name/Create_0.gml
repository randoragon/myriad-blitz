/// @description Setup

#region Inherit parent event

event_inherited();

#endregion

#region Setup

image_speed     = 0;
image_index     = 0;
grabbed         = 0;
keyboard_string = "";
f               = -1;
depth           = gui_depth.slot_name - busy + 1;

#endregion