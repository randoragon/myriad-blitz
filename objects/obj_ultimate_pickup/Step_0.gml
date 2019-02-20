/// @description Grow

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Growth

if (gpspeed != 0) {
	image_scale(image_xscale + (0.04 * gpspeed), image_yscale + (0.04 * gpspeed));
	image_alpha -= 0.015 * gpspeed;
	if (image_alpha <= 0) { instance_destroy(); }
}

#endregion