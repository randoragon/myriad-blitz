/// @description scr_LoadData(data)
/// @param data
function scr_LoadInstance() {

	var args = argument[0];
	var ver  = args[1];

	// Read object index
	var oindex = string_readln_real(args);
	if (!ds_map_exists(global.save_oname, oindex)) {
		show_debug_message("WARNING: oindex " + string(oindex) + " has no corresponding value in global.save_oname!");
	}
	var obj = asset_get_index(global.save_oname[? oindex]);

	// Create instance
	var o = instance_create_depth(0, 0, 0, obj);

	// Load defaults and built-ins that every object has
	o.previd = string_readln_real(args);
	var sindex = string_readln_real(args);
	if (!ds_map_exists(global.save_sname, sindex)) {
		show_debug_message("WARNING: sindex " + string(sindex) + " has no corresponding value in global.save_sname!");
	}
	o.sprite_index = (sindex == -1)? -1 : asset_get_index(global.save_sname[? sindex]);
	o.image_index = string_readln_real(args);
	o.image_speed = string_readln_real(args);
	o.prev_image_speed = string_readln_real(args);
	for (var i = 0; i < 12; i++) {
		o.alarm[i] = string_readln_real(args);
	}
	o.depth	= string_readln_real(args);
	if (version_ge(ver, "1.2.0")) {
		var lname = string_readln(args);
		if (layer_exists(lname)) {
			layer_add_instance(lname, o);
		} else {
			show_debug_message("WARNING: unknown layer name \"" + lname + "\" for " + object_get_name(obj));
			o.layer = -1;
		}
	} else {
		if (ds_map_exists(global.object_layer, obj)) {
			layer_add_instance(global.object_layer[? obj], o);
		} else {
			show_debug_message("WARNING: \"" + object_get_name(obj) + "\" not found in object_layer map");
			o.layer = -1;
		}
	}
	o.image_alpha	 = string_readln_real(args);
	o.image_angle	 = string_readln_real(args);
	o.image_blend	 = string_readln_real(args);
	o.image_xscale	 = string_readln_real(args);
	o.image_yscale	 = string_readln_real(args);
	o.mask_index	 = string_readln_real(args);
	o.direction		 = string_readln_real(args);
	o.x				 = string_readln_real(args);
	o.y				 = string_readln_real(args);
	o.xprevious		 = string_readln_real(args);
	o.yprevious		 = string_readln_real(args);
	o.xstart		 = string_readln_real(args);
	o.ystart		 = string_readln_real(args);

	// Read parent variables
	if (object_is_ancestor(obj, obj_knockback_physics)) {
		o.hkb  = string_readln_real(args);
		o.vkb  = string_readln_real(args);
		o.ahkb = string_readln_real(args);
		o.avkb = string_readln_real(args);
	}
	if (object_is_ancestor(obj, obj_speeds_physics)) {
		o.hspeed1 = string_readln_real(args);
		o.vspeed1 = string_readln_real(args);
		o.speed1  = string_readln_real(args);
	}

	// Object specific data
	switch(obj) {
		case obj_player:
			o.hp			= string_readln_real(args);
			o.hpmax			= string_readln_real(args);
			o.bdmg			= string_readln_real(args);
			o.bdef			= string_readln_real(args);
			o.bpen			= string_readln_real(args);
			o.bkb			= string_readln_real(args);
			o.bkbres		= string_readln_real(args);
			o.acc			= string_readln_real(args);
			o.counteracc	= string_readln_real(args);
			o.spd			= string_readln_real(args);
			o.invtime		= string_readln_real(args);
			o.foctime		= string_readln_real(args);
			o.focus			= string_readln_real(args);
			o.pdmg			= string_readln_real(args);
			o.pdef			= string_readln_real(args);
			o.ppen			= string_readln_real(args);
			o.pkb			= string_readln_real(args);
			o.pkbres		= string_readln_real(args);
			o.pspd			= string_readln_real(args);
			o.sacc			= string_readln_real(args);
			o.sspd			= string_readln_real(args);
			o.fmin			= string_readln_real(args);
			o.fmax			= string_readln_real(args);
			o.fdmg			= string_readln_real(args);
			o.fpen			= string_readln_real(args);
			o.fkb			= string_readln_real(args);
			o.cdmg			= string_readln_real(args);
			o.cpen			= string_readln_real(args);
			o.ckb			= string_readln_real(args);
			o.ctime			= string_readln_real(args);
			o.ccooldown		= string_readln_real(args);
			o.ucooldown		= string_readln_real(args);
			o.xv			= string_readln_real(args);
			o.yv			= string_readln_real(args);
			o.shot			= string_readln_real(args);
			o.inv			= string_readln_real(args);
			o.charge		= string_readln_real(args);
			o.discharge		= string_readln_real(args);
			o.artcharge		= string_readln_real(args);
			o.cb			= string_readln_real(args);
			o.spawn			= string_readln_real(args);
			o.hpmark		= string_readln_real(args);
			o.hpmark_v		= string_readln_real(args);
			o.helper		= string_readln_real(args);
			o.focus			= string_readln_real(args);
			o.foctime		= string_readln_real(args);
			o.focus_state	= string_readln_real(args);
			o.evilflame_sprite_swap   = bool(string_readln_real(args));
			o.evilflame_twilight_fury = bool(string_readln_real(args));
		
			for (var i = 0; i < global.status_effect_count; i++) {
				o.status_effect[i] = string_readln_real(args);
			}
			
			if (version_ge(ver, "1.2.0")) {
				o.bar_opacity[0] = string_readln_real(args);
				o.bar_opacity[1] = string_readln_real(args);
				o.bar_opacity[2] = string_readln_real(args);
				o.bar_yoffset[0] = string_readln_real(args);
				o.bar_yoffset[1] = string_readln_real(args);
				o.bar_yoffset[2] = string_readln_real(args);
			}
			
			if (version_ge(ver, "1.2.1")) {
				o.ultcount = string_readln_real(args);
			} else {
				o.ultcount = 0;
			}
		break;
		case obj_projectile:
			o.spawn	 = string_readln_real(args);
			o.f		 = string_readln_real(args);
			o.e		 = string_readln_real(args);
			o.pdmg	 = string_readln_real(args);
			o.ppen	 = string_readln_real(args);
			o.pkb	 = string_readln_real(args);
			o.pspd	 = string_readln_real(args);
			o.sacc	 = string_readln_real(args);
			o.sspd	 = string_readln_real(args);
			o.fmin	 = string_readln_real(args);
			o.fmax	 = string_readln_real(args);
			o.rot	 = string_readln_real(args);
			o.lifespan	 = string_readln_real(args);
			o.fadeout	 = string_readln_real(args);
			o.fadeoutmax = string_readln_real(args);
			o.fading	 = string_readln_real(args);					
			o.surface_overlay_x	= string_readln_real(args);
			o.surface_overlay_y	= string_readln_real(args);
			o.surface_overlay_xscale = string_readln_real(args);
			o.surface_overlay_yscale = string_readln_real(args);
			o.surface_overlay_angle  = string_readln_real(args);
			o.surface_overlay_alpha  = string_readln_real(args);
		break;
		case obj_frag:
			o.spawn				= string_readln_real(args);
			o.f					= string_readln_real(args);
			o.e					= string_readln_real(args);
			o.enemy				= string_readln_real(args);
			o.enemyharm			= string_readln_real(args);
			o.vacc				= string_readln_real(args);
			o.hacc				= string_readln_real(args);
			o.fmin				= string_readln_real(args);
			o.fmax				= string_readln_real(args);
			o.fdmg				= string_readln_real(args);
			o.fpen				= string_readln_real(args);
			o.fkb				= string_readln_real(args);
			o.lifespan			= string_readln_real(args);
			o.fadeout			= string_readln_real(args);
			o.fadeoutmax		= string_readln_real(args);
			o.fading			= string_readln_real(args);					
			o.surface_overlay_x	= string_readln_real(args);
			o.surface_overlay_y	= string_readln_real(args);
			o.surface_overlay_xscale = string_readln_real(args);
			o.surface_overlay_yscale = string_readln_real(args);
			o.surface_overlay_angle  = string_readln_real(args);
			o.surface_overlay_alpha  = string_readln_real(args);
			
			if (version_ge(ver, "1.2.1")) {
				o.pierce_bounce = string_readln_real(args);
			} else {
				o.pierce_bounce = 0;
			}
		break;
		case obj_charge:
			o.spawn		= string_readln_real(args);
			o.f			= string_readln_real(args);
			o.e			= string_readln_real(args);
			o.charge	= string_readln_real(args);
			o.rot		= string_readln_real(args);
			o.cdmg		= string_readln_real(args);
			o.cpen		= string_readln_real(args);
			o.ckb		= string_readln_real(args);
			o.target	= string_readln_real(args);
		break;
		case obj_minion:
			o.f		   = string_readln_real(args);
			o.e		   = string_readln_real(args);
			o.state	   = string_readln_real(args);
			o.spawn	   = string_readln_real(args);
			o.cooldown = string_readln_real(args);
		break;
		case obj_enemy_christmas_rocket_elf:
			o.cooldown			= string_readln_real(args);
			o.time_mark			= string_readln_real(args);
			o.beh				= string_readln_real(args);
			o.intro				= string_readln_real(args);
			o.touchable			= string_readln_real(args);
			o.hp				= string_readln_real(args);
			o.hpmax				= string_readln_real(args);
			o.bdmg				= string_readln_real(args);
			o.bdef				= string_readln_real(args);
			o.bpen				= string_readln_real(args);
			o.bkb				= string_readln_real(args);
			o.bkbres			= string_readln_real(args);
			o.pdef				= string_readln_real(args);
			o.pkbres			= string_readln_real(args);
			o.fdef				= string_readln_real(args);
			o.cdef				= string_readln_real(args);
			o.udef				= string_readln_real(args);
			o.fkbres			= string_readln_real(args);
			o.ckbres			= string_readln_real(args);
			o.ukbres			= string_readln_real(args);
			o.bar_extension		= string_readln_real(args);
			o.state				= string_readln_real(args);
			o.loot				= ds_map_create();
			ds_map_read(o.loot, string_readln(args));
		break;
		case obj_enemy_christmas_crow:
			o.cooldown			= string_readln_real(args);
			o.time_mark			= string_readln_real(args);
			o.beh				= string_readln_real(args);
			o.intro				= string_readln_real(args);
			o.touchable			= string_readln_real(args);
			o.hp				= string_readln_real(args);
			o.hpmax				= string_readln_real(args);
			o.bdmg				= string_readln_real(args);
			o.bdef				= string_readln_real(args);
			o.bpen				= string_readln_real(args);
			o.bkb				= string_readln_real(args);
			o.bkbres			= string_readln_real(args);
			o.pdef				= string_readln_real(args);
			o.pkbres			= string_readln_real(args);
			o.fdef				= string_readln_real(args);
			o.cdef				= string_readln_real(args);
			o.udef				= string_readln_real(args);
			o.fkbres			= string_readln_real(args);
			o.ckbres			= string_readln_real(args);
			o.ukbres			= string_readln_real(args);
			o.bar_extension		= string_readln_real(args);
			o.state				= string_readln_real(args);
			o.prev_bd			= string_readln_real(args);
			o.loot				= ds_map_create();
			ds_map_read(o.loot, string_readln(args));
		break;
		case obj_enemy_christmas_snowman: case obj_enemy_christmas_reindeer:
			o.cooldown			= string_readln_real(args);
			o.time_mark			= string_readln_real(args);
			o.beh				= string_readln_real(args);
			o.intro				= string_readln_real(args);
			o.touchable			= string_readln_real(args);
			o.hp				= string_readln_real(args);
			o.hpmax				= string_readln_real(args);
			o.bdmg				= string_readln_real(args);
			o.bdef				= string_readln_real(args);
			o.bpen				= string_readln_real(args);
			o.bkb				= string_readln_real(args);
			o.bkbres			= string_readln_real(args);
			o.pdmg				= string_readln_real(args);
			o.pdef				= string_readln_real(args);
			o.ppen				= string_readln_real(args);
			o.pkb				= string_readln_real(args);
			o.pkbres			= string_readln_real(args);
			o.fdef				= string_readln_real(args);
			o.cdef				= string_readln_real(args);
			o.udef				= string_readln_real(args);
			o.fkbres			= string_readln_real(args);
			o.ckbres			= string_readln_real(args);
			o.ukbres			= string_readln_real(args);
			o.bar_extension		= string_readln_real(args);
			o.loot				= ds_map_create();
			ds_map_read(o.loot, string_readln(args));
		break;
		case obj_enemy_christmas_gingerbread_man:
			o.cooldown			= string_readln_real(args);
			o.time_mark			= string_readln_real(args);
			o.beh				= string_readln_real(args);
			o.intro				= string_readln_real(args);
			o.touchable			= string_readln_real(args);
			o.hp				= string_readln_real(args);
			o.hpmax				= string_readln_real(args);
			o.bdmg				= string_readln_real(args);
			o.bdef				= string_readln_real(args);
			o.bpen				= string_readln_real(args);
			o.bkb				= string_readln_real(args);
			o.bkbres			= string_readln_real(args);
			o.pdmg				= string_readln_real(args);
			o.pdef				= string_readln_real(args);
			o.ppen				= string_readln_real(args);
			o.pkb				= string_readln_real(args);
			o.pkbres			= string_readln_real(args);
			o.fdef				= string_readln_real(args);
			o.cdef				= string_readln_real(args);
			o.udef				= string_readln_real(args);
			o.fkbres			= string_readln_real(args);
			o.ckbres			= string_readln_real(args);
			o.ukbres			= string_readln_real(args);
			o.bar_extension		= string_readln_real(args);
			o.state						= string_readln_real(args);
			o.superattack_cooldown		= string_readln_real(args);
			o.superattack_jittervalue		= string_readln_real(args);
			o.superattack_projectilecount	= string_readln_real(args);
			o.superattack_projectileshot	= bool(string_readln_real(args));
			o.jitterx						= string_readln_real(args);
			o.jittery						= string_readln_real(args);
			o.loot				= ds_map_create();
			ds_map_read(o.loot, string_readln(args));
		break;
		case obj_eprojectile:
			o.spawn	   = string_readln_real(args);
			o.f		   = string_readln_real(args);
			o.acc	   = string_readln_real(args);
			o.rot	   = string_readln_real(args);
			o.pdmg	   = string_readln_real(args);
			o.ppen	   = string_readln_real(args);
			o.pkb	   = string_readln_real(args);
			o.lifespan = string_readln_real(args);
			o.e		   = string_readln_real(args);
		break;
		case obj_oscillator:
			o.waveform[0, 0]	= string_readln_real(args);
			o.waveform[1, 0]	= string_readln_real(args);
			o.waveform[2, 0]	= string_readln_real(args);
			o.waveform[3, 0]	= string_readln_real(args);
			o.waveform[0, 1]	= string_readln_real(args);
			o.waveform[1, 1]	= string_readln_real(args);
			o.waveform[2, 1]	= string_readln_real(args);
			o.waveform[3, 1]	= string_readln_real(args);
			o.radius[0]			= string_readln_real(args);
			o.radius[1]			= string_readln_real(args);
			o.acceleration[0]	= string_readln_real(args);
			o.acceleration[1]	= string_readln_real(args);
			o.time[0]			= string_readln_real(args);
			o.time[1]			= string_readln_real(args);
			o.cycle[0]			= string_readln_real(args);
			o.cycle[1]			= string_readln_real(args);
			o.output[0]			= string_readln_real(args);
			o.output[1]			= string_readln_real(args);
			o.cyclecount[0]		= string_readln_real(args);
			o.cyclecount[1]		= string_readln_real(args);
			o.duration[0]		= string_readln_real(args);
			o.duration[1]		= string_readln_real(args);
		break;
		case obj_screenshake:
			o.h_value	 = string_readln_real(args);
			o.h_value0	 = string_readln_real(args);
			o.v_value	 = string_readln_real(args);
			o.v_value0	 = string_readln_real(args);
			o.rate		 = string_readln_real(args);
			o.time		 = string_readln_real(args);
			o.time_clock = string_readln_real(args);
			o.decrease	 = string_readln_real(args);
		break;
		case obj_present:
			o.f			 = string_readln_real(args);
			o.wave_cycle = string_readln_real(args);
			o.number	 = string_readln_real(args);
			o.picked	 = string_readln_real(args);
		break;
		case obj_ultimate_activation:
			o.size	   = string_readln_real(args);
			o.stage	   = string_readln_real(args);
			o.progress = string_readln_real(args);
		break;
		case obj_evilflame_ultimate:
			o.player		 = string_readln_real(args);
			o.hp			 = string_readln_real(args);
			o.hpmax			 = string_readln_real(args);
			o.hpmark		 = string_readln_real(args);
			o.hpmark_v	     = string_readln_real(args);
			o.inv			 = string_readln_real(args);
			o.invtime		 = string_readln_real(args);
			o.cb			 = string_readln_real(args);
			o.charge		 = string_readln_real(args);
			o.ctime			 = string_readln_real(args);
			o.discharge		 = string_readln_real(args);
			o.ccooldown		 = string_readln_real(args);
			o.artcharge		 = string_readln_real(args);
			o.color			 = string_readln_real(args);
			o.shot			 = string_readln_real(args);
			o.bar_opacity[0] = string_readln_real(args);
			o.bar_opacity[1] = string_readln_real(args);
			o.bar_opacity[2] = string_readln_real(args);
			o.bar_yoffset[0] = string_readln_real(args);
			o.bar_yoffset[1] = string_readln_real(args);
			o.bar_yoffset[2] = string_readln_real(args);
		break;
		case obj_emerald_ultimate:
			o.scale_v	  = string_readln_real(args);
			o.scale_stage = string_readln_real(args);
			o.rot		  = string_readln_real(args);
			o.rot_cycle	  = string_readln_real(args);
			o.spawn_clock = string_readln_real(args);
			o.lifespan	  = string_readln_real(args);
		break;
		case obj_emerald_ultimate_flow:
			o.scale_v	  = string_readln_real(args);
			o.scale_stage = string_readln_real(args);
			o.rot		  = string_readln_real(args);
			o.size_growth = string_readln_real(args);
			o.clock		  = string_readln_real(args);
		break;
		case obj_emerald_ultimate_force:
			o.clock = string_readln_real(args);
		break;
		case obj_bobileusz_ultimate:
			o.tx		   = string_readln_real(args);
			o.ty		   = string_readln_real(args);
			o.progress	   = string_readln_real(args);
			o.goal		   = string_readln_real(args);
			o.lifespan	   = string_readln_real(args);
			o.lifespan_max = string_readln_real(args);
			o.prev_angle   = string_readln_real(args);
			o.debuffs	   = string_readln_real(args);
		break;
		case obj_debris:
			var sindex = string_readln_real(args);
			if (!ds_map_exists(global.save_sname, sindex)) {
				show_debug_message("WARNING: sindex " + string(sindex) + " has no corresponding value in global.save_sname!");
			}
			o.split_sprite			= asset_get_index(global.save_sname[? sindex]);
			o.split_sprite_index	= string_readln_real(args);
			o.split_sprite_xscale   = string_readln_real(args);
			o.split_sprite_yscale   = string_readln_real(args);
			o.split_sprite_color	= string_readln_real(args);
			o.split_sprite_alpha	= string_readln_real(args);
			o.split_angle			= string_readln_real(args);
			o.split_part			= string_readln_real(args);
			o.custom_sprite			= string_readln_real(args);
		
			// Recreate split sprites
			with(o) {
				if (custom_sprite == 2) {
					var sprite   = scr_SpriteSplit(split_sprite, split_sprite_index, split_sprite_xscale, split_sprite_yscale, split_sprite_color, split_sprite_alpha, split_angle);
					sprite_index = sprite[split_part];
				}
			}
		break;
	}

	// Sanity check
	if (string_length(args[0]) != 0) {
		show_debug_message("WARNING: leftover data while loading object \"" + global.save_oname[? oindex] + "\"!");
	}


}
