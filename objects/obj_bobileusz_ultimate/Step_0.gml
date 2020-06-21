/// @description Glacier Behavior

#region Skip if loading

if (global.loading) { exit; }

#endregion

if (global.gpspeed != 0) {
	// Follow player
	if (progress >= goal) {
		xstart = x;
		ystart = y;
		prev_angle = image_angle % 360;
		tx = obj_player.x + 100 + irandom_range(-10, 10);
		ty = obj_player.y - 16 + irandom_range(-10, 10);
		goal = irandom_range(60, 120);
		progress = 0;
	} else {
		progress += global.gpspeed;
		p = (1 + sin((-pi/2) + (pi * progress / goal))) / 2;
		x = xstart + (p * (tx - xstart));
		y = ystart + (p * (ty - ystart));
		var velocity = point_distance(xstart, ystart, tx, ty) / goal;
		var maxangle = 45 * clamp(velocity / 12, 0, 1);
		image_angle = (point_direction(xstart, ystart, tx, ty) + 90) % 360;
		if (image_angle > 90 && image_angle < 270) { image_angle = (image_angle - 180) % 360; }
		image_angle = (image_angle <= 90)? min(image_angle, maxangle) : max(image_angle, 360 - maxangle);
		image_angle = prev_angle + (sin(pi * progress / goal) * (image_angle - prev_angle));
	}

	// Lifespan deterioration
	lifespan -= global.gpspeed;
	if (lifespan <= 0) {
		instance_destroy();
	}
}

#region Inherit parent event

event_inherited();

#endregion