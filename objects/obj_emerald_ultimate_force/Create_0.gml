/// @description Setup

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Setup

instance_setup(0, 0, random(360), 0.5);
clock = irandom_range(60, 160);
depth = general_depth.emerald_ultimate_flow_top;

#endregion

#region Inherit parent event

event_inherited();

#endregion