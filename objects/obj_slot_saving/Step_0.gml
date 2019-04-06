/// @description Save to slot

#region Phase 1 - Fetch data

if (phase == 1) {
    if (clock-- <= 0) {
        switch(progress) {
	        case 0: //prepare the file info
	            fname    = string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(slot_name, "?", "_"), "/", "_"), "|", "_"), "\\", "_"), "*", "_"), ":", "_"), "<", "_"), ">", "_"), "\"", "_");
	            fullname = working_directory + "slots\\" + fname + ".mbslot";
	            var retry=1;
	            while (file_exists(fullname)) {
	            retry++;
	            fullname = working_directory + "slots\\" + fname + string(retry) + ".mbslot";
	            }
            
	            line[0] = slot_name;
	            var date = date_current_datetime();
	            line[1] = string_replace(string_format(date_get_month(date), 2, 0), " ", "0") + "/" + string_replace(string_format(date_get_day(date), 2, 0), " ", "0") + "/" + string(date_get_year(date)) + " " + string_replace(string_format(date_get_hour(date), 2, 0), " ", "0") + ":" + string_replace(string_format(date_get_minute(date), 2, 0), " ", "0");
	            save_key = line[1];
	            initial_seed = random_get_seed();
	            progress = 1;
	        break;
	        case 1: //global variables, sounds, global player stats, player status effects
	            data = 
	            string(VER) + ";" + string(global.chrsel) + ";" + string(global.points) + ";" + string(global.realm) + ";" + 
	            string(boss.lastpresent) + ";" + string(global.spawnrate) + ";" + string(global.gpspeed) + ";" + string(global.prev_gpspeed) + ";" + string(global.gpspeed_state) + ";" + string(global.gpspeed_focus) + ";" + string(global.gpspeed_ultimate_activation) + ";" + string(global.gpspeed_ultimate) + ";" + string(global.gpstep) + ";" + 
	            string(global.viewxstartpos) + ";" + string(global.viewystartpos) + ";" + string(random_get_seed()) + ";" + string(global.shader_conditions) + ";" + string(global.enemy_details_selection) + ";" + string(boss.last_ult) + ";" + string(global.kill_count) + ";" + 
	            string(boss.dizzy_alpha) + ";";
	            for (var i = 0; i < 8; i++) {
					data += string(global.background_sprite[i]) + ";" + string(global.background_sprite_index[i]) + ";" + string(global.background_image_speed[i]) + ";" + string(global.background_x[i]) + ";" + string(global.background_y[i]) + ";" + string(global.background_htiled[i]) + ";" + string(global.background_vtiled[i]) + ";" + string(global.background_hspeed[i]) + ";" + string(global.background_vspeed[i]) + ";";
	            }
	            line[2] = data + separator;
            
	            var sound_index;
	            data = string(array_length_1d(global.music)) + ";";
	            for (var i = 0; i < array_length_1d(global.music); i++) {
	                sound_index = asset_get_index(audio_get_name(global.music[i]));
	                data += string(sound_index) + ";" + string(audio_sound_get_pitch(global.music[i])) + ";" + string(audio_sound_get_track_position(global.music[i])) + ";";
	            }
	            data += string(array_length_1d(global.sfx)) + ";";
	            for (var i = 0; i < array_length_1d(global.sfx); i++) {
	                sound_index = asset_get_index(audio_get_name(global.sfx[i]));
	                data += string(sound_index) + ";" + string(audio_sound_get_pitch(global.sfx[i])) + ";" + string(audio_sound_get_track_position(global.sfx[i])) + ";";
	            }
	            line[3] = data + separator;
            
	            data = string(global.hp) + ";" + string(global.bdmg) + ";" + string(global.bdef) + ";" + string(global.bpen) + ";" + string(global.bkb) + ";" + string(global.bkbres) + ";" + string(global.acc) + ";" + 
	            string(global.counteracc) + ";" + string(global.spd) + ";" + string(global.invtime) + ";" + string(global.foctime) + ";" + string(global.pdmg) + ";" + string(global.pdef) + ";" + string(global.ppen) + ";" + 
	            string(global.pkb) + ";" + string(global.pkbres) + ";" + string(global.pspd) + ";" + string(global.sacc) + ";" + string(global.sspd) + ";" + string(global.fmin) + ";" + string(global.fmax) + ";" + string(global.fdmg) + ";" + 
	            string(global.fpen) + ";" + string(global.fkb) + ";" + string(global.cdmg) + ";" + string(global.cpen) + ";" + string(global.ckb) + ";" + string(global.ctime) + ";" + string(global.ccooldown) + ";" + string(global.ucooldown) + ";";
	            line[4] = data + separator;
	            line[5] = ds_grid_export(global.player_status_effects) + separator;
	            progress = 2;
	        break;
	        case 2: //particle systems
	            if (global.save_particles && ds_exists(PART_SYSTEM_PLAYERBOT, ds_type_grid)) {
	                data = ds_grid_export(PART_SYSTEM_PLAYERBOT);
	            } else {
	                data = "";
	            }
	            line[6] = data + separator;
	            progress = 3;
	        break;
	        case 3:
	            if (global.save_particles && ds_exists(PART_SYSTEM_DAMAGE_INDICATORS, ds_type_grid)) {
	                data = ds_grid_export(PART_SYSTEM_DAMAGE_INDICATORS);
	            } else {
	                data = "";
	            }
	            line[7] = data + separator;
	            progress = 4;
	        break;
	        case 4:
	            if (global.save_particles && ds_exists(PART_SYSTEM_FRAG, ds_type_grid)) {
	                data = ds_grid_export(PART_SYSTEM_FRAG);
	            } else {
	                data = "";
	            }
	            line[8] = data + separator;
	            progress = 5;
	        break;
	        case 5:
	            if (global.save_particles && ds_exists(PART_SYSTEM_CHARGE, ds_type_grid)) {
	                data = ds_grid_export(PART_SYSTEM_CHARGE);
	            } else {
	                data = "";
	            }
	            line[9] = data + separator;
	            progress = 6;
	        break;
	        case 6:
	            if (global.save_particles && ds_exists(PART_SYSTEM_ENEMY, ds_type_grid)) {
	                data = ds_grid_export(PART_SYSTEM_ENEMY);
	            } else {
	                data = "";
	            }
	            line[10] = data + separator;
	            progress = 7;
	        break;
	        case 7:
	            if (global.save_particles && ds_exists(PART_SYSTEM_PLAYERTOP, ds_type_grid)) {
	                data = ds_grid_export(PART_SYSTEM_PLAYERTOP);
	            } else {
	                data = "";
	            }
	            line[11] = data + separator;
	            progress = 8;
	        break;
	        case 8:
	            if (global.save_particles && ds_exists(PART_SYSTEM_ULTIMATE, ds_type_grid)) {
	                data = ds_grid_export(PART_SYSTEM_ULTIMATE);
	            } else {
	                data = "";
	            }
	            line[12] = data + separator;
	            progress = 9;
	        break;
	        case 9: //particle types, spawn slots, type pointers
	            if (ds_exists(global.part_type_pro_grid[0], ds_type_grid)) {
	                data = ds_grid_export(global.part_type_pro_grid[0]);
	            } else {
	                data = "";
	            }
	            line[13] = data + separator;
	            progress = 10;
	        break;
	        case 10:
	            if (global.save_particles && ds_exists(global.part_type_pro_grid[1], ds_type_list)) {
	                data = ds_list_write(global.part_type_pro_grid[1]);
	            } else {
	                data = "";
	            }
	            line[14] = data + separator;
	            progress = 11;
	        break;
	        case 11:
	            if (ds_exists(global.part_type_lt_grid[0], ds_type_grid)) {
	                data = ds_grid_export(global.part_type_lt_grid[0]);
	            } else {
	                data = "";
	            }
	            line[15] = data + separator;
	            progress = 12;
	        break;
	        case 12:
	            if (global.save_particles && ds_exists(global.part_type_lt_grid[1], ds_type_list)) {
	                data = ds_list_write(global.part_type_lt_grid[1]);
	            } else {
	                data = "";
	            }
	            line[16] = data + separator;
	            progress = 13;
	        break;
	        case 13:
	            if (ds_exists(global.part_type_ult_grid[0], ds_type_grid)) {
	                data = ds_grid_export(global.part_type_ult_grid[0]);
	            } else {
	                data = "";
	            }
	            line[17] = data + separator;
	            progress = 14;
	        break;
	        case 14:
	            if (global.save_particles && ds_exists(global.part_type_ult_grid[1], ds_type_list)) {
	                data = ds_list_write(global.part_type_ult_grid[1]); 
	            } else {
	                data = "";
	            }
	            line[18] = data + separator;
	            progress = 15;
	        break;
	        case 15:
	            data = string(global.player_part[0]) + ";"; //disperse particles are always present so there's no need to check
	            switch(global.chrsel) {
		            case 0:
		                data += string(global.player_part[1]) + ";" + string(global.player_part[2]) + ";" + 
		                string(global.frag_part[0]) + ";" + string(global.frag_part[1]) + ";" + string(global.frag_part[2]) + ";" + 
		                string(global.charge_part[0]) + ";" + string(global.charge_part[1]) + ";" + 
		                string(global.ultimate_part[0]) + ";";
		            break;
		            case 1:
		                data += string(global.frag_part[0]) + ";";
		            break;
	            }
	            line[19] = data + separator;
	            progress = 16;
	        break;
	        case 16: //instances and inst_count
	            if (instance_exists(inst_id[inst_index])) {
	                with (inst_id[inst_index]) {
	                    //basic instance variables
						if (is_undefined(ds_map_find_value(global.save_index, object_get_name(object_index)))) { show_message("GOTCHA BITCH! - " + string(id) + " " + string(object_get_name(object_index))); }
	                    other.data = 
	                    string(global.save_index[? object_get_name(object_index)]) + ";" + 
	                    string(id) + ";" + 
	                    string(sprite_index) + ";" + 
	                    string(image_index) + ";" + 
	                    string(image_speed) + ";" + 
	                    string(prev_image_speed) + ";" + 
	                    string(alarm[0]) + ";" + string(alarm[1]) + ";" + string(alarm[2]) + ";" + string(alarm[3]) + ";" + string(alarm[4]) + ";" + string(alarm[5]) + ";" + string(alarm[6]) + ";" + string(alarm[7]) + ";" + string(alarm[8]) + ";" + string(alarm[9]) + ";" + string(alarm[10]) + ";" + string(alarm[11]) + ";" + 
	                    string(depth) + ";" + 
	                    string(image_alpha) + ";" + 
	                    string(image_angle) + ";" + 
	                    string(image_blend) + ";" + 
	                    string(image_xscale) + ";" + string(image_yscale) + ";" + 
	                    string(mask_index) + ";" + 
	                    string(direction) + ";" + 
	                    string(x) + ";" + string(y) + ";" + 
	                    string(xprevious) + ";" + string(yprevious) + ";" + 
	                    string(xstart) + ";" + string(ystart) + ";"
                    
	                    if (object_is_ancestor(object_index, obj_knockback_physics)) {
	                        other.data += 
	                        string(hkb) + ";" + string(vkb) + ";" + 
	                        string(ahkb) + ";" + string(avkb) + ";";
	                    }
	                    if (object_is_ancestor(object_index, obj_speeds_physics)) {
	                        other.data += 
	                        string(hspeed1) + ";" + string(vspeed1) + ";" + string(speed1) + ";";
	                    }
	                    //object specific variables
	                    switch(object_index) {
		                    case obj_player:
		                        other.data += 
		                        string(hp) + ";" + string(hpmax) + ";" + 
		                        string(bdmg) + ";" + string(bdef) + ";" + string(bpen) + ";" + string(bkb) + ";" + string(bkbres) + ";" + 
		                        string(acc) + ";" + string(counteracc) + ";" + string(spd) + ";" + string(invtime) + ";" + string(foctime) + ";" + string(focus) + ";" + 
		                        string(pdmg) + ";" + string(pdef) + ";" + string(ppen) + ";" + string(pkb) + ";" + string(pkbres) + ";" + 
		                        string(pspd) + ";" + string(sacc) + ";" + string(sspd) + ";" + 
		                        string(fmin) + ";" + string(fmax) + ";" + string(fdmg) + ";" + string(fpen) + ";" + string(fkb) + ";" + 
		                        string(cdmg) + ";" + string(cpen) + ";" + string(ckb) + ";" + 
		                        string(ctime) + ";" + string(ccooldown) + ";" + 
		                        string(ucooldown) + ";" + 
		                        string(xv) + ";" + string(yv) + ";" + 
		                        string(shot) + ";" + 
		                        string(inv) + ";" + 
		                        string(charge) + ";" + string(discharge) + ";" + string(artcharge) + ";" + string(cb) + ";" + 
		                        string(spawn) + ";" + 
		                        string(hpmark) + ";" + string(hpmark_v) + ";" + 
		                        string(helper) + ";" + 
		                        string(focus) + ";" + string(foctime) + ";" + string(focus_state) + ";" + 
		                        string(evilflame_sprite_swap) + ";" + string(evilflame_twilight_fury) + ";" + 
		                        string(status_effect[0]) + ";" + string(status_effect[1]) + ";" + string(status_effect[2]) + ";" + 
		                        string(status_effect[3]) + ";" + string(status_effect[4]) + ";" + string(status_effect[5]) + ";" + 
		                        string(status_effect[6]) + ";" + string(status_effect[7]) + ";" + string(status_effect[8]) + ";" + 
		                        string(status_effect[9]) + ";" + string(status_effect[10]) + ";";
		                    break;
		                    case obj_projectile:
		                        other.data += 
		                        string(spawn) + ";" + 
		                        string(f) + ";" + string(e) + ";" + 
		                        string(pdmg) + ";" + string(ppen) + ";" + string(pkb) + ";" + string(pspd) + ";" + string(sacc) + ";" + string(sspd) + ";" + 
		                         + string(fmin) + ";" + string(fmax) + ";" + string(rot) + ";" + string(lifespan) + ";";
		                    break;
		                    case obj_frag:
		                        other.data += 
		                        string(spawn) + ";" + 
		                        string(f) + ";" + string(e) + ";" + 
		                        string(enemy) + ";" + string(enemyharm) + ";" + 
		                        string(vacc) + ";" + string(hacc) + ";" + 
		                        string(fmin) + ";" + string(fmax) + ";" + string(fdmg) + ";" + string(fpen) + ";" + string(fkb) + ";" + 
		                        string(lifespan) + ";";
		                    break;
		                    case obj_charge:
		                        other.data += 
		                        string(spawn) + ";" + string(f) + ";" + string(e) + ";" + string(charge) + ";" + string(rot) + ";" + 
		                        string(cdmg) + ";" + string(cpen) + ";" + string(ckb) + ";" + string(target) + ";";
		                    break;
		                    case obj_enemy:
		                        other.data += 
		                        string(cooldown) + ";" + string(time_mark) + ";" + string(f) + ";" + 
		                        string(beh) + ";" + string(intro) + ";" + string(touchable) + ";" + 
		                        string(hp) + ";" + string(hpmax) + ";" + 
		                        string(bdmg) + ";" + string(bdef) + ";" + string(bpen) + ";" + string(bkb) + ";" + string(bkbres) + ";" + 
		                        string(pdmg) + ";" + string(pdef) + ";" + string(ppen) + ";" + string(pkb) + ";" + string(pkbres) + ";" + 
		                        string(fdef) + ";" + string(cdef) + ";" + string(udef) + ";" + 
		                        string(fkbres) + ";" + string(ckbres) + ";" + string(ukbres) + ";" + 
		                        string(bar_extension) + ";";
		                    break;
		                    case obj_eprojectile:
		                        other.data += 
		                        string(spawn) + ";" + string(f) + ";" + string(acc) + ";" + string(rot) + ";" + string(pdmg) + ";" + string(ppen) + ";" + string(pkb) + ";" + 
		                        string(lifespan) + ";";
		                    break;
		                    case obj_oscillator:
		                        other.data += 
		                        string(waveform[0, 0]) + ";" + string(waveform[1, 0]) + ";" + string(waveform[2, 0]) + ";" + string(waveform[3, 0]) + ";" + 
		                        string(waveform[0, 1]) + ";" + string(waveform[1, 1]) + ";" + string(waveform[2, 1]) + ";" + string(waveform[3, 1]) + ";" + 
		                        string(radius[0]) + ";" + string(radius[1]) + ";" + 
		                        string(acceleration[0]) + ";" + string(acceleration[1]) + ";" + 
		                        string(time[0]) + ";" + string(time[1]) + ";" + 
		                        string(cycle[0]) + ";" + string(cycle[1]) + ";" + 
		                        string(output[0]) + ";" + string(output[1]) + ";" + 
		                        string(cyclecount[0]) + ";" + string(cyclecount[1]) + ";" + 
		                        string(duration[0]) + ";" + string(duration[1]) + ";";
		                    break;
		                    case obj_screenshake:
		                        other.data += 
		                        string(h_value) + ";" + string(h_value0) + ";" + string(v_value) + ";" + string(v_value0) + ";" + string(rate) + ";" + string(time) + ";" + string(time_clock) + ";" + string(decrease) + ";";
		                    break;
		                    case obj_present:
		                        other.data += 
		                        string(f) + ";" + string(wave_cycle) + ";" + string(number) + ";" + string(picked) + ";";
		                    break;
		                    case obj_ultimate_activation:
		                        other.data += 
		                        string(size) + ";" + string(stage) + ";" + string(progress) + ";";
		                    break;
		                    case obj_evilflame_ultimate:
		                        other.data += 
		                        string(player) + ";" + string(hp) + ";" + string(hpmax) + ";" + string(hpmark) + ";" + string(hpmark_v) + ";" + 
		                        string(inv) + ";" + string(invtime) + ";" + string(cb) + ";" + string(charge) + ";" + string(ctime) + ";" + 
		                        string(discharge) + ";" + string(ccooldown) + ";" + string(artcharge) + ";" + string(color) + ";" + 
		                        string(shot) + ";" + string(bar_opacity[0]) + ";" + string(bar_opacity[1]) + ";" + string(bar_opacity[2]) + ";" + 
		                        string(bar_yoffset[0]) + ";" + string(bar_yoffset[1]) + ";" + string(bar_yoffset[2]) + ";";
		                    break;
		                    case obj_emerald_ultimate:
		                        other.data += 
		                        string(scale_v) + ";" + string(scale_stage) + ";" + string(rot) + ";" + string(rot_cycle) + ";" + 
		                        string(spawn_clock) + ";" + string(lifespan) + ";";
		                    break;
		                        case obj_emerald_ultimate_flow:
		                        other.data += 
		                        string(scale_v) + ";" + string(scale_stage) + ";" + string(rot) + ";" + string(size_growth) + ";" + string(clock) + ";";
		                    break;
		                    case obj_emerald_ultimate_force:
		                        other.data += 
		                        string(clock) + ";";
		                    break;
		                    case obj_debris:
		                        other.data += 
		                        string(split_sprite) + ";" + string(split_sprite_index) + ";" + string(split_sprite_xscale) + ";" + 
		                        string(split_sprite_yscale) + ";" + string(split_sprite_color) + ";" + string(split_sprite_alpha) + ";" + 
		                        string(split_angle) + ";" + string(split_part) + ";" + 
		                        string(custom_sprite) + ";";
		                    break;
	                    }
	                    other.line[array_length_1d(other.line)] = other.data + other.separator;
                    
	                    //write eventual ds data
	                    switch(object_index) {
		                    case obj_player:case obj_wrap_helper:case obj_projectile:case obj_frag:case obj_charge:
		                    case obj_eprojectile:case obj_present:case obj_explosion:case obj_debris:
		                        if (ds_exists(afterimage_ds_grid, ds_type_grid)) {
		                            other.data = ds_grid_export(afterimage_ds_grid);
		                        } else {
		                            other.data = "";
		                        }
		                        other.line[array_length_1d(other.line)] = other.data + other.separator;
		                    break;
		                    case obj_enemy:
		                        if (ds_exists(afterimage_ds_grid, ds_type_grid)) {
		                            other.data = ds_grid_export(afterimage_ds_grid);
		                        } else {
		                            other.data = "";
		                        }
		                        other.line[array_length_1d(other.line)] = other.data + other.separator;
		                        other.data = ds_map_write(loot);
		                        other.line[array_length_1d(other.line)] = other.data + other.separator;
		                    break;
	                    }
	                }
	            }
	            inst_index += 1;
	            if (inst_index == array_length_1d(inst_id)) {
	                progress = 17;
	            }
	        break;
        }
        clock = interval;
        if (progress >= progress_max) {
            phase = 2;
            interval = 0;
            clock = interval;
            data = "";
            progress = 2;
            //first two lines are calculated differently
            var length = 0;
            for (var i = 2; i < array_length_1d(line); i++) {
                length += string_length(line[i]);
            }
            length = ceil(length / chunk_length) + 2;
            
            progress_max = length;
            chunk[0] = line[0]; line[0] = "";
            chunk[1] = line[1]; line[1] = "";
            inst_index = 2;
        }
    }
}

#endregion

#region Phase 2 - Parsing Data

if (phase == 2 && clock-- <= 0) {
	data = "";

	var prev_length, difference;
	while (string_length(data) < chunk_length && inst_index < array_length_1d(line)) {
	    prev_length = string_length(data);
	    data += string_copy(line[inst_index], 1, min(chunk_length - prev_length, string_length(line[inst_index])));
	    difference = string_length(data) - prev_length;
    
	    if (difference == string_length(line[inst_index])) {
			line[inst_index++] = "";
		} else {
			line[inst_index] = string_delete(line[inst_index], 1, difference);
		}
	}
	chunk[progress] = data;

	progress += 1;
	clock = interval;
	if (progress >= progress_max) {
	phase = 3;
	interval = 1 - (global.save_chunk_size > 500);
	clock = interval;
	data = "";
	progress = 2;
	}
}

#endregion

#region Phase 3 - Data Encryption

if (phase == 3 && clock-- <= 0) {
	chunk[progress] = flip_encode(chunk[progress], save_key);

	progress += 1;
	clock = interval;
	if (progress >= progress_max) {
		interval = 0;
		clock = interval;
		phase = 4;
		data = "";
		progress = 0;
		file = file_text_open_write(fullname);
		file_text_write_string(file, SLOT_DISCLAIMER);
		file_text_writeln(file);
	}
}

#endregion

#region Phase 4 - Text File Write

if (phase == 4) {
	if (clock-- <= 0) {
		file_text_write_string(file, chunk[progress]);
		file_text_writeln(file);

		progress += 1;
		clock = interval;
		if (progress >= progress_max) {
			phase = 5;
			data = "";
			progress = 0;
			file_text_close(file);
			randomize();
			random_set_seed(initial_seed);
			global.loading = FALSE;
		}
	}
}

#endregion