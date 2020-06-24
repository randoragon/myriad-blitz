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
		if (irandom(90) == 0 && global.gpstep >= 1) {
	        play_sfx(sfx_reindeer_shoot, 0, global.sound_gpspeed * 100);
	        spawn_bullet(x - 41, y - 21, obj_eprojectile, 2, 0, -1, id);
	    }
	    vspeed1 = 2 * linsin(5 * (global.gptime - time_mark));
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
        part_type_spawn_lt(PART_SYSTEM_ENEMY_LT, PART_TYPE_E_ULTIMATE_LOOT_LT, 5, x - sprite_xoffset, y - sprite_yoffset, x - sprite_xoffset + sprite_width, y - sprite_yoffset + sprite_height, "ellipse", "linear", 1);
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
	if (!IS_STATUS_EFFECT_CHIP_TUNING) {
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
if (IS_STATUS_EFFECT_CHIP_TUNING && image_alpha < 1)   { touchable = FALSE; }

// out of room boundaries kill
if (x < (-2 * sprite_width) + sprite_xoffset && !IS_STATUS_EFFECT_CHIP_TUNING) { instance_destroy(); }

#endregion