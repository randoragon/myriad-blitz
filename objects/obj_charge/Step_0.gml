/// @description Charge Behavior

#region Inherit parent event

event_inherited();

#endregion

#region Blazing Fireball

if (f == 0 && global.gpspeed != 0) {
	if (e != 2) {
		//DEFAULT FIREBALL
		if (target < -4) {
			target++;
		} else {
			if (!instance_exists(target) || !object_is_ancestor(target.object_index, obj_enemy)) {
				var dist = 999999;
				with(obj_enemy) {
					if (distance_to_point(other.x, other.y) < dist) {
						dist = distance_to_object(other);
						other.target = id;
					}
				}
			} else if (instance_exists(target)) {
				direction = home(direction, point_direction(x, y, target.x, target.y), 2 * global.gpspeed, 1);
			}
			image_angle = direction;
		}
		if (real_step()) {
			part_type_spawn_ult(PART_SYSTEM_CHARGE, PART_TYPE_P_EVILFLAME_CHARGE, 3, x - 30, y - 30, x + 30, y + 30, "ellipse", "linear", 1.5);
		}
		if (place_meeting(x, y, obj_enemy) && instance_place(x, y, obj_enemy).hp > 0) {
			with (instance_place(x, y, obj_enemy)) {
				var damage = calculate_damage(other.cdmg, other.cpen, cdef);
				var display_damage = ceil(hp) - ceil(hp - damage);
				hp = clamp(hp - damage, 0, hpmax);
				indicate(x, y, display_damage, 2, rgb(255, 170, 0), c_red);
				knockback((100 - ckbres) * other.ckb / 1000, point_direction(other.x, other.y, x, y), 1);
				spawn_bullet_ring(x, y, obj_frag, global.chrsel, 1, id, other.spawn, 15, 0);
				screenshake_set(5, 0, 4, 5, 1);
				with(other) { instance_destroy(); }
			}
		}

		if (x > CANVAS_XEND + 128 || x < -128 || y < -128 || y > CANVAS_YEND + 128) {
			instance_destroy();
		}
		charge -= global.gpspeed;
	} else {             //TWILIGHT FURY VARIANT
		if (target < -4) {
			target++;
		} else {
			if (!instance_exists(target) || !object_is_ancestor(target.object_index, obj_enemy)) {
				var dist = 999999;
				with(obj_enemy) {
					if (distance_to_point(other.x, other.y) < dist) {
						dist = distance_to_object(other);
						other.target = id;
					}
				}
			} else if (instance_exists(target)) {
				direction = home(direction, point_direction(x, y, target.x, target.y), 5 * global.gpspeed, 1);
			}
			image_angle = direction;
		}
		if (real_step()) {
			part_type_spawn_ult(PART_SYSTEM_CHARGE, PART_TYPE_P_EVILFLAME_FURY_CHARGE, 3, x - 6, y - 6, x + 6, y + 6, "ellipse", "linear", 1);
		}
		if (place_meeting(x, y, obj_enemy) && instance_place(x, y, obj_enemy).hp > 0) {
			with (instance_place(x, y, obj_enemy)) {
				var damage = calculate_damage(other.cdmg, other.cpen, cdef);
				var display_damage = ceil(hp) - ceil(hp - damage);
				hp = clamp(hp - damage, 0, hpmax);
				indicate(x, y, display_damage, 2, rgb(255, 170, 0), c_red);
				knockback((100 - ckbres) * other.ckb / 1000, point_direction(other.x, other.y, x, y), 1);
				screenshake_set(5, 0, 4, 1, 1);
				with(other) { instance_destroy(); }
			}
		}
		if (x > CANVAS_XEND + 128 || x < -128 || y < -128 || y > CANVAS_YEND + 128) {
			instance_destroy();
		}
		charge -= global.gpspeed;
	}
}

#endregion

#region Beaming Spin

if (f == 2 && global.gpspeed != 0) {
	if (charge > 0) {
		spawn.image_angle -= 12 * global.gpspeed;
		if (instance_exists(spawn.helper)) {
			spawn.helper.image_angle = spawn.image_angle;
		}
		var xoffset = 21 * spawn.image_xscale; var yoffset = -11 * spawn.image_yscale;
		var xoffset2 = -29; var yoffset2 = 1;
		
		var angle, l, xx;
		angle = spawn.image_angle + point_direction(0, 0, xoffset, yoffset);
		angle %= 360;
		l = sqrt(sqr(xoffset) + sqr(yoffset));
		if (spawn.x + xoffset - 4 > CANVAS_XEND && instance_exists(spawn.helper)) {
			xx = spawn.helper.x; 
		} else {
			xx = spawn.x;
		}
		if (real_step()) {
			spawn_bullet(xx + lengthdir_x(l, angle), spawn.y + lengthdir_y(l, angle), obj_frag, 2, 2, -1, spawn.id);
		}
		
		angle = spawn.image_angle + point_direction(0, 0, xoffset2, yoffset2);
		angle %= 360;
		l = sqrt(sqr(xoffset2) + sqr(yoffset2));
		if (spawn.x + xoffset2 - 8 < 0 && instance_exists(spawn.helper)) {
			xx = spawn.helper.x;
		} else {
			xx = spawn.x;
		}
		if (real_step()) {
			spawn_bullet(xx + lengthdir_x(l, angle), spawn.y + lengthdir_y(l, angle), obj_frag, 2, 3, -1, spawn.id);
		}
		if (real_step()) {
			play_sfx(sfx_scootomik_frag_hit, sound_priority.player_frag_hit, 0, global.sound_gpspeed * 100);
		}
		charge -= global.gpspeed;
	} else {
		spawn.inv = round(global.invtime / global.gpspeed);
		spawn.sprite_index = spr_scootomik;
		instance_destroy();
	}
}

#endregion