/// @description scr_obj_loading_applying_data_legacy()
function scr_obj_loading_applying_data_legacy() {

	// The legacy method of loading slot files, with old particle system and backgrounds.
	// Works only for 1.1.0 and 1.1.1 slots

	var bit; bit[0] = line[progress];
    
	switch(progress) {
		case 0:
		    //global variables
		    slotversion						   = string_readln(bit, ";");
		    global.chrsel					   = string_readln_real(bit, ";");
		    global.points					   = string_readln_real(bit, ";");
		    global.realm					   = string_readln_real(bit, ";");
			scr_PlayerUpdateGroups();
			scr_RealmUpdateAudioGroup();
			audio_group_load(audiogroup_default_gameplay);
		    boss.lastpresent				   = string_readln_real(bit, ";");
		    global.spawnrate				   = string_readln_real(bit, ";");
		    global.gpspeed					   = string_readln_real(bit, ";");
		    global.prev_gpspeed				   = string_readln_real(bit, ";");
		    global.gpspeed_state			   = string_readln_real(bit, ";");
		    global.gpspeed_focus               = string_readln_real(bit, ";");
		    global.gpspeed_ultimate_activation = string_readln_real(bit, ";");
		    global.gpspeed_ultimate			   = string_readln_real(bit, ";");
		    global.gpstep					   = string_readln_real(bit, ";");
		    global.viewxstartpos			   = string_readln_real(bit, ";");
		    global.viewystartpos			   = string_readln_real(bit, ";");
		    new_seed						   = string_readln_real(bit, ";");
		    global.shader_conditions		   = string_readln_real(bit, ";");
		    global.enemy_details_selection	   = string_readln_real(bit, ";");
		    boss.last_ult					   = string_readln_real(bit, ";");
		    global.kill_count				   = string_readln_real(bit, ";");
		    boss.dizzy_alpha				   = string_readln_real(bit, ";");
			// old 1.1.0 and 1.1.1 way of storing backgrounds
			for (var i = 0; i < 8; i++) {
				var bgspr = string_readln_real(bit, ";");
				global.background_sprite[i]		  = (bgspr != -1 ? bgspr - VER1_1_1_BG_CHRISTMAS0 + bg_Christmas0 : noone);
				global.background_image_index[i] = 0;
				global.background_image_speed[i]  = 0;
				global.background_x[i]			  = CANVAS_X;
				global.background_y[i]			  = CANVAS_Y;
				global.background_htiled[i]		  = string_readln_real(bit, ";");
				global.background_vtiled[i]		  = string_readln_real(bit, ";");
				global.background_hspeed[i]		  = string_readln_real(bit, ";");
				global.background_vspeed[i]		  = string_readln_real(bit, ";");
			}
		    global.enemy_details_selection	   = string_readln_real(bit, ";");
		break;
		case 1:
			if (audio_group_is_loaded(global.realm_audiogroup[global.realm]) && audio_group_is_loaded(global.character_audiogroup[global.chrsel]) && audio_group_is_loaded(audiogroup_default_gameplay)) {
				var snd_count = string_readln_real(bit, ";");
			    var sndid, snd;
			    repeat(snd_count) {
			        sndid = string_readln_real(bit, ";");
			        if (!audio_exists(sndid)) { string_readln(bit, ";"); string_readln(bit, ";"); continue; } 
			        snd = play_music(sndid, 1, string_readln_real(bit, ";") * 100);
			        audio_sound_set_track_position(snd, string_readln_real(bit, ";"));
			        audio_sound_gain(snd, 0, 0);
			    }
			    snd_count = string_readln_real(bit, ";");
			    repeat(snd_count) {
			        sndid = string_readln_real(bit, ";");
			        if (!audio_exists(sndid)) { string_readln(bit, ";"); string_readln(bit, ";"); continue; } 
			        snd = play_sfx(sndid, 0, string_readln_real(bit, ";") * 100);
			        audio_sound_set_track_position(snd, string_readln_real(bit, ";"));
			        audio_sound_gain(snd, 0, 0);
				}
			}
	        
		break;
		case 2:
		    audio_pause_all();
		    //global player stats
		    global.hp		  = string_readln_real(bit, ";");
		    global.bdmg		  = string_readln_real(bit, ";");
		    global.bdef		  = string_readln_real(bit, ";");
		    global.bpen		  = string_readln_real(bit, ";");
		    global.bkb		  = string_readln_real(bit, ";");
		    global.bkbres	  = string_readln_real(bit, ";");
		    global.acc		  = string_readln_real(bit, ";");
		    global.counteracc = string_readln_real(bit, ";");
		    global.spd		  = string_readln_real(bit, ";");
		    global.invtime	  = string_readln_real(bit, ";");
		    global.foctime	  = string_readln_real(bit, ";");
		    global.pdmg		  = string_readln_real(bit, ";");
		    global.pdef		  = string_readln_real(bit, ";");
		    global.ppen		  = string_readln_real(bit, ";");
		    global.pkb		  = string_readln_real(bit, ";");
		    global.pkbres	  = string_readln_real(bit, ";");
		    global.pspd		  = string_readln_real(bit, ";");
		    global.sacc		  = string_readln_real(bit, ";");
		    global.sspd		  = string_readln_real(bit, ";");
		    global.fmin		  = string_readln_real(bit, ";");
		    global.fmax		  = string_readln_real(bit, ";");
		    global.fdmg		  = string_readln_real(bit, ";");
		    global.fpen		  = string_readln_real(bit, ";");
		    global.fkb		  = string_readln_real(bit, ";");
		    global.cdmg		  = string_readln_real(bit, ";");
		    global.cpen		  = string_readln_real(bit, ";");
		    global.ckb		  = string_readln_real(bit, ";");
		    global.ctime	  = string_readln_real(bit, ";");
		    global.ccooldown  = string_readln_real(bit, ";");
		    global.ucooldown  = string_readln_real(bit, ";");
		break;
		case 3: //global.player_status_effects grid
		    global.player_status_effects = ds_grid_create(0, 0);
		    global.player_status_effects = ds_grid_import(global.player_status_effects, line[progress]);
		break;
		case 4: //part systems, types and spawn slots
		    if (ds_exists(PART_SYSTEM_PLAYERBOT_LT		   , ds_type_grid)) { part_system_clear_lt (PART_SYSTEM_PLAYERBOT_LT);			}
		    if (ds_exists(PART_SYSTEM_DAMAGE_INDICATORS_PRO, ds_type_grid)) { part_system_clear_pro(PART_SYSTEM_DAMAGE_INDICATORS_PRO); }
		    if (ds_exists(PART_SYSTEM_FRAG_ULT			   , ds_type_grid)) { part_system_clear_ult(PART_SYSTEM_FRAG_ULT);				}
		    if (ds_exists(PART_SYSTEM_CHARGE_ULT		   , ds_type_grid)) { part_system_clear_ult(PART_SYSTEM_CHARGE_ULT);			}
		    if (ds_exists(PART_SYSTEM_ENEMY_LT			   , ds_type_grid)) { part_system_clear_lt (PART_SYSTEM_ENEMY_LT);				}
		    if (ds_exists(PART_SYSTEM_PLAYERTOP_LT		   , ds_type_grid)) { part_system_clear_lt (PART_SYSTEM_PLAYERTOP_LT);			}
		    if (ds_exists(PART_SYSTEM_ULTIMATE_LT		   , ds_type_grid)) { part_system_clear_lt (PART_SYSTEM_ULTIMATE_LT);			}
		    if (ds_exists(global.part_type_pro_slots, ds_type_list)) { ds_list_destroy(global.part_type_pro_slots); }
		    if (ds_exists(global.part_type_lt_slots , ds_type_list)) { ds_list_destroy(global.part_type_lt_slots);  }
		    if (ds_exists(global.part_type_ult_slots, ds_type_list)) { ds_list_destroy(global.part_type_ult_slots); }
        
		    if (bit[0] != "") {
		        ds_grid_import(PART_SYSTEM_PLAYERBOT_LT, bit[0]);
		    }
		break;
		case 5:
		    if (bit[0] != "") {
		        ds_grid_import(PART_SYSTEM_DAMAGE_INDICATORS_PRO, bit[0]);
		    }
		break;
		case 6:
		    if (bit[0] != "") {
		        ds_grid_import(PART_SYSTEM_FRAG_ULT, bit[0]);
		    }
		break;
		case 7:
		    if (bit[0] != "") {
		        ds_grid_import(PART_SYSTEM_CHARGE_ULT, bit[0]);
		    }
		break;
		case 8:
		    if (bit[0] != "") {
		        ds_grid_import(PART_SYSTEM_ENEMY_LT, bit[0]);
		    }
		break;
		case 9:
		    if (bit[0] != "") {
		        ds_grid_import(PART_SYSTEM_PLAYERTOP_LT, bit[0]);
		    }
		break;
		case 10:
		    if (bit[0] != "") {
		        ds_grid_import(PART_SYSTEM_ULTIMATE_LT, bit[0]);
		    }
		break;
		case 11:
			// global.part_type_pro_props
		    if (bit[0] != "") {
				var ptgrid = ds_grid_import(-1, bit[0]);
				
				// Figure out which present particle types the past save is referring to
				var mapping = ds_map_create();
				for (var i = 0; i < ds_grid_width(ptgrid); i++) {
					// convert sprite to current global mapping
					ptgrid[# i, 0] = (ptgrid[# i, 0] == -1)? -1 : asset_get_index(global.save_sname[? ptgrid[# i, 0]]);
					
					// possibilities as of 1.1.1:
					// - indicators 1
					// - indicators 2
					// - indicators 3
					// method of identification: life_max
					switch (ptgrid[# i, 4]) {
						case 20: mapping[? i] = PART_TYPE_INDICATORS_1_PRO; break;
						case 40: mapping[? i] = PART_TYPE_INDICATORS_2_PRO; break;
						case 80: mapping[? i] = PART_TYPE_INDICATORS_3_PRO; break;
					}
				}
				
				// Remap all particle IDs from arbitrary indices to global values implemented after 1.1.1
				var part_system;
				part_system = PART_SYSTEM_DAMAGE_INDICATORS_PRO;
				for (var i = 1; i < ds_grid_width(part_system); i++) {
					part_system[# i, 0] = (ds_map_exists(mapping, part_system[# i, 0]))? mapping[? part_system[# i, 0]] : -1;
				}
				
				ds_map_destroy(mapping);
				ds_grid_destroy(ptgrid);
		    }
		break;
		case 12:
		    if (bit[0] != "") {
		    global.part_type_pro_slots = ds_list_create();
		    ds_list_read(global.part_type_pro_slots, bit[0]);
		    }
		break;
		case 13:
			// global.part_type_lt_props
		    if (bit[0] != "") {
				var ptgrid = ds_grid_import(-1, bit[0]);
				
				// Figure out which present particle types the past save is referring to
				var mapping = ds_map_create();
				for (var i = 0; i < ds_grid_width(ptgrid); i++) {
					// convert sprite to current sprite index
					ptgrid[# i, 0] = (ptgrid[# i, 0] == -1)? -1 : asset_get_index(global.save_sname[? ptgrid[# i, 0]]);
					
					// possibilities as of 1.1.1:
					// - disperse particles
					// - ultimate burst
					// - ultimate loot
					// - evilflame thruster & dual clone thruster (same properties, so it doesn't matter)
					// - evilflame fury thruster
					// method of identification: alpha1, sprite
					switch (ptgrid[# i, 19]) {
						case 1: mapping[? i] = PART_TYPE_DISPERSE_LT; break;
						case 0.8: mapping[? i] = PART_TYPE_ULTIMATE_BURST_LT; break;
						case 0.5: mapping[? i] = PART_TYPE_E_ULTIMATE_LOOT_LT; break;
						case 0.7: mapping[? i] = (ptgrid[# i, 0] == part_square)? PART_TYPE_P_EVILFLAME_THRUSTER_LT : PART_TYPE_P_EVILFLAME_FURY_THRUSTER_LT; break;
					}
				}
				
				// Remap all particle IDs from arbitrary indices to global values implemented after 1.1.1
				var part_system;
				part_system = PART_SYSTEM_ULTIMATE_LT;
				for (var i = 1; i < ds_grid_width(part_system); i++) {
					part_system[# i, 0] = (ds_map_exists(mapping, part_system[# i, 0]))? mapping[? part_system[# i, 0]] : -1;
				}
				part_system = PART_SYSTEM_PLAYERTOP_LT;
				for (var i = 1; i < ds_grid_width(part_system); i++) {
					part_system[# i, 0] = (ds_map_exists(mapping, part_system[# i, 0]))? mapping[? part_system[# i, 0]] : -1;
				}
				part_system = PART_SYSTEM_PLAYERBOT_LT;
				for (var i = 1; i < ds_grid_width(part_system); i++) {
					part_system[# i, 0] = (ds_map_exists(mapping, part_system[# i, 0]))? mapping[? part_system[# i, 0]] : -1;
				}
				part_system = PART_SYSTEM_ENEMY_LT;
				for (var i = 1; i < ds_grid_width(part_system); i++) {
					part_system[# i, 0] = (ds_map_exists(mapping, part_system[# i, 0]))? mapping[? part_system[# i, 0]] : -1;
				}
				
				ds_map_destroy(mapping);
				ds_grid_destroy(ptgrid);
		    }
		break;
		case 14:
		    if (bit[0] != "") {
		    global.part_type_lt_slots = ds_list_create();
		    ds_list_read(global.part_type_lt_slots, bit[0]);
		    }
		break;
		case 15:
			// global.part_type_ult_props
		    if (bit[0] != "") {
				var ptgrid = ds_grid_import(-1, bit[0]);
				
				// Figure out which present particle types the past save is referring to
				var mapping = ds_map_create();
				for (var i = 0; i < ds_grid_width(ptgrid); i++) {
					// convert sprite to current sprite index
					ptgrid[# i, 0] = (ptgrid[# i, 0] == -1)? -1 : asset_get_index(global.save_sname[? ptgrid[# i, 0]]);
					
					// possibilities as of 1.1.1:
					// - evilflame frags
					// - evilflame charge frag ring
					// - evilflame fury frags
					// - evilflame charge
					// - evilflame fury charge
					// - emerald frags
					// method of identification: size_incr
					switch (ptgrid[# i, 4]) {
						case -0.02: mapping[? i] = PART_TYPE_P_EVILFLAME_FRAG_ULT; break;
						case -0.005: mapping[? i] = PART_TYPE_P_EVILFLAME_CHARGE_ULT_RING_ULT; break;
						case -0.035: mapping[? i] = PART_TYPE_P_EVILFLAME_FURY_FRAG_ULT; break;
						case -0.007: mapping[? i] = PART_TYPE_P_EVILFLAME_CHARGE_ULT; break;
						case -0.01: mapping[? i] = PART_TYPE_P_EVILFLAME_FURY_CHARGE_ULT; break;
						case -0.0625: mapping[? i] = PART_TYPE_P_EMERALD_FRAG_ULT; break;
					}
				}
				
				// Remap all particle IDs from arbitrary indices to global values implemented after 1.1.1
				var part_system;
				part_system = PART_SYSTEM_FRAG_ULT;
				for (var i = 1; i < ds_grid_width(part_system); i++) {
					part_system[# i, 0] = (ds_map_exists(mapping, part_system[# i, 0]))? mapping[? part_system[# i, 0]] : -1;
				}
				part_system = PART_SYSTEM_CHARGE_ULT;
				for (var i = 1; i < ds_grid_width(part_system); i++) {
					part_system[# i, 0] = (ds_map_exists(mapping, part_system[# i, 0]))? mapping[? part_system[# i, 0]] : -1;
				}
				
				ds_map_destroy(mapping);
				ds_grid_destroy(ptgrid);
		    }
		break;
		case 16:
		    if (bit[0] != "") {
		        global.part_type_ult_slots = ds_list_create();
		        ds_list_read(global.part_type_ult_slots, bit[0]);
		    }
		break;
		case 17:
		    string_readln_real(bit, ";"); // global.player_part[0] (disperse particles)
		        switch(global.chrsel) {
			        case 0:
			            string_readln_real(bit, ";"); // global.player_part[1]
			            string_readln_real(bit, ";"); // global.player_part[2]
			            string_readln_real(bit, ";"); // global.frag_part[0]
			            string_readln_real(bit, ";"); // global.frag_part[1]
			            string_readln_real(bit, ";"); // global.frag_part[2]
			            string_readln_real(bit, ";"); // global.charge_part[0]
			            string_readln_real(bit, ";"); // global.charge_part[1]
			            string_readln_real(bit, ";"); // global.ultimate_part[0]
			        break;
			        case 1:
			            string_readln_real(bit, ";"); // global.frag_part[0]
			        break;
		        }
		break;
		default: //object loading
			var temporaryobjectname = string_readln(bit, ";");
			var temporaryobjectindex;
			
			// 1.1.0 and 1.1.1 legacy method
			temporaryobjectindex = asset_get_index(temporaryobjectname);
			if (temporaryobjectindex > obj_enemy) {
				temporaryobjectindex += TOTAL_COMMON_ENEMY_COUNT;
			}
			
		    var fobj = instance_create_depth(0, 0, 0, temporaryobjectindex);
			
		    with (fobj) {
		        // default variables
		        previd			 = string_readln_real(bit, ";");
				var sindex		 = string_readln_real(bit, ";");
			
				// if the saved sprite comes from obj_debris, ignore the index,
				// as it's an arbitrary temporary number with no global mapping
				if (object_index == obj_debris) {
					sindex = -1;
				}
			
				// security check
				if (!ds_map_exists(global.save_sname, sindex)) {
					show_debug_message("FATAL ERROR: sindex " + string(sindex) + " is not mapped in global.save_sname!");
				}
			
		        sprite_index	 = (sindex == -1)? -1 : asset_get_index(global.save_sname[? sindex]);
		        image_index		 = string_readln_real(bit, ";");
		        image_speed		 = string_readln_real(bit, ";");
		        prev_image_speed = string_readln_real(bit, ";");
		        for (var fi = 0; fi < 12; fi++) {
		            alarm[fi]    = string_readln_real(bit, ";");
		        }
				depth			 = string_readln_real(bit, ";");
				if (ds_map_exists(global.object_layer, object_index)) {
					layer_add_instance(global.object_layer[? object_index], id);
				} else {
					show_debug_message("WARNING: \"" + object_get_name(object_index) + "\" not found in object_layer map");
					layer = -1;
				}
		        image_alpha		 = string_readln_real(bit, ";");
		        image_angle		 = string_readln_real(bit, ";");
		        image_blend		 = string_readln_real(bit, ";");
		        image_xscale	 = string_readln_real(bit, ";");
		        image_yscale	 = string_readln_real(bit, ";");
		        mask_index		 = string_readln_real(bit, ";");
		        direction		 = string_readln_real(bit, ";");
		        x				 = string_readln_real(bit, ";");
		        y				 = string_readln_real(bit, ";");
		        xprevious		 = string_readln_real(bit, ";");
		        yprevious		 = string_readln_real(bit, ";");
		        xstart			 = string_readln_real(bit, ";");
		        ystart			 = string_readln_real(bit, ";");
            
		        //knockback variables
		        if (object_is_ancestor(object_index, obj_knockback_physics)) {
		            hkb  = string_readln_real(bit, ";");
		            vkb  = string_readln_real(bit, ";");
		            ahkb = string_readln_real(bit, ";");
		            avkb = string_readln_real(bit, ";");
		        }
            
		        //speeds physics variables
		        if (object_is_ancestor(object_index, obj_speeds_physics)) {
		            hspeed1 = string_readln_real(bit, ";");
		            vspeed1 = string_readln_real(bit, ";");
		            speed1  = string_readln_real(bit, ";");
		        }
            
		        //object specific variables
		        switch(object_index) {
			        case obj_player:
			            hp						= string_readln_real(bit, ";");
			            hpmax					= string_readln_real(bit, ";");
			            bdmg					= string_readln_real(bit, ";");
			            bdef					= string_readln_real(bit, ";");
			            bpen					= string_readln_real(bit, ";");
			            bkb						= string_readln_real(bit, ";");
			            bkbres					= string_readln_real(bit, ";");
			            acc						= string_readln_real(bit, ";");
			            counteracc				= string_readln_real(bit, ";");
			            spd						= string_readln_real(bit, ";");
			            invtime					= string_readln_real(bit, ";");
			            foctime					= string_readln_real(bit, ";");
			            focus					= string_readln_real(bit, ";");
			            pdmg					= string_readln_real(bit, ";");
			            pdef					= string_readln_real(bit, ";");
			            ppen					= string_readln_real(bit, ";");
			            pkb						= string_readln_real(bit, ";");
			            pkbres					= string_readln_real(bit, ";");
			            pspd					= string_readln_real(bit, ";");
			            sacc					= string_readln_real(bit, ";");
			            sspd					= string_readln_real(bit, ";");
			            fmin					= string_readln_real(bit, ";");
			            fmax					= string_readln_real(bit, ";");
			            fdmg					= string_readln_real(bit, ";");
			            fpen					= string_readln_real(bit, ";");
			            fkb						= string_readln_real(bit, ";");
			            cdmg					= string_readln_real(bit, ";");
			            cpen					= string_readln_real(bit, ";");
			            ckb						= string_readln_real(bit, ";");
			            ctime					= string_readln_real(bit, ";");
			            ccooldown				= string_readln_real(bit, ";");
			            ucooldown				= string_readln_real(bit, ";");
			            xv						= string_readln_real(bit, ";");
			            yv						= string_readln_real(bit, ";");
			            shot					= string_readln_real(bit, ";");
			            inv						= string_readln_real(bit, ";");
			            charge					= string_readln_real(bit, ";");
			            discharge				= string_readln_real(bit, ";");
			            artcharge				= string_readln_real(bit, ";");
			            cb						= string_readln_real(bit, ";");
			            spawn					= string_readln_real(bit, ";");
			            hpmark					= string_readln_real(bit, ";");
			            hpmark_v				= string_readln_real(bit, ";");
			            helper					= string_readln_real(bit, ";");
			            focus					= string_readln_real(bit, ";");
			            foctime					= string_readln_real(bit, ";");
			            focus_state				= string_readln_real(bit, ";");
			            evilflame_sprite_swap   = bool(string_readln_real(bit, ";"));
			            evilflame_twilight_fury = bool(string_readln_real(bit, ";"));
			            status_effect[0]		= string_readln_real(bit, ";");
			            status_effect[1]		= string_readln_real(bit, ";");
			            status_effect[2]		= string_readln_real(bit, ";");
			            status_effect[3]		= string_readln_real(bit, ";");
			            status_effect[4]		= string_readln_real(bit, ";");
			            status_effect[5]		= string_readln_real(bit, ";");
			            status_effect[6]		= string_readln_real(bit, ";");
			            status_effect[7]		= string_readln_real(bit, ";");
			            status_effect[8]		= string_readln_real(bit, ";");
			            status_effect[9]		= string_readln_real(bit, ";");
			            status_effect[10]		= string_readln_real(bit, ";");
			            var afterimage_data		= other.line[++other.progress];
			            if (afterimage_data != "") {
			                afterimage_ds_grid  = ds_grid_create(0, 0);
			                afterimage_ds_grid  = ds_grid_import(afterimage_ds_grid, afterimage_data);
							// switch old sprites to new indices
							for (var fi = 1; fi < ds_grid_width(afterimage_ds_grid); fi++) {
								afterimage_ds_grid[# fi, 0] = asset_get_index(global.save_sname[? afterimage_ds_grid[# fi, 0]]);
							}
			            }
			        break;
			        case obj_projectile:
			            spawn				= string_readln_real(bit, ";");
			            f					= string_readln_real(bit, ";");
			            e					= string_readln_real(bit, ";");
			            pdmg				= string_readln_real(bit, ";");
			            ppen				= string_readln_real(bit, ";");
			            pkb					= string_readln_real(bit, ";");
			            pspd				= string_readln_real(bit, ";");
			            sacc				= string_readln_real(bit, ";");
			            sspd				= string_readln_real(bit, ";");
			            fmin				= string_readln_real(bit, ";");
			            fmax				= string_readln_real(bit, ";");
			            rot					= string_readln_real(bit, ";");
			            lifespan			= string_readln_real(bit, ";");
			            var afterimage_data = other.line[++other.progress];
			            if (afterimage_data != "") {
			                afterimage_ds_grid = ds_grid_create(0, 0);
			                afterimage_ds_grid = ds_grid_import(afterimage_ds_grid, afterimage_data);
							// switch old sprites to new indices
							for (var fi = 1; fi < ds_grid_width(afterimage_ds_grid); fi++) {
								afterimage_ds_grid[# fi, 0] = asset_get_index(global.save_sname[? afterimage_ds_grid[# fi, 0]]);
							}
			            }
			        break;
			        case obj_frag:
			            spawn				= string_readln_real(bit, ";");
			            f					= string_readln_real(bit, ";");
			            e					= string_readln_real(bit, ";");
			            enemy				= string_readln_real(bit, ";");
			            enemyharm			= string_readln_real(bit, ";");
			            vacc				= string_readln_real(bit, ";");
			            hacc				= string_readln_real(bit, ";");
			            fmin				= string_readln_real(bit, ";");
			            fmax				= string_readln_real(bit, ";");
			            fdmg				= string_readln_real(bit, ";");
			            fpen				= string_readln_real(bit, ";");
			            fkb					= string_readln_real(bit, ";");
			            lifespan			= string_readln_real(bit, ";");
			            var afterimage_data = other.line[++other.progress];
			            if (afterimage_data != "") {
			                afterimage_ds_grid = ds_grid_create(0, 0);
			                afterimage_ds_grid = ds_grid_import(afterimage_ds_grid, afterimage_data);
							// switch old sprites to new indices
							for (var fi = 1; fi < ds_grid_width(afterimage_ds_grid); fi++) {
								afterimage_ds_grid[# fi, 0] = asset_get_index(global.save_sname[? afterimage_ds_grid[# fi, 0]]);
							}
			            }
			        break;
			        case obj_charge:
			            spawn	= string_readln_real(bit, ";");
			            f		= string_readln_real(bit, ";");
			            e		= string_readln_real(bit, ";");
			            charge	= string_readln_real(bit, ";");
			            rot		= string_readln_real(bit, ";");
			            cdmg	= string_readln_real(bit, ";");
			            cpen	= string_readln_real(bit, ";");
			            ckb		= string_readln_real(bit, ";");
			            target	= string_readln_real(bit, ";");
			            var afterimage_data = other.line[++other.progress];
			            if (afterimage_data != "") {
			                afterimage_ds_grid = ds_grid_create(0, 0);
			                afterimage_ds_grid = ds_grid_import(afterimage_ds_grid, afterimage_data);
							// switch old sprites to new indices
							for (var fi = 1; fi < ds_grid_width(afterimage_ds_grid); fi++) {
								afterimage_ds_grid[# fi, 0] = asset_get_index(global.save_sname[? afterimage_ds_grid[# fi, 0]]);
							}
			            }
			        break;
					case obj_enemy_christmas_rocket_elf: case obj_enemy_christmas_crow:
						cooldown			= string_readln_real(bit, ";");
						time_mark			= string_readln_real(bit, ";");
					    beh					= string_readln_real(bit, ";");
					    intro				= string_readln_real(bit, ";");
					    touchable			= string_readln_real(bit, ";");
					    hp					= string_readln_real(bit, ";");
					    hpmax				= string_readln_real(bit, ";");
					    bdmg				= string_readln_real(bit, ";");
					    bdef				= string_readln_real(bit, ";");
					    bpen				= string_readln_real(bit, ";");
					    bkb					= string_readln_real(bit, ";");
					    bkbres				= string_readln_real(bit, ";");
					    pdef				= string_readln_real(bit, ";");
					    pkbres				= string_readln_real(bit, ";");
					    fdef				= string_readln_real(bit, ";");
					    cdef				= string_readln_real(bit, ";");
					    udef				= string_readln_real(bit, ";");
					    fkbres				= string_readln_real(bit, ";");
					    ckbres				= string_readln_real(bit, ";");
					    ukbres				= string_readln_real(bit, ";");
					    bar_extension		= string_readln_real(bit, ";");
						// 1.1.0 and 1.1.1 compatibility code
						state = 0;
						if (object_index == obj_enemy_christmas_crow) {
							prev_bd = 74;
						}
						var afterimage_data = other.line[++other.progress];
					    if (afterimage_data != "") {
					        afterimage_ds_grid = ds_grid_create(0, 0);
					        afterimage_ds_grid = ds_grid_import(afterimage_ds_grid, afterimage_data);
							// switch old sprites to new indices
							for (var fi = 1; fi < ds_grid_width(afterimage_ds_grid); fi++) {
								afterimage_ds_grid[# fi, 0] = asset_get_index(global.save_sname[? afterimage_ds_grid[# fi, 0]]);
							}
					    }
					    loot = ds_map_create();
					    ds_map_read(loot, other.line[++other.progress]);
					break;
					case obj_enemy_christmas_snowman: case obj_enemy_christmas_gingerbread_man: case obj_enemy_christmas_reindeer:
						cooldown			= string_readln_real(bit, ";");
						time_mark			= string_readln_real(bit, ";");
					    beh					= string_readln_real(bit, ";");
					    intro				= string_readln_real(bit, ";");
					    touchable			= string_readln_real(bit, ";");
					    hp					= string_readln_real(bit, ";");
					    hpmax				= string_readln_real(bit, ";");
					    bdmg				= string_readln_real(bit, ";");
					    bdef				= string_readln_real(bit, ";");
					    bpen				= string_readln_real(bit, ";");
					    bkb					= string_readln_real(bit, ";");
					    bkbres				= string_readln_real(bit, ";");
						pdmg				= string_readln_real(bit, ";");
					    pdef				= string_readln_real(bit, ";");
						ppen				= string_readln_real(bit, ";");
						pkb					= string_readln_real(bit, ";");
					    pkbres				= string_readln_real(bit, ";");
					    fdef				= string_readln_real(bit, ";");
					    cdef				= string_readln_real(bit, ";");
					    udef				= string_readln_real(bit, ";");
					    fkbres				= string_readln_real(bit, ";");
					    ckbres				= string_readln_real(bit, ";");
					    ukbres				= string_readln_real(bit, ";");
					    bar_extension		= string_readln_real(bit, ";");
						// 1.1.0 and 1.1.1 compatibility code
						state = 0;
						if (object_index == obj_enemy_christmas_gingerbread_man) {
							superattack_cooldown		= 0;
							superattack_jittervalue		= 0;
							superattack_projectilecount	= 0;
							superattack_projectileshot	= FALSE;
							jitterx						= 0;
							jittery						= 0;
						}
						var afterimage_data = other.line[++other.progress];
					    if (afterimage_data != "") {
					        afterimage_ds_grid = ds_grid_create(0, 0);
					        afterimage_ds_grid = ds_grid_import(afterimage_ds_grid, afterimage_data);
							// switch old sprites to new indices
							for (var fi = 1; fi < ds_grid_width(afterimage_ds_grid); fi++) {
								afterimage_ds_grid[# fi, 0] = asset_get_index(global.save_sname[? afterimage_ds_grid[# fi, 0]]);
							}
					    }
					    loot = ds_map_create();
					    ds_map_read(loot, other.line[++other.progress]);
					break;
			        case obj_enemy: // this stays for backwards compatibility reasons (versions pre 1.2.0)
				        var cooldown_		= string_readln_real(bit, ";");
				        var time_mark_		= string_readln_real(bit, ";");
				        f					= string_readln_real(bit, ";");
						var destination_instance = instance_create(x, y, obj_enemy_christmas_rocket_elf + f);
						var afterimage_data = other.line[++other.progress];
						var other_other_line_ = other.line[++other.progress];
						with(destination_instance) {
							previd			 = other.previd;
							sprite_index	 = other.sprite_index;
							image_index		 = other.image_index;
							image_speed		 = other.image_speed;
							prev_image_speed = other.prev_image_speed;
							for (var fi = 0; fi < 12; fi++) {
								alarm[fi]    = other.alarm[fi];
							}
							depth			 = other.depth;
							image_alpha		 = other.image_alpha;
							image_angle		 = other.image_angle;
							image_blend		 = other.image_blend;
							image_xscale	 = other.image_xscale;
							image_yscale	 = other.image_yscale;
							mask_index		 = other.mask_index;
							direction		 = other.direction;
							x				 = other.x;
							y				 = other.y;
							xprevious		 = other.xprevious;
							yprevious		 = other.yprevious;
							xstart			 = other.xstart;
							ystart			 = other.ystart;
							hkb  = other.hkb;
							vkb  = other.vkb;
							ahkb = other.ahkb;
							avkb = other.avkb;
							hspeed1 = other.hspeed1;
							vspeed1 = other.vspeed1;
							speed1  = other.speed1;
							
							cooldown			= cooldown_;
							time_mark			= time_mark_;
					        beh					= string_readln_real(bit, ";");
					        intro				= string_readln_real(bit, ";");
					        touchable			= string_readln_real(bit, ";");
					        hp					= string_readln_real(bit, ";");
					        hpmax				= string_readln_real(bit, ";");
					        bdmg				= string_readln_real(bit, ";");
					        bdef				= string_readln_real(bit, ";");
					        bpen				= string_readln_real(bit, ";");
					        bkb					= string_readln_real(bit, ";");
					        bkbres				= string_readln_real(bit, ";");
							if (other.f == 2 || other.f == 3 || other.f == 4) { pdmg = string_readln_real(bit, ";"); } else { string_readln_real(bit, ";"); }
					        pdef				= string_readln_real(bit, ";");
					        if (other.f == 2 || other.f == 3 || other.f == 4) { ppen = string_readln_real(bit, ";");
																				pkb  = string_readln_real(bit, ";"); } else { string_readln_real(bit, ";"); string_readln_real(bit, ";"); }
					        pkbres				= string_readln_real(bit, ";");
					        fdef				= string_readln_real(bit, ";");
					        cdef				= string_readln_real(bit, ";");
					        udef				= string_readln_real(bit, ";");
					        fkbres				= string_readln_real(bit, ";");
					        ckbres				= string_readln_real(bit, ";");
					        ukbres				= string_readln_real(bit, ";");
					        bar_extension		= string_readln_real(bit, ";");
				            
					        if (afterimage_data != "") {
					            afterimage_ds_grid = ds_grid_create(0, 0);
					            afterimage_ds_grid = ds_grid_import(afterimage_ds_grid, afterimage_data);
								// switch old sprites to new indices
								for (var fi = 1; fi < ds_grid_width(afterimage_ds_grid); fi++) {
									afterimage_ds_grid[# fi, 0] = asset_get_index(global.save_sname[? afterimage_ds_grid[# fi, 0]]);
								}
					        }
					        loot = ds_map_create();
					        ds_map_read(loot, other_other_line_);
						}
						instance_destroy(self, false);
			        break;
			        case obj_eprojectile:
			            spawn				= string_readln_real(bit, ";");
			            f					= string_readln_real(bit, ";");
			            acc					= string_readln_real(bit, ";");
			            rot					= string_readln_real(bit, ";");
			            pdmg				= string_readln_real(bit, ";");
			            ppen				= string_readln_real(bit, ";");
			            pkb					= string_readln_real(bit, ";");
			            lifespan			= string_readln_real(bit, ";");
						e				    = 0;
			            var afterimage_data = other.line[++other.progress];
			            if (afterimage_data != "") {
			                afterimage_ds_grid = ds_grid_create(0, 0);
			                afterimage_ds_grid = ds_grid_import(afterimage_ds_grid, afterimage_data);
							// switch old sprites to new indices
							for (var fi = 1; fi < ds_grid_width(afterimage_ds_grid); fi++) {
								afterimage_ds_grid[# fi, 0] = asset_get_index(global.save_sname[? afterimage_ds_grid[# fi, 0]]);
							}
			            }
			        break;
			        case obj_oscillator:
			            waveform[0, 0]  = string_readln_real(bit, ";");
			            waveform[1, 0]  = string_readln_real(bit, ";");
			            waveform[2, 0]  = string_readln_real(bit, ";");
			            waveform[3, 0]  = string_readln_real(bit, ";");
			            waveform[0, 1]  = string_readln_real(bit, ";");
			            waveform[1, 1]  = string_readln_real(bit, ";");
			            waveform[2, 1]  = string_readln_real(bit, ";");
			            waveform[3, 1]  = string_readln_real(bit, ";");
			            radius[0]	    = string_readln_real(bit, ";");
			            radius[1]	    = string_readln_real(bit, ";");
			            acceleration[0] = string_readln_real(bit, ";");
			            acceleration[1] = string_readln_real(bit, ";");
			            time[0]			= string_readln_real(bit, ";");
			            time[1]			= string_readln_real(bit, ";");
			            cycle[0]		= string_readln_real(bit, ";");
			            cycle[1]		= string_readln_real(bit, ";");
			            output[0]		= string_readln_real(bit, ";");
			            output[1]		= string_readln_real(bit, ";");
			            cyclecount[0]	= string_readln_real(bit, ";");
			            cyclecount[1]	= string_readln_real(bit, ";");
			            duration[0]		= string_readln_real(bit, ";");
			            duration[1]		= string_readln_real(bit, ";");
			        break;
			        case obj_screenshake:
			            h_value		= string_readln_real(bit, ";");
			            h_value0	= string_readln_real(bit, ";");
			            v_value		= string_readln_real(bit, ";");
			            v_value0	= string_readln_real(bit, ";");
			            rate		= string_readln_real(bit, ";");
			            time		= string_readln_real(bit, ";");
			            time_clock	= string_readln_real(bit, ";");
			            decrease	= string_readln_real(bit, ";");
			        break;
			        case obj_present:
			            f					= string_readln_real(bit, ";");
			            wave_cycle			= string_readln_real(bit, ";");
			            number				= string_readln_real(bit, ";");
			            picked				= string_readln_real(bit, ";");
			            var afterimage_data = other.line[++other.progress];;
			            if (afterimage_data != "") {
			                afterimage_ds_grid = ds_grid_create(0, 0);
			                afterimage_ds_grid = ds_grid_import(afterimage_ds_grid, afterimage_data);
							// switch old sprites to new indices
							for (var fi = 1; fi < ds_grid_width(afterimage_ds_grid); fi++) {
								afterimage_ds_grid[# fi, 0] = asset_get_index(global.save_sname[? afterimage_ds_grid[# fi, 0]]);
							}
			            }
			        break;
			        case obj_ultimate_activation:
			            size	 = string_readln_real(bit, ";");
			            stage	 = string_readln_real(bit, ";");
			            progress = string_readln_real(bit, ";");
			        break;
			        case obj_evilflame_ultimate:
			            player		   = string_readln_real(bit, ";");
			            hp			   = string_readln_real(bit, ";");
			            hpmax		   = string_readln_real(bit, ";");
			            hpmark		   = string_readln_real(bit, ";");
			            hpmark_v	   = string_readln_real(bit, ";");
			            inv			   = string_readln_real(bit, ";");
			            invtime		   = string_readln_real(bit, ";");
			            cb			   = string_readln_real(bit, ";");
			            charge		   = string_readln_real(bit, ";");
			            ctime		   = string_readln_real(bit, ";");
			            discharge	   = string_readln_real(bit, ";");
			            ccooldown	   = string_readln_real(bit, ";");
			            artcharge	   = string_readln_real(bit, ";");
			            color		   = string_readln_real(bit, ";");
			            shot		   = string_readln_real(bit, ";");
			            bar_opacity[0] = string_readln_real(bit, ";");
			            bar_opacity[1] = string_readln_real(bit, ";");
			            bar_opacity[2] = string_readln_real(bit, ";");
			            bar_yoffset[0] = string_readln_real(bit, ";");
			            bar_yoffset[1] = string_readln_real(bit, ";");
			            bar_yoffset[2] = string_readln_real(bit, ";");
			        break;
			        case obj_emerald_ultimate:
			            scale_v		= string_readln_real(bit, ";");
			            scale_stage = string_readln_real(bit, ";");
			            rot			= string_readln_real(bit, ";");
			            rot_cycle	= string_readln_real(bit, ";");
			            spawn_clock = string_readln_real(bit, ";");
			            lifespan	= string_readln_real(bit, ";");
			        break;
			        case obj_emerald_ultimate_flow:
			            scale_v		= string_readln_real(bit, ";");
			            scale_stage = string_readln_real(bit, ";");
			            rot			= string_readln_real(bit, ";");
			            size_growth = string_readln_real(bit, ";");
			            clock		= string_readln_real(bit, ";");
			        break;
			        case obj_emerald_ultimate_force:
			            clock = string_readln_real(bit, ";");
			        break;
			        case obj_debris:
			            split_sprite		= asset_get_index(global.save_sname[? string_readln_real(bit, ";")]);
			            split_sprite_index	= string_readln_real(bit, ";");
			            split_sprite_xscale = string_readln_real(bit, ";");
			            split_sprite_yscale = string_readln_real(bit, ";");
			            split_sprite_color	= string_readln_real(bit, ";");
			            split_sprite_alpha	= string_readln_real(bit, ";");
			            split_angle			= string_readln_real(bit, ";");
			            split_part			= string_readln_real(bit, ";");
			            custom_sprite		= string_readln_real(bit, ";");
			            if (custom_sprite == 2) {
			                var sprite   = scr_SpriteSplit(split_sprite, split_sprite_index, split_sprite_xscale, split_sprite_yscale, split_sprite_color, split_sprite_alpha, split_angle);
			                sprite_index = sprite[split_part];
			            }
			            var afterimage_data = other.line[++other.progress];
			            if (afterimage_data != "") {
			                afterimage_ds_grid = ds_grid_create(0, 0);
			                afterimage_ds_grid = ds_grid_import(afterimage_ds_grid, afterimage_data);
			                draw_afterimage_set_sprite(sprite_index, 0);
			            }
			        break;
			        case obj_wrap_helper: case obj_explosion:
			            var afterimage_data = other.line[++other.progress];
			            if (afterimage_data != "") {
			                afterimage_ds_grid = ds_grid_create(0, 0);
			                afterimage_ds_grid = ds_grid_import(afterimage_ds_grid, afterimage_data);
							// switch old sprites to new indices
							for (var fi = 1; fi < ds_grid_width(afterimage_ds_grid); fi++) {
								afterimage_ds_grid[# fi, 0] = asset_get_index(global.save_sname[? afterimage_ds_grid[# fi, 0]]);
							}
			            }
			        break;
		        }
		    }
		break;
	}
    
	progress += 1;
	clock = interval;
	if (progress >= progress_max) {
	    phase = 5;
	    data = "";
	    progress = 0;
	    progress_max = 1;
	}



}
