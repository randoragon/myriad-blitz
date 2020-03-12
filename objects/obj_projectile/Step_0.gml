/// @description Bullet Behavior

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Emerald's current crush

if (instance_exists(obj_emerald_ultimate) && global.gpspeed != 0) {
	if (hspeed1 != 0 || vspeed1 != 0) {
		speed1 += sqrt(sqr(hspeed1) + sqr(vspeed1));
		hspeed1 = 0; vspeed1 = 0;
	}
	direction = home(direction, point_direction(x, y, obj_emerald_ultimate.x, obj_emerald_ultimate.y), clamp((500 - distance_to_point(obj_emerald_ultimate.x, obj_emerald_ultimate.y)) * 0.05, 1, 20) * global.gpspeed, 1);
	if (angle_difference(direction, point_direction(x, y, obj_emerald_ultimate.x, obj_emerald_ultimate.y)) >= 180) {
		speed1 -= 0.2 * global.gpspeed;
	} else {
		speed1 += 0.1 * global.gpspeed;
	}
	image_angle = direction;
}

#endregion

#region Bullet behavior

switch(f) {
	case PLAYER_EVILFLAME:
	    switch(e) { // Evilflame fury bullets
		    case 2:
			    speed1 = max(speed1 - (0.08 * global.gpspeed), 1);
			    direction += random_range(-2, 2) * global.gpspeed;
			    if (real_step()) {
					part_type_spawn_ult(PART_SYSTEM_FRAG, PART_TYPE_P_EVILFLAME_FURY_FRAG, 6, x, y, x, y, "square", "linear", 1);
				}
		    break;
	    }
	break;
	case PLAYER_BOBILEUSZ:
		if (e == 1) {
			vspeed1 += global.gpspeed * 0.1;
			if (real_step()) {
				part_type_spawn_lt(PART_SYSTEM_MINION, PART_TYPE_P_BOBILEUSZ_WATER, 0, x-3, y-3, x+3, y+3, "ellipse", "gaussian", 3);
			}
		}
	break;
}

#endregion

#region Dealing damage & spawning frags

if (!fading && place_meeting(x, y, obj_enemy) && instance_place(x, y, obj_enemy).hp > 0) {
    var ee = instance_place(x, y, obj_enemy);
    var damage = calculate_damage(pdmg, ppen, ee.pdef / sspd);
    var display_damage = ceil(ee.hp) - ceil(ee.hp - damage);
    ee.hp = clamp(ee.hp - damage, 0, ee.hpmax);
    knockback((100 - ee.pkbres) * pkb / 1000, point_direction(x, y, x, y), 1);
    indicate(x, y, display_damage, 1, rgb(255, 85, 0), c_red);
    play_sfx(sfx_evilflame_bullet_hit + (global.chrsel * 4), sound_priority.player_bullet_hit, 0, global.sound_gpspeed * 100);
    if (global.enemy_details_selection_auto_aim) {
        global.enemy_details_selection = ee;
    }
	
	switch(global.chrsel) {
		case PLAYER_EVILFLAME:
			spawn_bullet_ring(x, y, obj_frag, PLAYER_EVILFLAME, (e == 2)? 2 : 0, ee.id, spawn, irandom_range(floor(fmin), ceil(fmax)), 0);
		break;
		case PLAYER_DER_SCOOTOMIK:
			spawn_bullet_ring(x, y, obj_frag, PLAYER_DER_SCOOTOMIK, (e == 1)? 1 : 0, ee.id, spawn, irandom_range(floor(fmin), ceil(fmax)), 0);
		break;
		case PLAYER_BOBILEUSZ:
			if (!irandom(20)) {
				var frag = spawn_bullet(x, y, obj_frag, PLAYER_BOBILEUSZ, 0, ee.id, spawn);
				var randir = irandom_range(direction - 35, direction + 35);
				frag.xstart = lengthdir_x(irandom_range(50, 200), randir + 180);
				frag.ystart = lengthdir_y(irandom_range(50, 200), randir + 180);
				frag.direction = point_direction(frag.xstart, frag.ystart, ee.x, ee.y);
			}
		break;
		default:
			spawn_bullet_ring(x, y, obj_frag, global.chrsel, 0, ee.id, spawn, irandom_range(floor(fmin), ceil(fmax)), 0);
		break;
	}	
	
    fading = TRUE;
}

#endregion

#region Despawn & rotate & fading

image_angle += rot * global.gpspeed;

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