/// @description Button Behavior

if (global.busy == 0 || (f == 17 || f == 18 || f == 19 || f == 20)) {
    
    #region Constant behavior
	
    switch(f) {
	    case 5:
			image_xscale = 2 - (2 * global.transition);
			x = xstart - (50 * global.transition);
			if (global.transition == 1 && global.state == 1) { instance_destroy(); }
		break;
	    case 6:
			image_xscale = 2 - (2 * global.transition);
			x = xstart + (50 * global.transition);
			if (global.transition == 1 && global.state == 1) { instance_destroy(); }
		break;
	    case 7:
			x = xstart - (global.transition * 40);
		break;
	    case 8:
			y = ystart - ((1 - global.transition) * 40);
			image_index = (2 * (global.gpspeed > 0)) + ((mouse_check_button(mb_left) || keyboard_check(vk_escape)) && grabbed = 1);
		break;
	    case 9: case 10: case 11: case 12:
			if (global.gpspeed != 0) { instance_destroy(); }
		break;
	    case 17:
			if (obj_slot_load.start_busy != global.busy) { exit };
			if (obj_slot_load.page == 0) {
				image_blend = c_gray;
			} else {
				image_blend = rgb(255, 150, 100);
			}
		break;
	    case 18:
			if (obj_slot_load.start_busy != global.busy) { exit; }
			if (obj_slot_load.page == ceil((array_length_1d(obj_slot_load.slot) - 1) / 6) - 1) {
				image_blend = c_gray;
			} else {
				image_blend = rgb(255, 150, 100);
			}
		break;
	    case 19: case 20:
			if (obj_slot_load.start_busy != global.busy) { exit; }
			if (obj_slot_load.selection == "") {
				image_index = 2;
			} else {
				image_index = grabbed;
			}
		break;
	    case 21:
			if (sprite_index != noone) { image_blend = color_shift_hsv(c_orange, 10 * show, 0, 40 * show, 1); }
			if (instance_exists(obj_statboard)) {
				x = obj_statboard.x + 115;
				y = obj_statboard.y - 170;
			}
		break;
	    case 22:
			if (sprite_index != noone) { image_blend = color_shift_hsv(c_orange, 10 * customize, 0, 40 * customize, 1); }
			if (instance_exists(obj_statboard)) {
				x = obj_statboard.x - 87;
				y = obj_statboard.y - 170;
			}
		break;
	    case 24:
			image_index = 0 + (3 * (global.save_chunk_size == 200));
		break;
	    case 25:
			image_index = 1 + (3 * (global.save_chunk_size == 500));
		break;
	    case 26:
			image_index = 2 + (3 * (global.save_chunk_size == 1500));
		break;
    }
    
	#endregion
	
	
    if (place_meeting(x, y, boss) && image_alpha == 1) {
		
		#region On mouse hover
		
        switch(f) {
	        case 0: case 1: case 2: case 3: case 4:
				image_index = 0;
				image_xscale = home(image_xscale, 1.1, 0.04, 0);
			break;
	        case 5: case 17: case 18:
				image_index = 0;
			break;
	        case 6:
				image_index = 2;
			break;
	        case 7:
				image_index = 0;
				if (grabbed != 1) {
					image_blend = c_ltgray;
				} else {
					image_blend = c_white;
				}
			break;
	        case 8:
				if (grabbed != 1) {
					image_blend = c_ltgray;
				} else {
					image_blend = c_white;	
				}
			break;
	        case 9: case 10: case 11: case 12: case 15:
				image_index = 0;
			break;
	        case 13: case 14: case 16: case 27:
				image_scale(home(image_xscale, 1.1, 0.04, 0), image_xscale);
			break;
	        case 23:
				image_index = 1 + check;
				image_scale(home(image_xscale, 1, 0.08, 0), image_xscale);
			break;
        }
		
		#endregion
		
    } else {
		
		#region Idle global.state (not hovering)
		
        switch(f) {
	        case 0: case 1: case 2: case 3: case 4:
				image_index = 0;
				image_xscale = home(image_xscale, 1, 0.08, 0);
			break;
	        case 5: case 9: case 10: case 11: case 12: case 15: case 17: case 18:
				image_index = 0;
			break;
	        case 6:
				image_index = 2;
			break;
	        case 7:
				image_blend = c_white;
				image_index = 0;
			break;
	        case 8:
				image_blend = c_white;
			break;
	        case 13: case 14: case 16: case 27:
				image_scale(home(image_xscale, 1, 0.04, 0), image_xscale);
				image_blend = c_white;
			break;
	        case 23:
				image_index = 2 * check;
			break;
	        case 21:
				image_index = grabbed + (2 * show);
				image_scale(home(image_xscale, 1, 0.08, 0), image_xscale);
			break;
        }
		
		#endregion
		
    }
    
    #region On mouse press
	
    if (place_meeting(x, y, boss) && mouse_check_button_pressed(mb_left) && image_alpha == 1 && !instance_exists(obj_transition)) {
        switch(f) {
        case 5:
            // previous character
            if (global.state == 0) {
	            grabbed = 1;
	            image_index = 1;
	            play_sfx(sfx_button1, 0, 0);
	            global.chrsel = (global.chrsel == 0)? CHRCOUNT - 1 : global.chrsel - 1;
	            scr_PlayerDataUpdate(global.chrsel);
	            scr_PlayerGetData();
	            scr_ParticlesUpdate();
	            scr_LoreUpdate();
				scr_Stats_Update(obj_statboard.button[0].show);
            }
        break;
        case 6:
            // next character
            if (global.state == 0) {
                grabbed = 1;
                image_index = 3;
                play_sfx(sfx_button1, 0, 0);
                global.chrsel = (global.chrsel == CHRCOUNT - 1)? 0 : global.chrsel + 1;
                scr_PlayerDataUpdate(global.chrsel);
                scr_PlayerGetData();
                scr_ParticlesUpdate();
                scr_LoreUpdate();
                scr_Stats_Update(obj_statboard.button[0].show);
            }
        break;
        case 8: if (global.state == 1 && global.transition == 1) {grabbed = 1; if (global.gpspeed_state != 0) {scr_Pause();} else {play_sfx(sfx_pause, 0, 0); global.gpspeed_state = 1; wipe(obj_sound_bar); audio_resume_all();}} break;
        case 21: play_sfx(sfx_button1, 0, 0); show = toggle(show); scr_toggle_stats_selection(0); scr_Stats_Update(show); ini_open(working_directory + "userconfig.mbdat"); ini_write_real("shown_stats", "show", show); ini_close(); grabbed = 1; break;
        case 22: play_sfx(sfx_button1, 0, 0); scr_toggle_stats_selection(toggle(customize)); if (customize == 0 && obj_statboard.button[0].show == 0) scr_Stats_Update(0); grabbed = 1; break;
        case 23: check = toggle(check); grabbed = 1; break;
        case 24: play_sfx(sfx_button1, 0, 0); global.save_chunk_size = 200; break;
        case 25: play_sfx(sfx_button1, 0, 0); global.save_chunk_size = 500; break;
        case 26: play_sfx(sfx_button1, 0, 0); global.save_chunk_size = 1500; break;
        default: grabbed = 1; break;
        }
    }
	
   #endregion
   
    #region On mouse hold
	
    if (grabbed == 1 && mouse_check_button(mb_left) && image_alpha == 1) {
        switch(f) {
	        case 0: case 1: case 2: case 3: case 4: case 5: case 7:
				image_index = 1;
			break;
	        case 6:
				image_index = 3;
			break;
	        case 9: case 10: case 11: case 12: case 15:
				image_index = 1;
			break;
	        case 17: case 18:
				if (image_blend != c_gray) { image_index = 1; }
			break;
	        case 21:
				image_index = 1 + (2 * show);
			break;
	        case 22:
				image_index = 1 + (2 * customize);
			break;
	        case 23:
				image_index = 2 * check;
				image_scale(home(image_xscale, 0.9, 0.08, 0), image_xscale);
			break;
	        case 13: case 14: case 16: case 27:
				image_blend = c_ltgray;
				image_scale(home(image_xscale, 0.9, 0.08, 0), image_xscale);
				grabbed = 1;
			break;
        }
    }
    
	#endregion
	
    #region On mouse release
	
    if (grabbed == 1 && mouse_check_button_released(mb_left) && image_alpha == 1 && !instance_exists(obj_transition)) {
        grabbed = 0;
        if (place_meeting(x, y, boss)) {
            switch(f) {
	            case 0:
					screen_transition(rm_Realms, -1, 30, choose(-1, 1, -2, 2), c_black);
					play_sfx(sfx_button2, 0, 0);
				break;
	            case 1:
					screen_transition(rm_Help, -1, 30, choose(-1, 1, -2, 2), c_black);
					play_sfx(sfx_button2, 0, 0);
				break;
	            case 2:
					display_message("Lore isn't available yet.\nMaybe in the next update... Or not. We'll see.\nSorry for the inconvenience!\nRandoragon", scrm_do_nothing);
				break;
	            case 3:
					screen_transition(rm_Settings, -1, 30, choose(-1, 1, -2, 2), c_black);
					play_sfx(sfx_button2, 0, 0);
				break;
	            case 4:
					ask("Quit the game?", scrq_do_nothing, scrq_exit);
				break;
	            case 7:
					if (room == rm_Main) {
						if (global.state == 0) {
							scr_toggle_stats_selection(0);
							boss.menu_intro = FALSE;
							screen_transition(rm_Realms, scrt_main_to_menu, 30, 0, c_black);
							play_sfx(sfx_back, 0, 0);
						}
					} else {
						screen_transition(rm_Menu, -1, 30, choose(-1, 1, -2, 2), c_black);
						play_sfx(sfx_back, 0, 0);
					}
				break;
	            case 9:
					if (global.gpspeed_state == 0) {
						global.gpspeed_state = 1;
						wipe(obj_sound_bar);
						play_sfx(sfx_pause, 0, 0);
						audio_resume_all();
					}
				break;
	            case 10:
					ask("Do you want to restart?\nAny unsaved progress will be lost.", scrq_do_nothing, scrq_restart);
				break;
	            case 11:
					instance_create_layer_f(x, y, "Popups", obj_slot_name, 0);
					play_sfx(sfx_button3, 0, 0);
				break;
	            case 12:
					ask("Do you want to quit?\nAny unsaved progress will be lost.", scrq_do_nothing, scrq_pause_back);
				break;
	            case 13:
					image_blend = c_white;
					screen_transition(rm_About, -1, 30, choose(-1, 1, -2, 2), c_black);
					play_sfx(sfx_button4, 0, 0);
				break;
	            case 14:
					image_blend = c_white;
					url_open_ext("https://discord.gg/YqJYzMS", "_blank");
					play_sfx(sfx_button3, 0, 0);
				break;
	            case 15:
					instance_create_layer(lerp(CANVAS_X, CANVAS_XEND, 0.5), lerp(CANVAS_Y, CANVAS_YEND, 0.5), "Popups", obj_slot_load);
					play_sfx(sfx_button3, 0, 0);
				break;
	            case 16:
					image_blend = c_white;
					url_open_ext("https://www.waterflamemusic.com/", "_blank");
					play_sfx(sfx_button3, 0, 0);
				break;
	            case 17:
					if (image_blend != c_gray) {
						obj_slot_load.page = home(obj_slot_load.page, 0, 1, 0);
						with(obj_slot) { phase = 2; }
						obj_slot_load.spawncount = 0;
						obj_slot_load.alarm[1] = 1;
						play_sfx(sfx_button1, 0, 0);
					}
				break;
	            case 18:
					if (image_blend != c_gray) {
						obj_slot_load.page = home(obj_slot_load.page, ceil((array_length_1d(obj_slot_load.slot) - 1) / 6) - 1, 1, 0);
						with(obj_slot) { phase = 2; }
						obj_slot_load.spawncount = 7;
						obj_slot_load.alarm[0] = 1;
						play_sfx(sfx_button1, 0, 0);
					}
				break;
	            case 19:
					instance_create_layer_f(lerp(CANVAS_X, CANVAS_XEND, 0.5), lerp(CANVAS_Y, CANVAS_YEND, 0.5), "Popups", obj_slot_name, 1);
					play_sfx(sfx_button3, 0, 0);
				break;
	            case 20:
					ask("Delete slot\n\"" + obj_slot_load.selection_name + "\"?\nThis change will be permanent.", scrq_do_nothing, scrq_delete_slot);
				break;
	            case 21:
					image_index = 2 * show;
				break;
	            case 22:
					image_index = 2 * customize;
				break;
	            case 23:
					if (check == 1) {
						image_index = 2;
					} else {
						image_index = place_meeting(x, y, boss);
					}
				break;
	            case 27:
					image_blend = c_white;
					url_open_ext("https://www.gamejolt.com/@RandoragonGameDev", "_blank");
					play_sfx(sfx_button3, 0, 0);
				break;
            }
        }
    }
	
    #endregion
	
    #region Hotkeys
	
    if (image_alpha == 1) {
        switch(f) {
	        case 5:
	            // previous character
	            if (keyboard_check_pressed(global.keybind[1]) && global.state == 0 && room == rm_Main) {
	                play_sfx(sfx_button1, 0, 0);
	                global.chrsel = (global.chrsel == 0)? CHRCOUNT - 1 : global.chrsel - 1;
	                scr_PlayerDataUpdate(global.chrsel);
	                scr_PlayerGetData();
	                scr_ParticlesUpdate();
	                scr_LoreUpdate();
	                scr_Stats_Update(obj_statboard.button[0].show);
	            }
	            if (keyboard_check(global.keybind[1])) {image_index = 1;}
	        break;
	        case 6:
	            //next character
	            if (keyboard_check_pressed(global.keybind[3]) && global.state == 0 && room == rm_Main) {
	                play_sfx(sfx_button1, 0, 0);
	                global.chrsel = (global.chrsel == CHRCOUNT - 1)? 0 : global.chrsel + 1;
	                scr_PlayerDataUpdate(global.chrsel);
	                scr_PlayerGetData();
	                scr_ParticlesUpdate();
	                scr_LoreUpdate();
	                scr_Stats_Update(obj_statboard.button[0].show);
	            }
	            if (keyboard_check(global.keybind[3])) {image_index = 3;}
	        break;
	        case 7:
	            //back button
	            if (room != rm_Menu && global.state == 0 && keyboard_check_pressed(vk_escape) && !instance_exists(obj_transition)) {
	                if (room == rm_Main) {
	                    if (global.state == 0) {
	                        scr_toggle_stats_selection(0);
							boss.menu_intro = FALSE;
	                        screen_transition(rm_Realms, scrt_main_to_menu, 30, 0, c_black);
	                        play_sfx(sfx_back, 0, 0);
	                    }
	                } else {
	                    screen_transition(rm_Menu, -1, 30, choose(-1, 1, -2, 2), c_black);
	                    play_sfx(sfx_back, 0, 0);
	                }
	            }
	        break;
	        case 8:
	            //pause button
	            if (os_is_paused() && global.gpspeed != 0 && global.state == 1 && global.transition == 1) {
	                scr_Pause();
	            }
	            if (global.state == 1 && keyboard_check_pressed(vk_escape) && global.transition == 1) {
	                if (global.gpspeed_state != 0) {
	                    scr_Pause();
	                } else {
	                    play_sfx(sfx_pause, 0, 0);
	                    global.gpspeed_state = 1;
	                    wipe(obj_sound_bar)
	                    audio_resume_all();
	                }
	            }
	        break;
        }
        
        if (((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) || (place_meeting(mousepos(0, -1), mousepos(1, -1), obj_player) && mouse_check_button_pressed(mb_left))) && global.state == 0 && room == rm_Main) {
			scr_PlayerUpdateGroups();
			// the level starts in the async event when the character audio group finishes loading
        }
    }
	
	#endregion
}

