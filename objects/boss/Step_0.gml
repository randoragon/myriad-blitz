#region Gameplay

x = mousepos(0, 1);
y = mousepos(1, 1);
image_xscale = 1 - (2 * global.left_handed_mode);

if (room == rm_Main) {

    if (global.state == 1 && global.gpspeed != 0 && !global.loading) {
        if (instance_number(obj_enemy) < 5 + (global.points / 40000) + (5 * instance_exists(obj_emerald_ultimate)) && irandom(3600) < global.spawnrate && real_step()) {
			var rangemin = global.realm_enemy_index[global.realm];
			var rangemax = global.realm_enemy_index[global.realm + 1] - 1;
            instance_create(CANVAS_XEND + 96, CANVAS_Y + irandom_range(64, 656), irandom_range(rangemin, rangemax));
        }
        global.spawnrate += 0.0165 * global.gpspeed;
        if (global.points - lastpresent >= 8000) {
            instance_create(CANVAS_XEND + 64, CANVAS_Y + irandom_range(64, 656), obj_present);
            lastpresent += 8000;
        }
    }
    
    if (global.state == 1 && global.transition != 1) {
        global.transition = home(global.transition, 1, 1/20, 0);
    } else if (global.state == 0 && global.transition != 0) {
        global.transition = home(global.transition, 0, 1/20, 0);
    }
    
    if (instance_exists(obj_player) && global.gpspeed != 0) {
        dizzy_alpha = home(dizzy_alpha, obj_player.status_effect[4] * 0.5, 0.0025, 0);
    }
}

#endregion

#region Hotkeys
if (keyboard_check_pressed(vk_space) && global.state == 2) {
    play_sfx(sfx_button4, 0, 0);
    screen_transition(-1, scrt_back, 20, choose(-1, 1, -2, 2), c_black);
}
if (keyboard_check_pressed(vk_f11)) {
    global.fullscreen = toggle(global.fullscreen);
    if(room == rm_Settings) {
        with(obj_settings_checkbox) {
            if (label == "FULLSCREEN") {
                check = global.fullscreen;
            }
        }
    }
    window_set_fullscreen(global.fullscreen);
}

#endregion

#region Audio Management

/* The updates should be allowed only to occur while there's an opportunity for the player to change the music sliders. Otherwise things like audio_sound_gain would automatically
 * render useless as this step action would constantly reupdate the sound gain in its own way.
 */
if (room == rm_Settings || (room == rm_Main && global.gpspeed == 0 && global.state == 1 && !global.loading)) {
    // MUSIC
    for (var i = array_length_1d(global.music) - 1; i > -1; i--) {
    if (audio_is_playing(global.music[i]))
		audio_sound_gain(global.music[i], global.muspercentage / 100, 0);
    }
    
    // SFX
    for(var i = array_length_1d(global.sfx) - 1; i > -1; i--) {
    if (audio_is_playing(global.sfx[i]))
		audio_sound_gain(global.sfx[i], global.sfxpercentage / 100, 0);
    }
}

if (room != rm_Main) {
    if (audio_group_is_loaded(audiogroup_menu) && menu_intro && !audio_is_playing(mus_menu_intro)) {
        play_music(mus_menu_loop, sound_priority.music, 1);
        menu_intro = FALSE;
    }
    if (os_is_paused() && !os_pause) {
        os_pause = TRUE;
        audio_pause_all();
    } else if (!os_is_paused() && os_pause) {
        os_pause = FALSE;
        audio_resume_all();
    }
}

#endregion

#region GUI && aspect ratio Fix

var ratio = 16/9;
if (abs(window_get_width() - window_last_width) > 1 && abs(window_get_height() - window_last_height) < 1)
	window_set_size(window_get_width(), round(window_get_width() / ratio));
else if (abs(window_get_height() - window_last_height) > 1 || abs(window_get_width() - window_last_width) > 1)
	window_set_size(round(window_get_height() * ratio), window_get_height());
window_last_width  = window_get_width();
window_last_height = window_get_height();

#endregion

#region Manage Particle Drawers && Update Particle Systems

if (!global.loading) {
	if (part_system_count_pro(PART_SYSTEM_DAMAGE_INDICATORS) > 0) {
		if (!instance_exists(obj_damage_indicators)) { instance_create_layer(0, 0, "Indicators", obj_damage_indicators); }
	} else if (instance_exists(obj_damage_indicators)) { wipe(obj_damage_indicators); }

	if (room==rm_Main) {
		if (!instance_exists(obj_player_tparticles) ) { instance_create_layer(0, 0, "PlayerTopParticles",	  obj_player_tparticles);  }
		if (!instance_exists(obj_player_bparticles) ) { instance_create_layer(0, 0, "PlayerBotParticles",	  obj_player_bparticles);  }
		if (!instance_exists(obj_charge_particles)  ) { instance_create_layer(0, 0, "ChargeParticles",		  obj_charge_particles);   }
		if (!instance_exists(obj_ultimate_particles)) { instance_create_layer(0, 0, "UltimateBurstParticles", obj_ultimate_particles); }
		if (!instance_exists(obj_enemy_particles)   ) { instance_create_layer(0, 0, "EnemyParticles",		  obj_enemy_particles);    }
		if (!instance_exists(obj_frag_particles)    ) { instance_create_layer(0, 0, "FragParticles",		  obj_frag_particles);     }
	} else {
		if (instance_exists(obj_player_tparticles)  ) { wipe(obj_player_tparticles);  }
		if (instance_exists(obj_player_bparticles)  ) { wipe(obj_player_bparticles);  }
		if (instance_exists(obj_charge_particles)   ) { wipe(obj_charge_particles);   }
		if (instance_exists(obj_ultimate_particles) ) { wipe(obj_ultimate_particles); }
		if (instance_exists(obj_enemy_particles)    ) { wipe(obj_enemy_particles);    }
		if (instance_exists(obj_frag_particles)     ) { wipe(obj_frag_particles);     }
	}
}

#endregion

#region Debugging

if (keyboard_check_pressed(ord("G"))) { instance_create(CANVAS_XEND, CANVAS_YMID, obj_enemy_christmas_gingerbread_man); }
if (keyboard_check_pressed(ord("R"))) { instance_create(CANVAS_XEND, CANVAS_YMID, obj_enemy_christmas_rocket_elf); }

#endregion