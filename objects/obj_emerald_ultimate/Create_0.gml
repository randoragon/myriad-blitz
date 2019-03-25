/// @description Setup

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Setup

with (obj_projectile) { speed1 /= 2; }
with (obj_frag)       { speed1 /= 2; }

image_scale(0, 0);
rot         = choose(5, -5);
image_speed = 0.5 * global.gpspeed;
rot_cycle   = irandom(360);

#endregion

#region Inherit parent event

event_inherited();

#endregion