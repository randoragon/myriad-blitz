/// @description Bullet Behavior

#region Skip if loading

if (global.loading == 1) { exit; }

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
	case 0:
	    switch(e) { //evilflame fury bullets
	    case 2:
		    speed1 = max(speed1 - (0.08 * global.gpspeed), 1);
		    direction += random_range(-2, 2) * global.gpspeed;
		    if (real_step()) {
				part_type_spawn_ult(global.part_system[2], global.frag_part[2], 6, x, y, x, y, "square", "linear", 1);
			}
	    break;
	    }
	break;
}

#endregion

#region Dealing damage & spawning frags

if (place_meeting(x, y, obj_enemy) && instance_place(x, y, obj_enemy).hp > 0) {
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
    //spawning frags
    var frag_e = 0;
    if (global.chrsel == 0 && e == 2) {
        frag_e = 2;
    } else if(global.chrsel == 2 && e == 1) {
        frag_e = 1;
    }
    spawn_bullet_ring(x, y, obj_frag,global.chrsel, frag_e, ee.id, spawn, irandom_range(floor(fmin), ceil(fmax)), 0);
    instance_destroy();
}

#endregion

#region Despawn & rotate

image_angle += rot * global.gpspeed;
lifespan -= global.gpspeed;
if (lifespan <= 0 || y > CANVAS_YEND + sprite_yoffset + 128 || y < -sprite_height + sprite_yoffset - 128 || x < -sprite_width + sprite_xoffset - 128 || x > CANVAS_XEND + sprite_xoffset + 128) {
	instance_destroy();
}

#endregion

#region Inherit parent event

event_inherited();

#endregion