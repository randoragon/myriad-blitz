/// @description

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Stats control

// Twilight Fury stats check
if (global.chrsel == PLAYER_EVILFLAME) {
	if (global.uname == "DUAL CLONE" && TWILIGHT_FURY) {
		global.uname = "TWILIGHT FURY";
		global.utype = "SECRET BUFF";
		global.ucooldown = 1200;
		ucooldown = 1200;
		global.udesc =
		"Borrows the power of stars...";
		if (instance_exists(obj_statboard)) {
			scr_Stats_Update(obj_statboard.button[0].show);
		}
	} else if (global.uname=="TWILIGHT FURY" && !TWILIGHT_FURY) {
		global.uname = "DUAL CLONE";
		global.utype = "BUFF";
		global.ucooldown = 600;
		ucooldown = 600;
		global.udesc =
		"Divides HP in half and summons"+
		"\nan upside-down copy of itself"+
		"\nthat mirrors every action of"+
		"\nthe original.";
		if (instance_exists(obj_statboard)) {
			scr_Stats_Update(obj_statboard.button[0].show);
		}
	}
}

///player stats control

//factors for all relevant stats
var maxhp_factor      = 1;
var pdef_factor       = 1;
var bdef_factor       = 1;
var spd_factor        = 1;
var acc_factor        = 1;
var counteracc_factor = 1;
var bdmg_factor       = 1;
var pdmg_factor       = 1;
var pspd_factor       = 1;
var sspd_factor       = 1;
var sacc_factor       = 1;
var fdmg_factor       = 1;
var cdmg_factor       = 1;
var ctime_factor      = 1;
var ccooldown_factor  = 1;
var invtime_factor    = 1;
var bpen_factor		  = 1;
var ppen_factor		  = 1;
var fpen_factor		  = 1;

if (IS_STATUS_EFFECT_EXHAUSTED) {
    spd_factor        *= 0.5;
    acc_factor        *= 0.5;
    counteracc_factor *= 0.5;
}

if (IS_STATUS_EFFECT_MAGIC_FATIGUE) {
    switch(global.chrsel) {
	    case PLAYER_EMERALD:
	        pdmg_factor  *= 0.5;
	        sspd_factor  *= 0.8;
	        fdmg_factor  *= 0.5;
	        cdmg_factor  *= 0.5;
	        ctime_factor *= 1.5;
	    break;
    }
}

if (IS_STATUS_EFFECT_PARALYZED) {
    spd_factor        *= 0.2;
    acc_factor        *= 4;
    counteracc_factor *= 0.125;
}

if (IS_STATUS_EFFECT_CURRENT_CRUSH) {
    if (global.gpspeed != 0 && !audio_is_playing(sfx_emerald_ultimate_loop)) {
        play_sfx(sfx_emerald_ultimate_loop, 0, global.sound_gpspeed * 100);
    }
}

if (IS_STATUS_EFFECT_CHIP_TUNING) {
    bdmg_factor       *= sqrt(sqr(xv) + sqr(yv)) / spd;
    spd_factor        *= 2;
    acc_factor        *= 4;
    counteracc_factor *= 4;
    invtime_factor     = 0;
    if (global.gpspeed != 0 && !audio_is_playing(sfx_scootomik_ultimate_loop)) {
        play_sfx(sfx_scootomik_ultimate_loop, 0);
    }
}

if (IS_STATUS_EFFECT_TWILIGHT_FURY) {
    maxhp_factor      *= 0.75;
    pspd_factor       *= 0.75;
    sacc_factor       *= 0.4;
    sspd_factor       *= 1.5;
    spd_factor        *= 1.05;
    acc_factor        *= 1.05;
    counteracc_factor *= 1.05;
    cdmg_factor       *= 0.5;
    ctime_factor      *= 0.5;
    ccooldown_factor  *= 0.75;
    fmin               = 2;
	fmax               = 2;
    fdmg_factor       *= 1.5;
}

if (IS_STATUS_EFFECT_BERSERK) {
    bdmg_factor *= 1.25;
    pdmg_factor *= 1.25;
    cdmg_factor *= 1.25;
    fdmg_factor *= 1.25;
    bdef_factor *= 0.5;
    pdef_factor *= 0.5;
}

if (IS_STATUS_EFFECT_GEAR1) {
	bdmg_factor *= 0.5;
	pdmg_factor *= 0.5;
	fdmg_factor *= 0.5;
	ppen_factor *= 3;
	fpen_factor *= 3;
	bdef_factor *= 3;
	pdef_factor *= 3;
	spd_factor  *= 0.3;
	acc_factor  *= 0.8;
	sacc_factor  = find_multiplier(global.sacc * sacc_factor, 1, 0.5);
} else if (IS_STATUS_EFFECT_GEAR2) {
	bdmg_factor *= 0.7;
	pdmg_factor *= 0.7;
	fdmg_factor *= 0.7;
	ppen_factor *= 2;
	fpen_factor *= 2;
	bdef_factor *= 2.5;
	pdef_factor *= 2.5;
	spd_factor  *= 0.5;
	acc_factor  *= 0.8;
	sacc_factor  = find_multiplier(global.sacc * sacc_factor, 1, 0.3);
} else if (IS_STATUS_EFFECT_GEAR3) {
	bdmg_factor *= 0.8;
	pdmg_factor *= 0.8;
	fdmg_factor *= 0.8;
	ppen_factor *= 1.5;
	fpen_factor *= 1.5;
	bdef_factor *= 2;
	pdef_factor *= 2;
	spd_factor  *= 0.65;
	acc_factor  *= 0.9;
	sacc_factor  = find_multiplier(global.sacc * sacc_factor, 1, 0.2);
} else if (IS_STATUS_EFFECT_GEAR4) {
	bdmg_factor *= 0.9;
	pdmg_factor *= 0.9;
	fdmg_factor *= 0.9;
	ppen_factor *= 1.25;
	fpen_factor *= 1.25;
	bdef_factor *= 1.5;
	pdef_factor *= 1.5;
	spd_factor  *= 0.8;
	acc_factor  *= 0.9;
	sacc_factor  = find_multiplier(global.sacc * sacc_factor, 1, 0.1);
} else if (IS_STATUS_EFFECT_GEAR6) {
	bdmg_factor *= 1.075;
	pdmg_factor *= 1.075;
	fdmg_factor *= 1.075;
	bdef_factor *= 0.9;
	pdef_factor *= 0.9;
	spd_factor  *= 1.3;
	acc_factor  *= 1.3;
	sacc_factor  = find_multiplier(global.sacc * sacc_factor, 1, -0.1);
} else if (IS_STATUS_EFFECT_GEAR7) {
	bdmg_factor *= 1.15;
	pdmg_factor *= 1.15;
	fdmg_factor *= 1.15;
	ppen_factor *= 0.75;
	fpen_factor *= 0.75;
	bdef_factor *= 0.7;
	pdef_factor *= 0.7;
	spd_factor  *= 1.6;
	acc_factor  *= 1.6;
	sacc_factor  = find_multiplier(global.sacc * sacc_factor, 1, -0.2);
} else if (IS_STATUS_EFFECT_GEAR8) {
	bdmg_factor *= 1.2;
	pdmg_factor *= 1.2;
	fdmg_factor *= 1.2;
	ppen_factor *= 0.5;
	fpen_factor *= 0.5;
	bdef_factor *= 0.5;
	pdef_factor *= 0.5;
	spd_factor  *= 2;
	acc_factor  *= 2;
	sacc_factor  = find_multiplier(global.sacc * sacc_factor, 1, -0.3);
} else if (IS_STATUS_EFFECT_GEAR9) {
	bdmg_factor *= 1.25;
	pdmg_factor *= 1.25;
	fdmg_factor *= 1.25;
	ppen_factor *= 0.25;
	fpen_factor *= 0.25;
	bdef_factor *= 0.3;
	pdef_factor *= 0.3;
	spd_factor  *= 2.5;
	acc_factor  *= 2;
	sacc_factor  = find_multiplier(global.sacc * sacc_factor, 1, -0.4);
} else if (IS_STATUS_EFFECT_GEAR10) {
	bdmg_factor *= 1.3;
	pdmg_factor *= 1.3;
	fdmg_factor *= 1.3;
	ppen_factor *= 0;
	fpen_factor *= 0;
	bdef_factor *= 0.1;
	pdef_factor *= 0.1;
	spd_factor  *= 3;
	acc_factor  *= 2.5;
	sacc_factor  = find_multiplier(global.sacc * sacc_factor, 1, -0.5);
}

if (IS_STATUS_EFFECT_PRISMATIC_GLACIER) {
    fdmg_factor = 0.25;
}

//final stats calculation
hpmax      = global.hp * maxhp_factor;
spd        = global.spd * spd_factor;
acc        = global.acc * acc_factor;
counteracc = global.counteracc * counteracc_factor;
bdmg       = global.bdmg * bdmg_factor;
bpen	   = clamp(global.bpen * bpen_factor, 0, 100);
bdef       = global.bdef * bdef_factor;
pdmg       = global.pdmg * pdmg_factor;
ppen	   = clamp(global.ppen * ppen_factor, 0, 100);
pdef       = global.pdef * pdef_factor;
pspd       = global.pspd * pspd_factor;
sspd       = global.sspd * sspd_factor;
sacc       = global.sacc * sacc_factor;
fdmg       = global.fdmg * fdmg_factor;
fpen	   = clamp(global.fpen * fpen_factor, 0, 100);
cdmg       = global.cdmg * cdmg_factor;
ctime      = global.ctime * ctime_factor;
ccooldown  = global.ccooldown * ccooldown_factor;
invtime    = global.invtime * invtime_factor;

#endregion

#region Focus mode

var possible   = bool(room == rm_Main && global.gpspeed != 0 && global.state == 1);
var allowed    = bool(!IS_STATUS_EFFECT_DIZZY && !IS_STATUS_EFFECT_CHIP_TUNING && !IS_STATUS_EFFECT_BERSERK);
if (possible) {
	if (allowed) {
		if (keyboard_check(KEYBIND_FOCUS)) {
			bar_opacity[1] = 5;
			if (instance_exists(obj_evilflame_ultimate)) {
				obj_evilflame_ultimate.bar_opacity[1] = 5; // dual clone equivalent
			}
		}
		if (keyboard_check_pressed(KEYBIND_FOCUS) && global.gpspeed_focus == 1)
			focus_state = 1;
		if (!keyboard_check(KEYBIND_FOCUS) && focus_state == 1)
			focus_state = 2;

		if (focus_state == 1) {
			global.gpspeed_focus = 0.25;
			focus = home(focus, 0, global.gpspeed / global.gpspeed_focus, 0);
			if (focus <= 0) { focus_state = 2; }
		} else if (focus_state == 2) {
			if (global.gpspeed_focus < 1) {
				global.gpspeed_focus = home(global.gpspeed_focus, 1, 0.05 * global.gpspeed / global.gpspeed_focus, 0);
			} else { focus_state=0; }
		} else if (focus_state == 0) {
			focus = home(focus, foctime, 0.1 * global.gpspeed / global.gpspeed_focus, 0);
		}
	} else { // possible to use, but cannot use (status: dizzy & alike situations)
		focus_state			 = 0;
		global.gpspeed_focus = 1;
	}
}

#endregion

#region Miscellaneous things

if (hpmark != hp) {
	//this is for both Gameplay bars and GUI bars
	hpmark = home(hpmark, hp, hpmark_v * global.gpspeed, 0);
}
ultblink    -= (ultblink    > 0);
flash_clock -= (flash_clock > 0);

#endregion

#region Movement & Shooting

image_scale(2 - global.transition, 2 - global.transition);
var gpspd;
if (IS_STATUS_EFFECT_CHIP_TUNING && global.gpspeed != 0) {
	gpspd = global.gpspeed / global.gpspeed_ultimate;
} else {
    gpspd = global.gpspeed;
}

if (global.state == 1 && gpspd != 0) {
    if (keyboard_check(KEYBIND_UP)) {
        yv = clamp(yv - (acc * sqr(gpspd)), -spd * gpspd, spd * gpspd);
    }
    if (keyboard_check(KEYBIND_DOWN)) {
        yv = clamp(yv + (acc * sqr(gpspd)), -spd * gpspd, spd * gpspd);
    }
    if (keyboard_check(KEYBIND_LEFT)) {
        xv = clamp(xv - (acc * sqr(gpspd)), -spd * gpspd, spd * gpspd);
    }
    if (keyboard_check(KEYBIND_RIGHT)) {
        xv = clamp(xv + (acc * sqr(gpspd)), -spd * gpspd, spd * gpspd);
    }
	
    if (global.chrsel != PLAYER_DER_SCOOTOMIK) {
        x = clamp(x + xv, CANVAS_X + (sprite_get_xoffset(spr_evilflame_hitbox + global.chrsel) - sprite_get_bbox_left(spr_evilflame_hitbox + global.chrsel)) * image_xscale, CANVAS_XEND + ((sprite_get_xoffset(spr_evilflame_hitbox + global.chrsel) - sprite_get_bbox_right(spr_evilflame_hitbox + global.chrsel)) * image_xscale));
        y = clamp(y + yv, CANVAS_Y + (sprite_get_yoffset(spr_evilflame_hitbox + global.chrsel) - sprite_get_bbox_top(spr_evilflame_hitbox + global.chrsel)) * image_yscale, CANVAS_YEND + ((sprite_get_yoffset(spr_evilflame_hitbox + global.chrsel) - sprite_get_bbox_bottom(spr_evilflame_hitbox + global.chrsel)) * image_yscale));
    }
    else {
        x += xv;
        y = clamp(y + yv, CANVAS_Y + (sprite_get_yoffset(spr_evilflame_hitbox + global.chrsel) - sprite_get_bbox_top(spr_evilflame_hitbox + global.chrsel)) * image_yscale, CANVAS_YEND + ((sprite_get_yoffset(spr_evilflame_hitbox + global.chrsel) - sprite_get_bbox_bottom(spr_evilflame_hitbox + global.chrsel)) * image_yscale));
    }
    if (x == CANVAS_X + (sprite_get_xoffset(spr_evilflame_hitbox + global.chrsel) - sprite_get_bbox_left(spr_evilflame_hitbox + global.chrsel)) * image_xscale || x == CANVAS_XEND + ((sprite_get_xoffset(spr_evilflame_hitbox + global.chrsel) - sprite_get_bbox_right(spr_evilflame_hitbox + global.chrsel)) * image_xscale)) {
        xv = 0;
    }
    if (y == CANVAS_Y + (sprite_get_yoffset(spr_evilflame_hitbox + global.chrsel) - sprite_get_bbox_top(spr_evilflame_hitbox + global.chrsel)) * image_yscale || y == CANVAS_YEND + ((sprite_get_yoffset(spr_evilflame_hitbox + global.chrsel) - sprite_get_bbox_bottom(spr_evilflame_hitbox+global.chrsel)) * image_yscale)) {
        yv = 0;
    }
    
    if (!(keyboard_check(KEYBIND_UP) || keyboard_check(KEYBIND_DOWN))) {
        if (yv > 0) {
            yv = clamp(yv - (counteracc * sqr(gpspd)), 0, spd * gpspd);
        } else 
        if (yv < 0) {
            yv = clamp(yv + (counteracc * sqr(gpspd)), -spd * gpspd, 0);
        }
    }
    if (!(keyboard_check(KEYBIND_LEFT) || keyboard_check(KEYBIND_RIGHT))) {
        if (xv > 0) {
            xv = clamp(xv - (counteracc * sqr(gpspd)), 0, spd * gpspd);
        } else if (xv<0) {
            xv = clamp(xv + (counteracc * sqr(gpspd)), -spd * gpspd, 0);
        }
    }
    
	// allow obj_charge to spin Scootomik during Beaming Spin
    if (!(global.chrsel == PLAYER_DER_SCOOTOMIK && instance_exists(obj_charge)) && gpspd != 0) {
        image_angle = -2 * yv / gpspd;
    }

    gpspd = global.gpspeed;
    var charge_sprite_lock = ((charge > 0 && artcharge == 0) || ((global.chrsel == PLAYER_EMERALD || global.chrsel == PLAYER_DER_SCOOTOMIK) && instance_exists(obj_charge)));
    var can_shoot = (discharge > 0 || !mouse_check_button(mb_right)) && !charge_sprite_lock && !(global.chrsel == PLAYER_EMERALD && IS_STATUS_EFFECT_SPELL_DRIED);
    if (can_shoot) {
        // is shooting event:
		var is_shooting = (keyboard_check(KEYBIND_SHOOT) || (mouse_check_button(mb_left) && (!place_meeting(boss.x, boss.y, obj_button) || instance_place(boss.x, boss.y, obj_button).image_alpha == 0)));
        if(is_shooting || IS_STATUS_EFFECT_BERSERK) {
            if (evilflame_sprite_swap) {
                if (sprite_index != spr_evilflame_ultimate_shooting) {
                    sprite_index = spr_evilflame_ultimate_shooting;
                }
            } else if(evilflame_twilight_fury) {
                if (sprite_index != spr_evilflame_fury_shooting) {
                    sprite_index = spr_evilflame_fury_shooting;
                }
            } else if(sprite_index < spr_evilflame_shooting) {
                sprite_index = spr_evilflame_shooting + global.chrsel;
            }
            if (shot <= 0) {
                play_sfx(sfx_evilflame_shoot + (global.chrsel * 4), 0, global.sound_gpspeed * 100);
				var xoffset, yoffset, xoffset2, yoffset2;
                switch(global.chrsel)
                {
                    case PLAYER_EVILFLAME:
						xoffset = 32 * image_xscale;
						yoffset = -7 * image_yscale;
					break;
                    case PLAYER_EMERALD:
						xoffset = 30 * image_xscale;
						yoffset = -19 * image_yscale;
					break;
                    case PLAYER_DER_SCOOTOMIK:
						xoffset = 31 * image_xscale;
						yoffset = -17 * image_yscale;
						xoffset2 = -39 * image_xscale;
						yoffset2 = -4 * image_yscale;
					break;
					case PLAYER_BOBILEUSZ:
						xoffset = 23 * image_xscale;
						yoffset = -16 * image_yscale;
					break;
                }
                var angle = image_angle + point_direction(0, 0, xoffset, yoffset);
				angle    %= 360;
                var l     = sqrt(sqr(xoffset) + sqr(yoffset));
				var xx;
                if (x + xoffset > CANVAS_XEND && instance_exists(helper)) {
                    xx = helper.x;
                } else {
                    xx = x;
                }
                var e = 0;
                if (global.chrsel == PLAYER_EVILFLAME && IS_STATUS_EFFECT_TWILIGHT_FURY) {
                    e = 2;
                }
                spawn_bullet(xx + lengthdir_x(l, angle), y + lengthdir_y(l, angle), obj_projectile, global.chrsel, e, -1, id);
				
				// scootomik's second bullet
                if (global.chrsel == PLAYER_DER_SCOOTOMIK) {
                    var angle = image_angle + point_direction(0, 0, xoffset2, yoffset2); angle %= 360;
                    var l     = sqrt(sqr(xoffset2) + sqr(yoffset2));
					var is_helper_in_shooting_position = (x + xoffset2 < CANVAS_X && instance_exists(helper));
					var xx = is_helper_in_shooting_position ? helper.x : x;
                    spawn_bullet(xx + lengthdir_x(l, angle), y + lengthdir_y(l, angle), obj_projectile, PLAYER_DER_SCOOTOMIK, 1, -1, id);
                }
				
                shot += 60 / sspd;
            } else {
                shot -= gpspd;
            }
        } else { //can shoot but doesn't shoot:
            if (sprite_index > CHRCOUNT - 1) {
                if (evilflame_sprite_swap) {
                    sprite_index = spr_evilflame_ultimate;
                } else if (evilflame_twilight_fury) {
                    sprite_index = spr_evilflame_fury;
                } else {
                    sprite_index = spr_evilflame + global.chrsel;
                }
            }
            shot = home(shot, 0, gpspd);
        }
    } else { //can't shoot:
        if (sprite_index > spr_evilflame + CHRCOUNT - 1 && !charge_sprite_lock) {
            if (evilflame_sprite_swap) {
                sprite_index = spr_evilflame_ultimate;
            } else if(evilflame_twilight_fury) {
                sprite_index = spr_evilflame_fury;
            } else {
                sprite_index = spr_evilflame + global.chrsel;
            }
        }
    shot = home(shot, 0, 1, gpspd);
    }
}

#endregion

#region Wrapping movement

if (global.chrsel == PLAYER_DER_SCOOTOMIK && global.state == 1) {
	
    //teleport the player to the other side
    if (x + sprite_width-sprite_xoffset > CANVAS_XEND + (sprite_width / 2)) {
        x -= CANVAS_WIDTH;
    } else if (x - sprite_xoffset < CANVAS_X - (sprite_width / 2)) {
        x += CANVAS_WIDTH;
    }
    
    //compute where and when to place helper
    if (x + sprite_width - sprite_xoffset > CANVAS_XEND) {
	    if (!instance_exists(obj_wrap_helper)) {
			helper = instance_create(x - CANVAS_WIDTH, y, obj_wrap_helper);
			helper.mask_index   = mask_index;
			helper.sprite_index = sprite_index;
			helper.image_index  = image_index;
		} else {
		    helper = obj_wrap_helper;
		    helper.x            = x - CANVAS_WIDTH;
		    helper.y            = y;
		    helper.sprite_index = sprite_index;
		    helper.image_index  = image_index;
		    helper.image_xscale = image_xscale;
			helper.image_yscale = image_yscale;
		    helper.image_angle  = image_angle;
	    }
    } else if (x - sprite_xoffset < CANVAS_X) {
	    if (!instance_exists(obj_wrap_helper)) {
			helper = instance_create(x + CANVAS_WIDTH, y, obj_wrap_helper);
			helper.mask_index   = mask_index;
			helper.sprite_index = sprite_index;
			helper.image_index  = image_index;
		} else {
		    helper = obj_wrap_helper;
		    helper.x            = x + CANVAS_WIDTH;
		    helper.y            = y;
		    helper.sprite_index = sprite_index;
		    helper.image_index  = image_index;
		    helper.image_xscale = image_xscale;
			helper.image_yscale = image_yscale;
		    helper.image_angle  = image_angle;
	    }
    } else if (instance_exists(obj_wrap_helper)) {
		wipe(obj_wrap_helper);
    }
}

#endregion

#region Player particles

if (global.gpspeed != 0 && global.state != 2 && real_step()) {
	switch(global.chrsel) {
		case PLAYER_EVILFLAME:
			var xoffset = -22; var yoffset = 1 - (2 * IS_STATUS_EFFECT_TWILIGHT_FURY);        // this is the distance from the center of the sprite to the point from which the particles are supposed to pour out
			var dis     = sqrt(sqr(xoffset * image_xscale) + sqr(yoffset * image_yscale)); // this is to calculate distance from the center of the sprite to the point from which the particles are supposed to pour out
			var ang     = point_direction(0, 0, xoffset, yoffset) + image_angle;           // this is the angle between the center of the sprite and the particle point, player tilt included
			var status  = IS_STATUS_EFFECT_TWILIGHT_FURY;
			var part    = (status)? PART_TYPE_P_EVILFLAME_FURY_THRUSTER_LT : PART_TYPE_P_EVILFLAME_THRUSTER_LT;
			part_type_edit_lt(part, "direction", -image_angle + 170, -image_angle + 190);
			part_type_edit_lt(part, "size", (0.15 * (1 + status)) * image_yscale, (0.25 * (1 + status)) * image_yscale, (-0.008 * (1 + status)) * image_xscale);
			part_type_edit_lt(part, "speed", 7 * image_yscale, 11 * image_yscale, 0);
			part_type_spawn_lt(PART_SYSTEM_PLAYERBOT_LT, part, 1, x + lengthdir_x(dis,ang), y + lengthdir_y(dis,ang), x + lengthdir_x(dis,ang), y + lengthdir_y(dis,ang), "line", "linear", 1.5);
		break;
	}
}

#endregion

#region Charge

if (global.state == 1 && global.gpspeed != 0) {
	if (artcharge == 1) { charge = ctime };
	
	var does_emerald_laser_exist = (global.chrsel == PLAYER_EMERALD && instance_exists(obj_charge));
	var is_spell_dried = (global.chrsel == PLAYER_EMERALD && IS_STATUS_EFFECT_SPELL_DRIED);
	var bobileusz_invalid = (global.chrsel == PLAYER_BOBILEUSZ && (!(keyboard_check(KEYBIND_UP) ^^ keyboard_check(KEYBIND_DOWN)) || ((keyboard_check(KEYBIND_UP) && status_effect[STATUS_EFFECT_GEAR10]) || (keyboard_check(KEYBIND_DOWN) && status_effect[STATUS_EFFECT_GEAR1]))));
	if (mouse_check_button(mb_right) && global.state == 1 && !does_emerald_laser_exist && !is_spell_dried) {	
		// Charging
		if (discharge == 0 && !bobileusz_invalid) {
			if (evilflame_sprite_swap) {
				sprite_index = spr_evilflame_ultimate_charging;
			} else if (evilflame_twilight_fury) {
				sprite_index = spr_evilflame_fury_charging;
			} else if (sprite_index < spr_evilflame_charging)
				sprite_index = spr_evilflame_charging + global.chrsel;
			charge = min(charge + global.gpspeed, ctime);
			// do not play the charging sound for immediate charges
			if (ctime != 1 && !audio_is_playing(sfx_charging))
				play_sfx(sfx_charging, 0, global.sound_gpspeed * 100);
		}
		
		// Make charge gameplay bar visible
		if (charge + discharge != 0) {
			bar_opacity[2] = 5;
		}
	}

	// launching charge
	if (mouse_check_button(mb_right) && charge > 0 && !does_emerald_laser_exist && !bobileusz_invalid) {
		if (charge >= ctime) {
			cb = 1;
			play_sfx(sfx_evilflame_charge_shot + (global.chrsel * 4), 0, global.sound_gpspeed * 100);
			charge = 0;
			if (artcharge == 0) {
				discharge = ccooldown;
			} else {
				artcharge = 0;
				mouse_clear(mb_right);
			}
		}
	}

	// resetting charging progress
	if (charge > 0 && !mouse_check_button(mb_right) && global.gpspeed != 0 && charge < ctime) {
		charge = 0;
		bar_opacity[2] = 0;
		if (evilflame_sprite_swap)
			sprite_index = spr_evilflame_ultimate;
		else if (evilflame_twilight_fury)
			sprite_index = spr_evilflame_fury;
		else
			sprite_index = spr_evilflame + global.chrsel;
	}

	// spawning the charge
	if (cb == 1) {
		switch(global.chrsel) {
			case PLAYER_EVILFLAME:
				cb = 0;
				if (!evilflame_twilight_fury) {
					knockback(10, 180 + image_angle, 1);
					spawn_bullet(x + 20, y, obj_charge, global.chrsel, 0, -1, id);
				} else repeat(irandom_range(2, 6)) {
					spawn_bullet(irandom_range(CANVAS_X, CANVAS_XEND), CANVAS_Y - 50, obj_charge, global.chrsel, 2, -1, id);
				}
			break;
			case PLAYER_DER_SCOOTOMIK:
				cb = 0;
				if (irandom(99) < 30) {
					indicate(x, y, "FIZZLED!", 2, c_white, c_yellow);
					sprite_index = spr_scootomik;
				} else {
					spawn_bullet(x + 20, y, obj_charge, global.chrsel, 0, -1, id);
				}
			break;
			case PLAYER_BOBILEUSZ:
				cb = 0;
				var gear = 0;
				for (var i = STATUS_EFFECT_GEAR1; i < STATUS_EFFECT_GEAR10 + 1; i++) {
					if (status_effect[i]) {
						gear = i - STATUS_EFFECT_GEAR1;
						player_status_add(i, 0, 0);
						break;
					}
				}
				var prevgear = gear;
				gear = gear + keyboard_check(KEYBIND_UP) - keyboard_check(KEYBIND_DOWN);
				indicate(x, y - 50, "GEAR " + string(gear + 1), 2, hsv(100 + (156 * prevgear/10), 255, 255), hsv(100 + (155 * gear/10), 255, 255));
				player_status_add(STATUS_EFFECT_GEAR1 + gear, -2, 0);
			break;
			default:
				spawn_bullet(x + 20, y, obj_charge, global.chrsel, 0, -1, id);
				cb = 0;
			break;
		}
	}

	discharge = max(0, discharge - global.gpspeed);
}

#endregion

#region Ultimate activation

// activation conditions and immediate effect
var is_ultimate_cooldown  = IS_STATUS_EFFECT_ULTIMATE_COOLDOWN;
var is_evilflame_ultimate = (global.chrsel == PLAYER_EVILFLAME && (instance_exists(obj_evilflame_ultimate) || evilflame_twilight_fury));
var is_emerald_ultimate   = (global.chrsel == PLAYER_EMERALD && instance_exists(obj_emerald_ultimate));
var is_scootomik_ultimate = (global.chrsel == PLAYER_DER_SCOOTOMIK && IS_STATUS_EFFECT_CHIP_TUNING);
var is_bobileusz_ultimate = (global.chrsel == PLAYER_BOBILEUSZ && instance_exists(obj_bobileusz_ultimate));
var are_all_ultimates_off = !(is_evilflame_ultimate | is_emerald_ultimate | is_scootomik_ultimate | is_bobileusz_ultimate);
if (keyboard_check_pressed(KEYBIND_ULTIMATE) && ultcount > 0 && !is_ultimate_cooldown && are_all_ultimates_off && global.state == 1 && global.gpspeed != 0 && !instance_exists(obj_ultimate_activation)) {
    ultcount--;
    instance_create(0, 0, obj_ultimate_activation);
    flash_clock = 50;
}

// actual execution start
if (flash_clock == 40) {
    ultblink = 45;
        // particle burst
        part_type_spawn_lt(PART_SYSTEM_PLAYERTOP_LT, PART_TYPE_ULTIMATE_BURST_LT, 0, x - sprite_xoffset, y - sprite_yoffset, x - sprite_xoffset + sprite_width, y - sprite_yoffset + sprite_height, "ellipse", "invgaussian", 100);
		
        if (global.chrsel == PLAYER_EVILFLAME && !TWILIGHT_FURY) {
			part_type_spawn_lt(PART_SYSTEM_PLAYERTOP_LT, PART_TYPE_ULTIMATE_BURST_LT, 0, x - sprite_xoffset, -(y - sprite_yoffset) + room_height, x - sprite_xoffset + sprite_width, -(y - sprite_yoffset + sprite_height) + room_height, "ellipse", "invgaussian", 100);
        } else if (global.chrsel == PLAYER_EMERALD || global.chrsel == PLAYER_BOBILEUSZ) {
	        var random_x = irandom_range(CANVAS_XEND - 600, CANVAS_XEND - 200);
	        var random_y = irandom_range(CANVAS_Y + 234, CANVAS_YEND - 234);
	        part_type_spawn_lt(PART_SYSTEM_PLAYERTOP_LT, PART_TYPE_ULTIMATE_BURST_LT, 0, x, y, random_x, random_y, "line", "linear", 100);
        }
		
    switch(global.chrsel) {
	    case PLAYER_EVILFLAME:
		    if (!TWILIGHT_FURY) {
			    hp /= 2; global.hp /= 2; hpmax /= 2; hpmark /= 2; hpmark_v /= 2;
			    instance_create(0, 0, obj_evilflame_ultimate); //evilflame - dual clone
			    player_status_add(STATUS_EFFECT_DUAL_CLONE, -2, 0);
		    } else {
			    evilflame_twilight_fury = TRUE;
			    sprite_index = spr_evilflame_fury;
			    player_status_add(STATUS_EFFECT_TWILIGHT_FURY, 3600, 0); //evilflame - twilight fury
			    player_status_add(STATUS_EFFECT_BERSERK, 3600, 0);
		    }
	    break;
	    case PLAYER_EMERALD:
			with(obj_enemy) { cooldown = 60; }
			instance_create(random_x, random_y, obj_emerald_ultimate); //emerald - current crush
			player_status_add(STATUS_EFFECT_CURRENT_CRUSH, 900, 0);
			player_status_add(STATUS_EFFECT_SPELL_DRIED, 1200, 0);
		break;
	    case PLAYER_DER_SCOOTOMIK:
		    player_status_add(STATUS_EFFECT_CHIP_TUNING, 30, 0); //der scootomik - chip tuning
		    global.gpspeed_ultimate = 0.05;
		    inv = 0;
	    break;
		case PLAYER_BOBILEUSZ:
			play_sfx(choose(sfx_bobileusz_prism_idle1, sfx_bobileusz_prism_idle2, sfx_bobileusz_prism_idle3), 0);
			instance_create(random_x, random_y, obj_bobileusz_ultimate);
			player_status_add(STATUS_EFFECT_PRISMATIC_GLACIER, 930, 0);
    }
}

#endregion

#region Presents
if (global.state == 1) {
	if (place_meeting(x, y, obj_present) && instance_place(x, y, obj_present).picked == 0) {
		with(instance_place(x, y, obj_present)) {
			switch(f) {
				case 0: { player_hp(number); picked = TRUE; } break;
				case 1: { other.charge = other.ctime; other.artcharge = 1; picked = TRUE; other.bar_opacity[2] = 5; } break;
			}
			play_sfx(sfx_button4, 0);
		}
	} else if (instance_exists(obj_wrap_helper) && instance_exists(helper) && place_meeting(helper.x, helper.y, obj_present) && instance_place(helper.x, helper.y, obj_present).picked == 0) {
		with(instance_place(helper.x, helper.y, obj_present)) {
		switch(f) {
			case 0: { other.hpmark = other.hp;    other.hp = home(other.hp,global.hp,number,0); picked = 1; } break;
			case 1: { other.charge = other.ctime; other.artcharge = 1; picked = 1; } break;
		}
		play_sfx(sfx_button4, 0);
		}
	}
}

#endregion

#region Contact & eprojectile damage (helper also)

if (global.state == 1) {
    if (inv > 0 && global.gpspeed != 0) {
        inv = max(inv - 1, 0);
    }
    if ((global.chrsel == PLAYER_DER_SCOOTOMIK && instance_exists(obj_charge) || instance_exists(obj_ultimate_activation)) && inv <= 0) {
        inv = 1;
    }
    
    if ((place_meeting(x, y, obj_enemy) || place_meeting(x, y, obj_eprojectile)) && hp > 0 && inv == 0 && global.gpspeed != 0) {
        inv = round(invtime / global.gpspeed);
        //contact damage
        if (place_meeting(x, y, obj_enemy) && (!place_meeting(x, y, obj_eprojectile) || (distance_to_object(instance_place(x, y, obj_eprojectile)) > distance_to_object(instance_place(x, y, obj_enemy)))) && instance_place(x, y, obj_enemy).touchable == 1 && instance_place(x, y, obj_enemy).hp > 0) {
            var enemy = instance_place(x, y, obj_enemy);
            if (!IS_STATUS_EFFECT_CHIP_TUNING) {
                var damage = calculate_damage(enemy.bdmg, enemy.bpen, bdef);
                var display_damage = ceil(hp) - ceil(hp - damage);
                player_hp(-damage);
                screenshake_set(round(damage) / 5, point_direction(x, y, enemy.x, enemy.y) % 360, 1, 1, 0);
                knockback((100 - bkbres) * enemy.bkb / 1000, point_direction(enemy.x, enemy.y, x, y), counteracc);
                indicate(x, y, display_damage, 2, rgb(255, 170, 0), c_red);
                if (hp > 0) {
                    play_sfx(sfx_player_hurt, 0, global.sound_gpspeed * 100);
                } else {
                    play_sfx(sfx_player_death, 0, global.sound_gpspeed * 100);
                }
                with(enemy) {
                    var damage = calculate_damage(other.bdmg, other.bpen, bdef);
                    var display_damage = ceil(hp) - ceil(hp - damage);
                    hp = clamp(hp - damage, 0, hpmax);
                    knockback((100 - bkbres) * other.bkb / 1000, point_direction(other.x, other.y, x, y), 1);
                    indicate(x, y, display_damage, 1, rgb(255, 85, 0), c_red);
                    if (global.enemy_details_selection_auto_aim) {
                        global.enemy_details_selection = id;
                    }
                }
            } else { //split the enemy in two
                if (abs(xv) + abs(yv) >= spd * global.gpspeed * 0.8) {
                    scr_EnemySplit(enemy, point_direction(0, 0, xv, yv));
                    enemy.hp = 0;
                    with(enemy) {
                        event_perform(ev_other, ev_user1);
                    }
                } else {
                    enemy.hp = clamp(enemy.hp - floor(sqrt(sqr(xv) + sqr(yv))), 0, enemy.hp);
                }
            }
        }
        
        //eprojectile damage
        if (place_meeting(x, y, obj_eprojectile) && (!place_meeting(x, y, obj_enemy) || distance_to_object(instance_place(x, y, obj_enemy)) > distance_to_object(instance_place(x, y, obj_eprojectile)) || instance_place(x, y, obj_enemy).touchable == 0)) {
            var projectile = instance_place(x, y, obj_eprojectile);
            if (!IS_STATUS_EFFECT_CHIP_TUNING) {
                var damage = calculate_damage(projectile.pdmg, projectile.ppen, pdef);
                var display_damage = ceil(hp) - ceil(hp - damage);
                player_hp(-damage);
                screenshake_set(round(damage) / 5, point_direction(x, y, projectile.x, projectile.y) % 360, 1, 1, 0);
                knockback((100 - pkbres) * projectile.pkb / 1000, point_direction(projectile.x, projectile.y, x, y), counteracc);
                indicate(projectile.x, projectile.y, display_damage, 2, rgb(255, 170, 0), c_red);
                if (hp > 0) {
                    play_sfx(sfx_player_hurt, 0, global.sound_gpspeed * 100);
                } else {
                    play_sfx(sfx_player_death, 0, global.sound_gpspeed * 100);
                }
            }
            with (projectile) {
                lifespan = 0;
				instance_destroy();
            }
        }
    }
    
    ////////// HELPER ALTERNATIVE
    if (instance_exists(obj_wrap_helper) && instance_exists(helper)) {
        var hx = helper.x; var hy = helper.y;
        if ((place_meeting(hx, hy, obj_enemy) || place_meeting(hx, hy, obj_eprojectile)) && hp > 0 && inv == 0 && global.gpspeed != 0) {
            inv = round(invtime / global.gpspeed); play_sfx(sfx_player_hurt, 0);
            // helper contact damage
            if (place_meeting(hx, hy, obj_enemy) && (!place_meeting(hx, hy, obj_eprojectile) || (distance_to_object(instance_place(hx, hy, obj_eprojectile)) > distance_to_object(instance_place(hx, hy, obj_enemy)))) && instance_place(hx, hy, obj_enemy).touchable == 1 && instance_place(hx, hy, obj_enemy).hp > 0) {
                var enemy = instance_place(hx, hy, obj_enemy);
                if (!IS_STATUS_EFFECT_CHIP_TUNING) {
                    var damage = calculate_damage(enemy.bdmg, enemy.bpen, bdef);
                    var display_damage = ceil(hp) - ceil(hp - damage);
                    player_hp(-damage);
                    screenshake_set(round(damage) / 5, point_direction(hx, hy, enemy.x, enemy.y) % 360, 1, 1, 0);
                    knockback((100 - bkbres) * enemy.bkb / 1000, point_direction(enemy.x, enemy.y, hx, hy), counteracc);
                    indicate(hx, hy, display_damage, 2, rgb(255, 170, 0), c_red);
                    if (hp > 0) {
                        play_sfx(sfx_player_hurt, 0, global.sound_gpspeed * 100);
                    } else {
                        play_sfx(sfx_player_death, 0, global.sound_gpspeed * 100);
                    }
                    with (enemy) {
                        var damage = calculate_damage(other.bdmg, other.bpen, bdef);
                        var display_damage = ceil(hp) - ceil(hp - damage);
                        hp = clamp(hp - damage, 0, hpmax);
                        knockback((100 - bkbres) * other.bkb / 1000, point_direction(hx, hy, x, y), 1);
                        indicate(x, y, display_damage, 1, rgb(255, 85, 0), c_red);
                        if (global.enemy_details_selection_auto_aim) {
                            global.enemy_details_selection = id;
                        }
                    }
                } else { //split the enemy in two
                    if (abs(xv) + abs(yv) >= spd * global.gpspeed * 0.8) {
                        scr_EnemySplit(enemy, point_direction(0, 0, xv, yv));
                        enemy.hp = 0;
                        with(enemy) {
                            event_perform(ev_other, ev_user1);
                        }
                    } else {
                        enemy.hp = clamp(enemy.hp - floor(sqrt(sqr(xv) + sqr(yv))), 0, enemy.hp);
                    }
                }
            }
            
            // helper eprojectile damage
            if (place_meeting(hx, hy, obj_eprojectile) && (!place_meeting(hx, hy, obj_enemy) || distance_to_object(instance_place(hx, hy, obj_enemy)) > distance_to_object(instance_place(hx, hy, obj_eprojectile)) || instance_place(hx, hy, obj_enemy).touchable == 0)) {
                var projectile = instance_place(hx, hy, obj_eprojectile);
                if (!IS_STATUS_EFFECT_CHIP_TUNING) {
                    var damage = calculate_damage(projectile.pdmg, projectile.ppen, pdef);
                    var display_damage = ceil(hp) - ceil(hp-damage);
                    player_hp(-damage);
                    screenshake_set(round(damage) / 5, point_direction(hx, hy, projectile.x, projectile.y) % 360, 1, 1, 0);
                    knockback((100 - pkbres) * projectile.pkb / 1000, point_direction(projectile.x, projectile.y, hx, hy), counteracc);
                    indicate(projectile.x, projectile.y, display_damage, 2, rgb(255, 170, 0), c_red);
                    if (hp > 0) {
                        play_sfx(sfx_player_hurt, 0, global.sound_gpspeed * 100);
                    } else {
                        play_sfx(sfx_player_death, 0, global.sound_gpspeed * 100);
                    }
                }
                with (projectile) {
                    lifespan = 0;
					instance_destroy();
                }
            }
        }
    }
}

#endregion

#region Game Over

if (hp <= 0 && image_alpha == 1) {
	if (instance_exists(obj_evilflame_ultimate)) { //dual clone alternative
		instance_create(x, y, obj_explosion);
		evilflame_sprite_swap = toggle(evilflame_sprite_swap);
		x              = obj_evilflame_ultimate.x;
		y              = obj_evilflame_ultimate.y;
		hp             = obj_evilflame_ultimate.hp;
		hpmax          = obj_evilflame_ultimate.hpmax;
		inv            = obj_evilflame_ultimate.inv;
		invtime        = obj_evilflame_ultimate.invtime;
		hpmark         = obj_evilflame_ultimate.hpmark;
		hpmark_v       = obj_evilflame_ultimate.hpmark_v;
		color          = obj_evilflame_ultimate.color;
		shot           = obj_evilflame_ultimate.shot;
		charge		   = obj_evilflame_ultimate.charge;
		ctime		   = obj_evilflame_ultimate.ctime;
		discharge	   = obj_evilflame_ultimate.discharge;
		ccooldown	   = obj_evilflame_ultimate.ccooldown;
		artcharge	   = obj_evilflame_ultimate.artcharge;
		cb             = obj_evilflame_ultimate.cb;
		bar_opacity[0] = obj_evilflame_ultimate.bar_opacity[0];
		bar_opacity[1] = obj_evilflame_ultimate.bar_opacity[1];
		bar_opacity[2] = obj_evilflame_ultimate.bar_opacity[2];
		bar_yoffset[0] = obj_evilflame_ultimate.bar_yoffset[0];
		bar_yoffset[1] = obj_evilflame_ultimate.bar_yoffset[1];
		bar_yoffset[2] = obj_evilflame_ultimate.bar_yoffset[2];
		if (evilflame_sprite_swap == 1) {
			if (sprite_index == spr_evilflame)
				sprite_index = spr_evilflame_ultimate;
			else if (sprite_index == spr_evilflame_shooting)
				sprite_index = spr_evilflame_ultimate_shooting;
			else if (sprite_index == spr_evilflame_charging)
				sprite_index = spr_evilflame_ultimate_charging;
		} else {
			if (sprite_index == spr_evilflame_ultimate)
				sprite_index = spr_evilflame;
			else if (sprite_index == spr_evilflame_ultimate_shooting)
				sprite_index = spr_evilflame_shooting;
			else if (sprite_index == spr_evilflame_ultimate_charging)
				sprite_index = spr_evilflame_charging;
		}
		with(obj_evilflame_ultimate) { instance_destroy(); }
	}
	else {
		image_alpha = 0;
		switch(global.chrsel) {
			case PLAYER_EMERALD:
				with(obj_charge) { instance_destroy(); }
			break;
			case PLAYER_BOBILEUSZ:
				with(obj_minion) { instance_destroy(); }
			break;
		}
		if (instance_exists(helper)) {
			with(helper) { instance_create(x, y, obj_explosion); instance_destroy(); }
		}
		instance_create(x, y, obj_explosion);
		global.state = 2;
		global.gpspeed_state = 0.1;
	}
}

#endregion

#region Inherit parent event

event_inherited();

#endregion
