/// @description Setup

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Setup

instance_setup(0, random_range(1, 2) * global.gpspeed, 0, 0.5);
rot         = 0.25 * sign(obj_emerald_ultimate.rot);
size_growth = random_range(2, 15);
image_alpha = random_range(0.2, 0.5);
clock       = irandom_range(220, 260);
if (obj_emerald_ultimate.rot_cycle % 2 == 0) {
	layer = layer_get_id("UnderlayEffects0");
}

#endregion

#region Inherit parent event

event_inherited();

#endregion