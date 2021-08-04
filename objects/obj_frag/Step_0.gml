/// @description Frag Behavior

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Frag behavior

switch(f) {
	case PLAYER_EVILFLAME:
	    switch(e) {
		    case 0:
			    vspeed1 += vacc * global.gpspeed;
			    if (real_step()) { part_type_spawn_ult(PART_SYSTEM_FRAG_ULT, PART_TYPE_P_EVILFLAME_FRAG_ULT, 2, x, y, x, y, "square", "linear", 1); }
		    break;
		    case 1:
				if (real_step()) { part_type_spawn_ult(PART_SYSTEM_FRAG_ULT, PART_TYPE_P_EVILFLAME_CHARGE_ULT_RING_ULT, 2, x, y, x, y, "square", "linear", 1); }
		    break;
		    case 2:
			    speed1    += random_range(-0.2, 0.2);
			    direction += random_range(-2, 2);
			    if (real_step()) { part_type_spawn_ult(PART_SYSTEM_FRAG_ULT, PART_TYPE_P_EVILFLAME_FURY_FRAG_ULT, 2, x, y, x, y, "square", "linear", 1); }
		    break;
	    }
	    image_angle += 10 * global.gpspeed;
	break;
	case PLAYER_EMERALD:
	    if (!instance_exists(obj_emerald_ultimate)) {
		    if (enemyharm < 1) {
				enemyharm = min(enemyharm + (0.08 * global.gpspeed), 1);
				direction += 2 * global.gpspeed;
			} else if (enemyharm == 1 && instance_exists(obj_enemy)) {
				direction = home(direction, point_direction(x, y, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y), 4 * global.gpspeed, 1);
			}
	    }
	    else {
		    direction = home(direction, point_direction(x, y, obj_emerald_ultimate.x, obj_emerald_ultimate.y), clamp((500 - distance_to_point(obj_emerald_ultimate.x, obj_emerald_ultimate.y)) * 0.05, 1, 15) * global.gpspeed, 1);
		    if (angle_difference(direction, point_direction(x, y, obj_emerald_ultimate.x, obj_emerald_ultimate.y)) >= 180) {
				speed1 -= 0.1 * sqr(global.gpspeed);
			} else {
				speed1 += 0.025 * sqr(global.gpspeed);
			}
	    }
	    if (real_step()) {
	        part_type_edit_ult(PART_TYPE_P_EMERALD_FRAG_ULT, "angle", image_angle, image_angle, 0, 0);
	        part_type_spawn_ult(PART_SYSTEM_FRAG_ULT, PART_TYPE_P_EMERALD_FRAG_ULT, 2, x, y, x, y, "square", "linear", 1);
	    }
	    image_angle = direction;
	break;
	case PLAYER_DER_SCOOTOMIK:
		if (enemyharm == 0 && instance_exists(enemy) && !place_meeting(x, y, enemy)) {
			enemyharm = 1;
		}
		image_yscale = 1 + pierce_bounce;
		if (real_step()) {
			var xmin, ymin, xmax, ymax, ptype;
			xmin = x + lengthdir_x(1, direction);
			ymin = y - 4 - lengthdir_y(2, direction);
			xmax = x + lengthdir_x(3, direction);
			ymax = y - 1 + lengthdir_y(2, direction);
			switch(pierce_bounce) {
				default: ptype = PART_TYPE_P_SCOOTOMIK_YELLOW_1; break;
				case 1:  ptype = PART_TYPE_P_SCOOTOMIK_YELLOW_2; break;
				case 2:  ptype = PART_TYPE_P_SCOOTOMIK_YELLOW_3; break;
			}
			part_type_spawn_ult(PART_SYSTEM_FRAG_ULT, ptype + image_index, 2, xmin, ymin, xmax, ymax, "ellipse", "linear", 5);
		}
	break;
	case PLAYER_BOBILEUSZ:
		if (e == 1) {
			if (real_step()) {
				part_type_spawn_ult(PART_SYSTEM_FRAG_ULT, PART_TYPE_P_BOBILEUSZ_ICICLE_ULT, 0, x-6, y-6, x+6, y+6, "ellipse", "linear", 5);
			}
			vspeed1 += 0.1 * sqr(global.gpspeed);
			image_angle = point_direction(x, y, x + lengthdir_x(speed1, direction), y + lengthdir_y(speed1, direction) + vspeed1);
		} else {
			if (real_step()) {
				var parttype, hue, hues, i;
				hue  = color_get_hue(image_blend);
				hues = [0, 21, 43, 80, 122, 163, 197, 223, 255];
				for (i = 0; i < array_length(hues); i++) {
					if (hues[i] > hue) { break; }
				}
				hue = (abs(hue - hues[i-1]) < abs(hue - hues[i]))? i-1 : i % 8;
				parttype = PART_TYPE_P_BOBILEUSZ_FLASH_RED_ULT + hue;
				part_type_spawn_ult(PART_SYSTEM_FRAG_ULT, parttype, 1, x - 50, y - 15, x + 40, y + 15, "square", "linear", 1);
			}
		}
	break;
}

#endregion

#region Dealing damage

if (!fading && place_meeting(x, y, obj_enemy) && instance_place(x, y, obj_enemy).hp > 0 && (enemy != instance_place(x, y, obj_enemy).id || enemyharm == 1)) {
    var ee = instance_place(x, y, obj_enemy);
    var damage = calculate_damage(fdmg, fpen, ee.fdef / (mean(fmin, fmax) * spawn.sspd));
    var display_damage = ceil(ee.hp) - ceil(ee.hp - damage);
    ee.hp = clamp(ee.hp - damage, 0, ee.hpmax);
    knockback((100 - ee.fkbres) * fkb / 1000, point_direction(x, y, x, y), 1);
    indicate(x, y, display_damage, 1, rgb(255, 85, 0), c_red);
    play_sfx(sfx_evilflame_frag_hit + (global.chrsel * 4), 0, global.sound_gpspeed * 100);
	if (pierce_bounce > 0) {
		enemy = ee;
		enemyharm = 0;
		if (instance_exists(obj_enemy)) {
			var eee = instance_find(obj_enemy, irandom(instance_number(obj_enemy) - 1));
			direction = point_direction(x, y, eee.x, eee.y);
		} else {
			direction = random(360);
		}
		image_angle = direction;
		pierce_bounce--;
	} else {
		fading = TRUE;
	}
}

#endregion

#region Despawn

var out_of_bounds = (y > CANVAS_YEND + sprite_yoffset + 128 || y < -sprite_height + sprite_yoffset - 128 || x < -sprite_width + sprite_xoffset - 128 || x > CANVAS_XEND + sprite_xoffset + 128);

if (!fading) {
	lifespan -= global.gpspeed;
	if (lifespan <= 0 || out_of_bounds) {
		if (fadeout == 0) {
			instance_destroy();
		} else {
			fading = TRUE;
		}
	}
} else {
	fadeout -= global.gpspeed;
	if (fadeout <= 0 || out_of_bounds) {
		instance_destroy();
	}
}

#endregion


#region Inherit parent event

event_inherited();

#endregion
