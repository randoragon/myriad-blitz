/// @description Frag Behavior

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Frag behavior

switch(f) {
	case PLAYER_EVILFLAME:
	    switch(e) {
		    case 0:
			    vspeed1 += vacc * sqr(global.gpspeed);
			    if (real_step()) { part_type_spawn_ult(PART_SYSTEM_FRAG, PART_TYPE_P_EVILFLAME_FRAG, 2, x, y, x, y, "square", "linear", 1); }
		    break;
		    case 1:
				if (real_step()) { part_type_spawn_ult(PART_SYSTEM_FRAG, PART_TYPE_P_EVILFLAME_CHARGE_RING, 2, x, y, x, y, "square", "linear", 1); }
		    break;
		    case 2:
			    speed1    += random_range(-0.2, 0.2);
			    direction += random_range(-2, 2);
			    if (real_step()) { part_type_spawn_ult(PART_SYSTEM_FRAG, PART_TYPE_P_EVILFLAME_FURY_FRAG, 2, x, y, x, y, "square", "linear", 1); }
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
	        part_type_edit_ult(PART_TYPE_P_EMERALD_FRAG, "angle", image_angle, image_angle, 0, 0);
	        part_type_spawn_ult(PART_SYSTEM_FRAG, PART_TYPE_P_EMERALD_FRAG, 2, x, y, x, y, "square", "linear", 1);
	    }
	    image_angle = direction;
	break;
	case PLAYER_BOBILEUSZ:
		if (e == 1) {
			vspeed1 += 0.1 * sqr(global.gpspeed);
			image_angle = point_direction(x, y, x + lengthdir_x(speed1, direction), y + lengthdir_y(speed1, direction) + vspeed1);
		}
	break;
}

#endregion

#region Dealing damage

if (place_meeting(x, y, obj_enemy) && instance_place(x, y, obj_enemy).hp > 0 && (enemy != instance_place(x, y, obj_enemy).id || enemyharm == 1)) {
    var ee = instance_place(x, y, obj_enemy);
    var damage = calculate_damage(fdmg, fpen, ee.fdef / (mean(fmin, fmax) * spawn.sspd));
    var display_damage = ceil(ee.hp) - ceil(ee.hp - damage);
    ee.hp = clamp(ee.hp - damage, 0, ee.hpmax);
    knockback((100 - ee.fkbres) * fkb / 1000, point_direction(x, y, x, y), 1);
    indicate(x, y, display_damage, 1, rgb(255, 85, 0), c_red);
    play_sfx(sfx_evilflame_frag_hit + (global.chrsel * 4), sound_priority.player_frag_hit, 0, global.sound_gpspeed * 100);
    fading = TRUE;
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
