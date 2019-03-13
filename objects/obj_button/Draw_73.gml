/// @description

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw self & overlays

//these are drawn elsewhere, so they skip this code block
if (f == 21 || f == 22) {
	surface_reset_target();
	exit;
}

//pause button dark fade
if (f == 8) {
	if (gpspeed == 0 && state == 1) {
		screen_darken(0.75);
	}
}

if (sprite_index == spr_stats_checkbox && image_index == 1) { // this one sprite has semi-transparent parts
	gpu_set_alphatestref(0);
}
draw_self();
gpu_set_alphatestref(254);

// Overlays
switch(f) {
	case 0: case 1: case 2: case 3: case 4:
		draw_sprite(spr_button_ol, f, x - (8*image_index) + ((sprite_width - sprite_get_width(sprite_index))/2), y - (8*image_index));
	break;
	case 15:
		draw_sprite(spr_button_pause_ol, 4, x, y);
	break;
	case 9: case 10: case 11: case 12:
		draw_sprite(spr_button_pause_ol, f - 9, x, y);
	break;
	case 14:
		if (place_meeting(x, y, boss)) {draw_tooltip("Join Randoragon's#Discord server!", c_white, rgb(83, 122, 222), c_white);}
	break;
	case 16:
		if (place_meeting(x, y, boss)) {draw_tooltip("Support Waterflame's#awesome music!", rgb(25, 199, 214), c_black, rgb(255, 120, 0));}
	break;
	case 24:
		draw_set_align(fa_left, fa_middle); draw_set_color(c_black); draw_text_transformed(429, y, string_hash_to_newline("SAVE CHUNK SIZE"), 3, 3, 0);
		if (place_meeting(x, y, boss)) { draw_tooltip("Saving & loading will take longer, but#require less processing power."); }
	break;
	case 25:
		if (place_meeting(x, y, boss)) { draw_tooltip("This is the default setting#sufficient for most machines."); }
	break;
	case 26:
		if (place_meeting(x, y, boss)) { draw_tooltip("Sacrifices performance for more speed.#Works best on beefy computers."); }
	break;
	case 27:
		if (place_meeting(x, y, boss)) { draw_tooltip("Check out my#other games!", rgb(128, 255, 0), c_dkgray, c_white); }
	break;
}

#endregion

#region Draw player GUI bars

if (f == 8 && instance_exists(obj_player) && global.loading == 0) {
    //HP bar
    var target	 = obj_player;
    var hpmark	 = target.hpmark;
    var hpmark_v = target.hpmark_v;
    var hp		 = target.hp;
    var hpmax	 = target.hpmax;
    var ultcount = target.ultcount;
    var ultblink = target.ultblink;
    gpu_set_alphatestref(0);
    draw_sprite_ext(spr_HP_bar, 1, GUI_X + 43, GUI_Y + 3, 1, 1, 0, c_black, 0.5);
    if (hpmark < hp) {
        draw_sprite_ext(spr_HP_bar, 1, GUI_X + 43, GUI_Y + 3, clamp(hpmark/hpmax, 0, 1), 1, 0, c_red, 0.75);
        draw_sprite_ext(spr_HP_bar, 1, GUI_X + 43 + (294*clamp(hp/hpmax, 0, 1)), GUI_Y + 4, clamp((hpmark - hp)/hpmax, -1, 0), 1, 0, c_lime, 0.75);
    } else {
        draw_sprite_ext(spr_HP_bar, 1, GUI_X + 43, GUI_Y + 3, clamp(hp/hpmax, 0, 1), 1, 0, c_red, 0.75);
        draw_sprite_ext(spr_HP_bar, 1, GUI_X + 43 + (294*clamp(hp/hpmax, 0, 1)), GUI_Y + 4, clamp((hpmark - hp)/hpmax, 0, 1), 1, 0, c_yellow, 0.75);
    }
    gpu_set_alphatestref(254);
    draw_sprite(spr_HP_bar, 0, GUI_X + 43, GUI_Y + 3);
    draw_set_align(fa_center, fa_middle);
    draw_text_outline(GUI_X + 43 + 151, GUI_Y + 20, string(ceil(hp)) + " / " + string_format(hpmax, -1, 0), 2, 2, 0, c_red, 0, c_black, 1);
    gpu_set_alphatestref(0);
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(spr_HP_bar, 2, GUI_X + 44, GUI_Y + 3, 1, 1, 0, c_black, 0.5);
    gpu_set_blendmode(bm_normal);
    gpu_set_colorwriteenable(1, 1, 1, 0);
    draw_sprite_ext(spr_HP_bar, 2, GUI_X + 44, GUI_Y + 3, 1, 1, 0, c_black, 0.5);
    gpu_set_colorwriteenable(1, 1, 1, 1);
    gpu_set_alphatestref(254);
    draw_set_halign(fa_left);
    draw_text_outline(GUI_X + 63, GUI_Y + 20, "HP", 2, 2, 0, c_red, 0, c_black, 1);
    if ((ultblink > 15 && ultblink <= 30) || (ultblink <= -15 && ultblink > -30) || ultblink == 0) {
        draw_text_outline(GUI_X + 345, GUI_Y + 20, string_replace(string_format(ultcount, 2, 0), " ", "0"), 2, 2, 0, c_gray, 0, c_black, 1);
    } else {
        draw_text_outline(GUI_X + 345, GUI_Y + 20, string_replace(string_format(ultcount, 2, 0), " ", "0"), 2, 2, 0, c_ltgray, 0, c_dkgray, 1);
    }
    
    //Focus bar
    var focus   = target.focus;
    var foctime = target.foctime;
    gpu_set_alphatestref(0);
    draw_sprite_ext(spr_GUI_bar, 1, GUI_X + 6, GUI_Y + 40, 1, 1, 0, c_black, 0.5);
    draw_sprite_ext(spr_GUI_bar, 1, GUI_X + 6, GUI_Y + 40, clamp(focus/foctime, 0, 1), 1, 0, c_white, 0.75);
    gpu_set_alphatestref(254);
    draw_sprite_ext(spr_GUI_bar, 0, GUI_X + 6, GUI_Y + 40, 1, 1, 0, c_white, 1);
    draw_text_outline(GUI_X + 26, GUI_Y + 51, "FOCUS", 2, 2, 0, c_white, 0, c_black, 1);
    draw_set_halign(fa_center);
    draw_text_outline(GUI_X + 153, GUI_Y + 51, string_format(focus/60, -1, 1) + "s / " + string_format(foctime/60, -1, 1) + "s", 2, 2, 0, c_white, 0, c_black, 1);
    
    //Charge bar
    var discharge = target.discharge;
    var ccooldown = target.ccooldown;
    var color     = global.color[global.chrsel];
    var charge    = target.charge;
    var ctime     = target.ctime;
    gpu_set_alphatestref(0);
    draw_sprite_ext(spr_GUI_bar, 1, GUI_X + 6, GUI_Y + 67, 1, 1, 0, c_black, 0.5);
    draw_sprite_ext(spr_GUI_bar, 1, GUI_X + 6, GUI_Y + 67, clamp(discharge/ccooldown, 0, 1), 1, 0, color_shift_hsv(color, 128, 0, 0, 1), 0.75);
    draw_sprite_ext(spr_GUI_bar, 1, GUI_X + 6, GUI_Y + 67, clamp(charge/ctime, 0, 1), 1, 0, color, 0.75);
    gpu_set_alphatestref(254);
    draw_sprite_ext(spr_GUI_bar, 0, GUI_X + 6, GUI_Y + 67, 1, 1, 0, c_white, 1);
    if (discharge > 0) {
        draw_text_outline(GUI_X + 153, GUI_Y + 78, "- " + string_format(discharge/60, -1, 1) + "s", 2, 2, 0, color_shift_hsv(color, 128, 0, 0, 1), 0, c_black, 1);
        draw_set_halign(fa_left);
        draw_text_outline(GUI_X + 26, GUI_Y + 78, "CHARGE", 2, 2, 0, color_shift_hsv(color, 128, 0, 0, 1), 0, c_black, 1);
    } else {
        draw_text_outline(GUI_X + 153, GUI_Y + 78, string_format(charge/60, -1, 1) + "s / " + string_format(ctime/60, -1, 1) + "s", 2, 2, 0, color, 0, c_black, 1);
        draw_set_halign(fa_left);
        draw_text_outline(GUI_X + 26, GUI_Y + 78, "CHARGE", 2, 2, 0, color, 0, c_black, 1);
    }
    
    if (instance_exists(obj_evilflame_ultimate) && global.chrsel == 0) { // EVILFLAME'S DUAL CLONE ALTERNATIVE
        var target = obj_evilflame_ultimate;
        
        //HP Bar
        var hpmark   = target.hpmark;
        var hpmark_v = target.hpmark_v;
        var hp       = target.hp;
        var hpmax    = target.hpmax;
        var ultcount = obj_player.ultcount;
        var ultblink = obj_player.ultblink;
        gpu_set_alphatestref(0);
        draw_sprite_ext(spr_HP_bar, 1, GUI_X + 43, GUI_Y + 731, 1, 1, 0, c_black, 0.5);
        if (hpmark < hp) {
            draw_sprite_ext(spr_HP_bar, 1, GUI_X + 43, GUI_Y + 731, clamp(hpmark/hpmax, 0, 1), 1, 0, c_red, 0.75);
            draw_sprite_ext(spr_HP_bar, 1, GUI_X + 43 + (294*clamp(hp/hpmax, 0, 1)), GUI_Y + 730, clamp((hpmark - hp)/hpmax, -1, 0), 1, 0, c_lime, 0.75);
        } else {
            draw_sprite_ext(spr_HP_bar, 1, GUI_X + 43, GUI_Y + 731, clamp(hp/hpmax, 0, 1), 1, 0, c_red, 0.75);
            draw_sprite_ext(spr_HP_bar, 1, GUI_X + 43 + (294*clamp(hp/hpmax, 0, 1)), GUI_Y + 730, clamp((hpmark - hp)/hpmax, 0, 1), 1, 0, c_yellow, 0.75);
        }
        gpu_set_alphatestref(254);
        draw_sprite(spr_HP_bar, 0, GUI_X + 43, GUI_Y + 731);
        draw_set_align(fa_center, fa_middle);
        draw_text_outline(GUI_X + 43 + 151, GUI_Y + 746, string(ceil(hp)) + " / " + string_format(hpmax, -1, 0), 2, 2, 0, c_red, 0, c_black, 1);
        gpu_set_alphatestref(0);
        gpu_set_blendmode(bm_add);
        draw_sprite_ext(spr_HP_bar, 2, GUI_X + 44, GUI_Y + 731, 1, 1, 0, c_black, 0.5);
        gpu_set_blendmode(bm_normal);
        gpu_set_colorwriteenable(1, 1, 1, 0);
        draw_sprite_ext(spr_HP_bar, 2, GUI_X + 44, GUI_Y + 731, 1, 1, 0, c_black, 0.5);
        gpu_set_colorwriteenable(1, 1, 1, 1);
        gpu_set_alphatestref(254);
        draw_set_halign(fa_left);
        draw_text_outline(GUI_X + 63, GUI_Y + 746, "HP", 2, 2, 0, c_red, 0, c_black, 1);
        if ((ultblink > 15 && ultblink <= 30) || (ultblink <= -15 && ultblink > -30) || ultblink == 0) {
            draw_text_outline(GUI_X + 345, GUI_Y + 748, string_replace(string_format(ultcount, 2, 0), " ", "0"), 2, 2, 0, c_gray, 0, c_black, 1);
        } else {
            draw_text_outline(GUI_X + 345, GUI_Y + 748, string_replace(string_format(ultcount, 2, 0), " ", "0"), 2, 2, 0, c_ltgray, 0, c_dkgray, 1);
        }
        draw_sprite(spr_evilflame_ultimate_icon, 0, GUI_X, GUI_Y + 765);
        
        //Focus bar
        var focus   = obj_player.focus;
        var foctime = obj_player.foctime;
        gpu_set_alphatestref(0);
        draw_sprite_ext(spr_GUI_bar, 1, GUI_X + 6, GUI_Y + 704, 1, 1, 0, c_black, 0.5);
        draw_sprite_ext(spr_GUI_bar, 1, GUI_X + 6, GUI_Y + 704, clamp(focus/foctime, 0, 1), 1, 0, c_white, 0.75);
        gpu_set_alphatestref(254);
        draw_sprite_ext(spr_GUI_bar, 0, GUI_X + 6, GUI_Y + 704, 1, 1, 0, c_white, 1);
        draw_text_outline(GUI_X + 26, GUI_Y + 715, "FOCUS", 2, 2, 0, c_white, 0, c_black, 1);
        draw_set_halign(fa_center);
        draw_text_outline(GUI_X + 153, GUI_Y + 717, string_format(focus/60, -1, 1) + "s / " + string_format(foctime/60, -1, 1) + "s", 2, 2, 0, c_white, 0, c_black, 1);
        
        //Charge bar
        var discharge = target.discharge;
        var ccooldown = target.ccooldown;
        var color     = global.color[global.chrsel];
        var charge    = target.charge;
        var ctime     = target.ctime;
        gpu_set_alphatestref(0);
        draw_sprite_ext(spr_GUI_bar, 1, GUI_X + 6, GUI_Y + 677, 1, 1, 0, c_black, 0.5);
        draw_sprite_ext(spr_GUI_bar, 1, GUI_X + 6, GUI_Y + 677, clamp(discharge/ccooldown, 0, 1), 1, 0, color_shift_hsv(color, 128, 0, 0, 1), 0.75);
        draw_sprite_ext(spr_GUI_bar, 1, GUI_X + 6, GUI_Y + 677, clamp(charge/ctime, 0, 1), 1, 0, color, 0.75);
        gpu_set_alphatestref(254);
        draw_sprite_ext(spr_GUI_bar, 0, GUI_X + 6, GUI_Y + 677, 1, 1, 0, c_white, 1);
        if (discharge > 0) {
            draw_text_outline(GUI_X + 153, GUI_Y + 688, "- " + string_format(discharge/60, -1, 1) + "s", 2, 2, 0, color_shift_hsv(color, 128, 0, 0, 1), 0, c_black, 1);
            draw_set_halign(fa_left);
            draw_text_outline(GUI_X + 26, GUI_Y + 688, "CHARGE", 2, 2, 0, color_shift_hsv(color, 128, 0, 0, 1), 0, c_black, 1);
        } else {
            draw_text_outline(GUI_X + 153, GUI_Y + 688, string_format(charge/60, -1, 1) + "s / " + string_format(ctime/60, -1, 1) + "s", 2, 2, 0, color, 0, c_black, 1);
            draw_set_halign(fa_left);
            draw_text_outline(GUI_X + 26, GUI_Y + 688, "CHARGE", 2, 2, 0, color, 0, c_black, 1);
        }
    }
}

#endregion

#region Status effects display & update

if (f == 8 && state == 1 && !global.loading && ds_exists(player_status_effects, ds_type_grid) && ds_grid_height(player_status_effects) > 0) {
	player_status_update();
	gpu_set_alphatestref(0);
	draw_set_align(fa_left, fa_top);
	
	var xx, yy, status_id, timer_text, timer_countdown;
	for (var i = 0; i < ds_grid_height(player_status_effects); i++) {
		xx              = GUI_X + 403 + (i*37);
		yy              = GUI_Y + 3;
		timer_countdown = player_status_effects[# 1, i];
		status_id       = player_status_effects[# 0, i];
		if (timer_countdown >= 0) {
			shader_set(shd_clock_overlay);
			shader_set_uniform_f(uni_center, xx + 17, yy + 17);
			shader_set_uniform_f(uni_time, 1 - (timer_countdown/player_status_effects[# 2, i]));
			draw_sprite(spr_status_exhausted + status_id, 0, xx, yy);
			shader_reset();
			draw_sprite(spr_status_border, 0, xx, yy);
		} else {
			draw_sprite(spr_status_exhausted + status_id, 0, xx, yy);
		}

		//draw mouse hover highlight
		if (boss.y <= yy + 34 && boss.y >= yy && boss.x >= xx && boss.x <= xx + 34) {
			draw_set_alpha(.75);
			draw_set_color(c_black);
			if (timer_countdown >= 0) {
				if (timer_countdown < 60) {
					timer_text = " - " + string_format(timer_countdown / 60, -1, 2) + "s";
				} else if (timer_countdown < 3600) {
					timer_text = " - " + string(floor(timer_countdown / 60)) + "s";
				} else {
					timer_text = " - " + string(floor(timer_countdown / 3600)) + "m " + string(floor(timer_countdown / 60) % 60) + "s";
				}
			} else {
				timer_text = " - " + chr(8734);
			}
			var rec_width = max(2 * string_width(string_hash_to_newline(global.player_status_effect_name[status_id])), 2 * string_width(timer_text), 2 * string_width(string_hash_to_newline(global.player_status_effect_desc[status_id])));

			draw_roundrect(xx - 4, yy + 36, xx + rec_width + 4, yy + 40 + (2 * string_height(string_hash_to_newline(global.player_status_effect_desc[status_id] + "###"))), 0);
			draw_set_alpha(1);
			draw_set_color(c_white);
			draw_text_transformed(xx, yy + 38, string_hash_to_newline(global.player_status_effect_name[status_id]), 2, 2, 0);
			draw_set_color(c_yellow);
			draw_text_transformed(xx, yy + 38, string_hash_to_newline("#" + timer_text), 2, 2, 0);
			draw_set_color(c_ltgray);
			draw_text_transformed(xx, yy + 38, string_hash_to_newline("##" + global.player_status_effect_desc[status_id]), 2, 2, 0);
		}
	}
	gpu_set_alphatestref(254);
}

#endregion

#region Draw death message, score, character names

if (f == 8 && room == rm_Main && !global.loading) {
	//CHARACTER NAMES
	if (global.transition != 1) {
		draw_set_align(fa_center, fa_bottom);
		draw_text_outline(GUI_X + 683, GUI_Y + 475, global.name[global.chrsel], 4 - (4*global.transition), 4, 0, c_black, 1, c_black, 1);
		draw_text_outline(GUI_X + 683, GUI_Y + 471, global.name[global.chrsel], 4 - (4*global.transition), 4, 0, global.color[global.chrsel], 1, color_shift_hsv(global.color[global.chrsel], 0, 0, -170, 1), 1);
	}

	//SCORE
	draw_set_align(fa_right, fa_top);
	draw_text_outline(GUI_XEND - 10, GUI_Y - 80 + (85*global.transition), "score: " + string_format(global.points, -1, 0), 3, 3, 0, c_yellow, 1, c_black, 1);

	//'YOU DIED!' MESSAGE
	if (state == 2) {
		if (global.gpspeed_state < 0.5) { global.gpspeed_state = home(global.gpspeed_state, 0.5, 0.01); }
		draw_set_alpha(0.6);
		draw_set_color(c_black);
		gpu_set_alphatestref(0);
		gpu_set_blendmode(bm_add);
		draw_rectangle(0, 0, GUI_XEND, GUI_YEND, 0);
		gpu_set_blendmode(bm_normal);
		gpu_set_colorwriteenable(1, 1, 1, 0);
		draw_rectangle(0, 0, GUI_X, GUI_Y, 0);
		gpu_set_colorwriteenable(1, 1, 1, 1);
		gpu_set_alphatestref(254);
		draw_set_alpha(1);
		draw_set_align(fa_center, fa_top);
		draw_text_outline(GUI_X + 683, GUI_Y + 300, "GAME OVER!", 4, 4, 0, c_yellow, 1, c_black, 1);
		draw_text_outline(GUI_X + 683, GUI_Y + 360, "enemies killed: " + string(kill_count) + "#final score: " + string(global.points) + "##press space to continue", 2, 2, 0, c_white, 0, c_black, 1);
	}
}

#endregion

#region Reset surface

surface_reset_target();

#endregion