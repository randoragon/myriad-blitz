/// @description Behavior

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Inherit parent event

event_inherited();

#endregion

#region Enemy Behavior

if (global.gpspeed != 0) {
    //INTRO
    if (intro == 1 && (x > CANVAS_XEND - 10 - (0.5 * sprite_width) || y > CANVAS_YEND - (sprite_height * 0.5) - 10 || y < CANVAS_Y + 10 + (0.5 * sprite_height))) {
        x -= 0.75 * global.gpspeed;
        if (y > CANVAS_YEND - (sprite_height * 0.5) - 10 - 1) {
            y = max(CANVAS_YEND - (sprite_height * 0.5) - 10 - 1, y - 0.75);
        }
        if (y < CANVAS_Y + 10 + (0.5 * sprite_height) + 1) {
            y = min(CANVAS_Y + 10 + (0.5 * sprite_height) + 1, y + 0.75);
        }
        if (!(x > CANVAS_XEND - 10 - (0.5 * sprite_width) || y > CANVAS_YEND - (sprite_height * 0.5) - 10 || y < CANVAS_Y + 10 + (0.5 * sprite_height))) {
            intro = 0;
			if (beh == 0) { hspeed1 = irandom_range(-2, -6); }
        }
    }
    
    //STANDARD BEHAVIOR
    if (intro == 0 && beh > 0 && !instance_exists(obj_emerald_ultimate)) {
		/*  STATES
		 *	0  - movement
		 *	1  - attack 1 (begin)
		 *	2  - attack 2 (spawn bullets)
		 *  3  - free movement
		 *  4  - attack 3 (wait for the animation to finish)
		 *	5  - evasion (avoiding obj_projectile)
		 *	6  - super attack 1 (begin)
		 *  7  - super attack 2 (charge)
		 *  8  - super attack 3 (shoot one)
		 *  9 - super attack 5  (wait for the animation to finish)
		 */
		switch (state) {
			case 0: // movement
				var xx, yy;
				xx = irandom_range(CANVAS_X + 512, CANVAS_XEND - 10 - (0.5 * sprite_width));
				yy = irandom_range(CANVAS_Y + 10 + (0.5 * sprite_height), CANVAS_YEND - (sprite_height * 0.5) - 10);
				cooldown = irandom_range(80, 160);
				fly_towards(x, y, xx, yy, cooldown);
				state = 3;
			break;
			case 1: // regular attack 1
				speed1 = 0; // stop "flying"
				sprite_index = spr_gingerbread_man_attack;
				image_index  = 0;
				state = 2;
			break;
			case 2: // regular attack 2
				if (image_index >= 8 && image_index <= 9 && real_step()) {
					play_sfx(sfx_gingerbread_man_shoot, sound_priority.enemy_shoot, 0, global.sound_gpspeed * 100);
					var p = spawn_bullet(x, y, obj_eprojectile, 1, 1, -1, id);
					p.speed1 = random_range(3, 4);
					p.direction = clamp(point_direction(x, y, obj_player.x, obj_player.y) + irandom_range(-10, 10), 120, 240);
					state = choose(4);
				}
			break;
			case 3: // free movement
				cooldown = max(cooldown - global.gpspeed, 0);
				if (cooldown == 0) { state = (superattack_cooldown-- <= 0)? choose(1, 6, 6) : 1; }
			break;
			case 4: // regular attack 3
				if (image_index >= image_number - 1) {
					sprite_index = spr_gingerbread_man;
					image_index  = 0;
					state		 = 0;
				}
			break;
			case 6: // super attack 1
				speed1 = 0; // stop "flying"
				sprite_index = spr_gingerbread_man_attack;
				image_index  = 0;
				state = 7;
			break;
			case 7: // super attack 2
				
				if (image_index >= 2 && image_index <= 3 && real_step()) {
					sprite_index = spr_gingerbread_man_attack_float;
					image_index = 0;
					jitterx = x;
					jittery = y;
					state   = 8;
					superattack_projectilecount = irandom_range(3, 5);
					superattack_jittervalue = 0;
				}
			break;
			case 8: // super attack 3
				superattack_jittervalue += global.gpspeed * 1/30;
				var jittervalue = 2.5 * sin(superattack_jittervalue * pi / 2);
				if (real_step()) {
					x = jitterx + random_range(-jittervalue, jittervalue);
					y = jittery + random_range(-jittervalue, jittervalue);
					part_type_spawn_lt(PART_SYSTEM_ENEMY, PART_TYPE_E_GINGERBREAD_MAN_SUPER, 0.5, x, y - 40, x, y - 40, ps_shape_line, ps_distr_linear, 1);
				}
				if ((image_index) >= 4 && (image_index) < 5 && real_step() && !superattack_projectileshot) {
					play_sfx(sfx_gingerbread_man_shoot, sound_priority.enemy_shoot, 0, global.sound_gpspeed * 100);
					var p = spawn_bullet(x, y - 40, obj_eprojectile, 1, 0, -1, id);
					superattack_projectileshot = TRUE;
					p.direction = clamp(point_direction(x, y, obj_player.x, obj_player.y) + irandom_range(-45, 45), 120, 240);
					p.speed1    = random_range(1, 2);
					if (--superattack_projectilecount <= 0) {
						x = jitterx;
						y = jittery;
						state = 9;
					}
				} else if (((image_index) < 4 || (image_index) > 5) && superattack_projectileshot) {
					superattack_projectileshot = FALSE;
				}
			break;
			case 9: // super attack 4
				sprite_index = spr_gingerbread_man;
				image_index = 0;
				superattack_cooldown = irandom_range(3, 6);
				state = 0;
			break;
		}
    } else if (instance_exists(obj_emerald_ultimate) && global.gpspeed != 0) {
		// getting sucked in by emerald's current crush
        var prev_dir = direction;
        speed1       = home(speed1, 10, 0.4 * global.gpspeed, 0);
        direction    = home(direction, point_direction(x, y, obj_emerald_ultimate.x, obj_emerald_ultimate.y), speed1 * 2 * global.gpspeed, 1);
        image_angle += clamp(direction - prev_dir, -5 * global.gpspeed, 5 * global.gpspeed);
        if (hspeed1 != 0) {
            hspeed1 = home(hspeed1, 0, 0.05 * global.gpspeed, 0);
        }
        if (vspeed1 != 0) {
            vspeed1 = home(vspeed1, 0, 0.05 * global.gpspeed, 0);
        }
    }
}
   
#endregion

#region Ultimate loot particles

if (ds_map_exists(loot, "ultimate")) {
    if (real_step()) {
        part_type_spawn_lt(PART_SYSTEM_ENEMY, PART_TYPE_E_ULTIMATE_LOOT, 5, x - sprite_xoffset, y - sprite_yoffset, x - sprite_xoffset + sprite_width, y - sprite_yoffset + sprite_height, "ellipse", "linear", 1);
    }
}

#endregion

#region Bar extension

if (!global.enemy_details_selection_auto_aim && place_meeting(x, y, boss)) {
	global.enemy_details_selection = id;
}

bar_extension = home(bar_extension, (global.enemy_details_selection == id), 0.2, 0);

#endregion

#region Death

//classic death
if (hp <= 0) {
	if (!STATUS_EFFECT_CHIP_TUNING) {
		intro = 2;
	} else {
		image_alpha -= 0.4 * global.gpspeed;
		if (image_alpha <= 0) { instance_destroy(); }
	}
}

if (global.gpspeed != 0 && intro == 2 && image_alpha > 0) || global.state == 2 {
	image_alpha = 0;
	explode(x, y, image_xscale, 1);
	if (global.state != 2) {
		event_perform(ev_other, ev_user1);
		if (ds_map_exists(loot, "ultimate")) {
			repeat (loot[? "ultimate"]) {
				instance_create(x, y, obj_ultimate_pickup);
				obj_player.ultcount++;
				obj_player.ultblink = 45;
			}
		}
	}
	instance_destroy();
}

// touchable switch
if (x <= -sprite_width + sprite_xoffset)			{ touchable = FALSE; }
if (x >= -sprite_width + sprite_xoffset)			{ touchable = TRUE; }
if (STATUS_EFFECT_CHIP_TUNING && image_alpha < 1)   { touchable = FALSE; }

// out of room boundaries kill
if (x < (-2 * sprite_width) + sprite_xoffset && !STATUS_EFFECT_CHIP_TUNING) { instance_destroy(); }

#endregion