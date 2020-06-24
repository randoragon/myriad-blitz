/// @description Minion Behavior

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Minion AI

switch(f) {
	case MINION_BOBILEUSZ_BOTTLE:
		// cache commonly used values
		var xoffset = 5;
		var yoffset = -6 + (spawn.image_index >= 4 && spawn.image_index < 6);
		var dir = spawn.image_angle + point_direction(0, 0, xoffset, yoffset);
		var l = sqrt(sqr(xoffset) + sqr(yoffset));
		
		if (state == 1) {
			var scale = 1 + (-0.25 * dsin(cooldown * 8));
			image_scale(spawn.image_xscale * scale, spawn.image_yscale * scale);
			if (cooldown >= 12 && cooldown - global.gpspeed < 12) {
				var l2 = 5 * sqrt(2);
				spawn_bullet(x + (spawn.image_xscale * scale * lengthdir_x(l2, dir + 10)), y + (spawn.image_yscale * scale * lengthdir_y(l2, dir + 10)), obj_projectile, PLAYER_BOBILEUSZ, 1, -1, spawn);
				play_sfx(sfx_bobileusz_bottle_fire, 0, random_range(95, 105));
			}
		} else {
			image_scale(spawn.image_xscale, spawn.image_yscale);
		}
		
		cooldown -= global.gpspeed;
		
		if (cooldown <= 0) {
			switch(state) {
				case 0:
					state = 1;
					cooldown = 45;
				break;
				case 1: // wind-up animation
					state = 0;
					cooldown = irandom_range(240, 360);
				break;
			}
		}
		
		// position on the player
		image_angle = spawn.image_angle;
		x = spawn.x + (lengthdir_x(l, dir) * spawn.image_xscale);
		y = spawn.y + (lengthdir_y(l, dir) * spawn.image_yscale);
	break;
}

#endregion

#region Inherit parent event

event_inherited();

#endregion