/// @description Setup

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Setup

instance_setup(0, 0, random(360), 0.5);
clock = irandom_range(60, 160);

#endregion

#region Inherit parent event

event_inherited();

#endregion