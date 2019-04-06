/// @description Projectile Behavior

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Projectile behavior

lifespan -= global.gpspeed;
var is_out_of_border = y > (CANVAS_YEND + sprite_yoffset) || (y < -sprite_height + sprite_yoffset) || (x < -sprite_width + sprite_xoffset);
if (lifespan <= 0 || is_out_of_border) {
	instance_destroy();
}

switch(f) {
	case 0:
		if (!instance_exists(obj_emerald_ultimate)) { vspeed1 += acc * sqr(global.gpspeed); }
		image_angle += rot * global.gpspeed;
	break;
}

#endregion

#region Emerald's Current Crush influence

if (instance_exists(obj_emerald_ultimate) && f != 2) {
	if (hspeed1 != 0 || vspeed1 != 0) {
		speed1 += sqrt(sqr(hspeed1) + sqr(vspeed1));
		hspeed1 = 0;
		vspeed1 = 0;
	}
	direction   = home(direction, point_direction(x, y, obj_emerald_ultimate.x, obj_emerald_ultimate.y), clamp((400 - distance_to_point(obj_emerald_ultimate.x, obj_emerald_ultimate.y)) * 0.25, 1, 10) * global.gpspeed, 1);
	image_angle = direction;
}

#endregion

#region Inherit parent event

event_inherited();

#endregion