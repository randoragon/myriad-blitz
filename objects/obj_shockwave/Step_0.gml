/// @description Radius & Despawn

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Radius increasement and despawn

radius += maxradius / time;
if (image_alpha <= 0 && radius >= maxradius) {
	instance_destroy();
}

#endregion