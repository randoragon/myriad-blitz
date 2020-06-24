/// @description scr_SaveParticleSlots(args)
/// @param args

var args = argument[0];
var o = args[2];

save_append(args, SAVE_DATA_INSTANCE);

/* Some variables need to be tinkered with prior to saving,
 * but we don't want to change the actual variables while in-game,
 * so we create temporary substitutes instead.
 */
var _sprite_index;
_sprite_index = o.sprite_index;
		
// Handle exceptional cases
if (o.object_index == obj_debris && o.custom_sprite == 2) {
	_sprite_index = -1;
}
						
// Sanity checks
if (_sprite_index >= 0 && !ds_map_exists(global.save_sindex, sprite_get_name(_sprite_index))) {
	show_debug_message("WARNING: object name \"" + object_get_name(o.object_index) + "\", sprite name \"" + sprite_get_name(_sprite_index) + "\" (_sprite_index=" + string(_sprite_index) + ") is not mapped in global.save_sindex!");
}
if (!ds_map_exists(global.save_oindex, object_get_name(o.object_index))) {
	show_debug_message("WARNING: object name \"" + object_get_name(o.object_index) + "\", (object_index=" + string(o.object_index) + ") is not mapped in global.save_oindex!");
}

// Save default or built-in variables that every object has
save_append(args, global.save_oindex[? object_get_name(o.object_index)]);
save_append(args, o);
save_append(args, (_sprite_index != -1)? global.save_sindex[? sprite_get_name(_sprite_index)] : -1);
save_append(args, o.image_index);
save_append(args, o.image_speed);
save_append(args, o.prev_image_speed);
for (var i = 0; i < 12; i++) {
	save_append(args, o.alarm[i]);
}
save_append(args, o.depth);
save_append(args, o.image_alpha);
save_append(args, o.image_angle);
save_append(args, o.image_blend);
save_append(args, o.image_xscale);
save_append(args, o.image_yscale);
save_append(args, o.mask_index);
save_append(args, o.direction);
save_append(args, o.x);
save_append(args, o.y);
save_append(args, o.xprevious);
save_append(args, o.yprevious);
save_append(args, o.xstart);
save_append(args, o.ystart);

// Save parent variables
if (object_is_ancestor(o.object_index, obj_knockback_physics)) {
	save_append(args, o.hkb);
	save_append(args, o.vkb);
	save_append(args, o.ahkb);
	save_append(args, o.avkb);
}
if (object_is_ancestor(o.object_index, obj_speeds_physics)) {
	save_append(args, o.hspeed1);
	save_append(args, o.vspeed1);
	save_append(args, o.speed1);
}

// Save object specific data
switch(o.object_index) {
	case obj_player:
		save_append(args, o.hp);
		save_append(args, o.hpmax);
		save_append(args, o.bdmg);
		save_append(args, o.bdef);
		save_append(args, o.bpen);
		save_append(args, o.bkb);
		save_append(args, o.bkbres);
		save_append(args, o.acc);
		save_append(args, o.counteracc);
		save_append(args, o.spd);
		save_append(args, o.invtime);
		save_append(args, o.foctime);
		save_append(args, o.focus);
		save_append(args, o.pdmg);
		save_append(args, o.pdef);
		save_append(args, o.ppen);
		save_append(args, o.pkb);
		save_append(args, o.pkbres);
		save_append(args, o.pspd);
		save_append(args, o.sacc);
		save_append(args, o.sspd);
		save_append(args, o.fmin);
		save_append(args, o.fmax);
		save_append(args, o.fdmg);
		save_append(args, o.fpen);
		save_append(args, o.fkb);
		save_append(args, o.cdmg);
		save_append(args, o.cpen);
		save_append(args, o.ckb);
		save_append(args, o.ctime);
		save_append(args, o.ccooldown);
		save_append(args, o.ucooldown);
		save_append(args, o.xv);
		save_append(args, o.yv);
		save_append(args, o.shot);
		save_append(args, o.inv);
		save_append(args, o.charge);
		save_append(args, o.discharge);
		save_append(args, o.artcharge);
		save_append(args, o.cb);
		save_append(args, o.spawn);
		save_append(args, o.hpmark);
		save_append(args, o.hpmark_v);
		save_append(args, o.helper);
		save_append(args, o.focus);
		save_append(args, o.foctime);
		save_append(args, o.focus_state);
		save_append(args, o.evilflame_sprite_swap);
		save_append(args, o.evilflame_twilight_fury);

		for (var i = 0; i < global.status_effect_count; i++) {
			save_append(args, o.status_effect[i]);
		}
	break;
	case obj_projectile:
		save_append(args, o.spawn);
		save_append(args, o.f);
		save_append(args, o.e);
		save_append(args, o.pdmg);
		save_append(args, o.ppen);
		save_append(args, o.pkb);
		save_append(args, o.pspd);
		save_append(args, o.sacc);
		save_append(args, o.sspd);
		save_append(args, o.fmin);
		save_append(args, o.fmax);
		save_append(args, o.rot);
		save_append(args, o.lifespan);
		save_append(args, o.fadeout);
		save_append(args, o.fadeoutmax);
		save_append(args, o.fading);
		save_append(args, o.surface_overlay_x);
		save_append(args, o.surface_overlay_y);
		save_append(args, o.surface_overlay_xscale);
		save_append(args, o.surface_overlay_yscale);
		save_append(args, o.surface_overlay_angle);
		save_append(args, o.surface_overlay_alpha);
	break;
	case obj_frag:
		save_append(args, o.spawn);
        save_append(args, o.f);
        save_append(args, o.e);
        save_append(args, o.enemy);
        save_append(args, o.enemyharm);
        save_append(args, o.vacc);
        save_append(args, o.hacc);
        save_append(args, o.fmin);
        save_append(args, o.fmax);
        save_append(args, o.fdmg);
        save_append(args, o.fpen);
        save_append(args, o.fkb);
        save_append(args, o.lifespan);
        save_append(args, o.fadeout);
        save_append(args, o.fadeoutmax);
        save_append(args, o.fading);
        save_append(args, o.surface_overlay_x);
        save_append(args, o.surface_overlay_y);
        save_append(args, o.surface_overlay_xscale);
		save_append(args, o.surface_overlay_yscale);
        save_append(args, o.surface_overlay_angle);
        save_append(args, o.surface_overlay_alpha);
	break;
	case obj_charge:
		save_append(args, o.spawn);
        save_append(args, o.f);
        save_append(args, o.e);
        save_append(args, o.charge);
        save_append(args, o.rot);
        save_append(args, o.cdmg);
        save_append(args, o.cpen);
        save_append(args, o.ckb);
        save_append(args, o.target);
	break;
	case obj_minion:
		save_append(args, o.f);
        save_append(args, o.e);
        save_append(args, o.state);
        save_append(args, o.spawn);
        save_append(args, o.cooldown);
	break;
	case obj_enemy_christmas_rocket_elf:
		save_append(args, o.cooldown);
        save_append(args, o.time_mark);
        save_append(args, o.beh);
        save_append(args, o.intro);
        save_append(args, o.touchable);
        save_append(args, o.hp);
        save_append(args, o.hpmax);
        save_append(args, o.bdmg);
        save_append(args, o.bdef);
        save_append(args, o.bpen);
        save_append(args, o.bkb);
        save_append(args, o.bkbres);
        save_append(args, o.pdef);
        save_append(args, o.pkbres);
        save_append(args, o.fdef);
        save_append(args, o.cdef);
        save_append(args, o.udef);
        save_append(args, o.fkbres);
        save_append(args, o.ckbres);
        save_append(args, o.ukbres);
        save_append(args, o.bar_extension);
        save_append(args, o.state);
		save_append(args, ds_map_write(o.loot));
	break;
	case obj_enemy_christmas_crow:
		save_append(args, o.cooldown);
        save_append(args, o.time_mark);
        save_append(args, o.beh);
        save_append(args, o.intro);
        save_append(args, o.touchable);
        save_append(args, o.hp);
        save_append(args, o.hpmax);
        save_append(args, o.bdmg);
        save_append(args, o.bdef);
        save_append(args, o.bpen);
        save_append(args, o.bkb);
        save_append(args, o.bkbres);
        save_append(args, o.pdef);
        save_append(args, o.pkbres);
        save_append(args, o.fdef);
        save_append(args, o.cdef);
        save_append(args, o.udef);
        save_append(args, o.fkbres);
        save_append(args, o.ckbres);
        save_append(args, o.ukbres);
        save_append(args, o.bar_extension);
        save_append(args, o.state);
        save_append(args, o.prev_bd);
		save_append(args, ds_map_write(o.loot));
	break;
	case obj_enemy_christmas_snowman: case obj_enemy_christmas_reindeer:
		save_append(args, o.cooldown);
        save_append(args, o.time_mark);
        save_append(args, o.beh);
        save_append(args, o.intro);
        save_append(args, o.touchable);
        save_append(args, o.hp);
        save_append(args, o.hpmax);
        save_append(args, o.bdmg);
        save_append(args, o.bdef);
        save_append(args, o.bpen);
        save_append(args, o.bkb);
        save_append(args, o.bkbres);
        save_append(args, o.pdmg);
        save_append(args, o.pdef);
        save_append(args, o.ppen);
        save_append(args, o.pkb);
        save_append(args, o.pkbres);
        save_append(args, o.fdef);
        save_append(args, o.cdef);
        save_append(args, o.udef);
        save_append(args, o.fkbres);
        save_append(args, o.ckbres);
        save_append(args, o.ukbres);
        save_append(args, o.bar_extension);
		save_append(args, ds_map_write(o.loot));
	break;
	case obj_enemy_christmas_gingerbread_man:
		save_append(args, o.cooldown);
        save_append(args, o.time_mark);
        save_append(args, o.beh);
        save_append(args, o.intro);
        save_append(args, o.touchable);
        save_append(args, o.hp);
        save_append(args, o.hpmax);
        save_append(args, o.bdmg);
        save_append(args, o.bdef);
        save_append(args, o.bpen);
        save_append(args, o.bkb);
        save_append(args, o.bkbres);
        save_append(args, o.pdmg);
        save_append(args, o.pdef);
        save_append(args, o.ppen);
        save_append(args, o.pkb);
        save_append(args, o.pkbres);
        save_append(args, o.fdef);
        save_append(args, o.cdef);
        save_append(args, o.udef);
        save_append(args, o.fkbres);
        save_append(args, o.ckbres);
        save_append(args, o.ukbres);
        save_append(args, o.bar_extension);
        save_append(args, o.state);
        save_append(args, o.superattack_cooldown);
        save_append(args, o.superattack_jittervalue);
        save_append(args, o.superattack_projectilecount);
        save_append(args, o.superattack_projectileshot);
        save_append(args, o.jitterx);
        save_append(args, o.jittery);
		save_append(args, ds_map_write(o.loot));
	break;
	case obj_eprojectile:
		save_append(args, o.spawn);
        save_append(args, o.f);
        save_append(args, o.acc);
        save_append(args, o.rot);
        save_append(args, o.pdmg);
        save_append(args, o.ppen);
        save_append(args, o.pkb);
        save_append(args, o.lifespan);
        save_append(args, o.e);
	break;
	case obj_oscillator:
		save_append(args, o.waveform[0, 0]);
        save_append(args, o.waveform[1, 0]);
        save_append(args, o.waveform[2, 0]);
        save_append(args, o.waveform[3, 0]);
        save_append(args, o.waveform[0, 1]);
        save_append(args, o.waveform[1, 1]);
        save_append(args, o.waveform[2, 1]);
        save_append(args, o.waveform[3, 1]);
        save_append(args, o.radius[0]);
        save_append(args, o.radius[1]);
        save_append(args, o.acceleration[0]);
        save_append(args, o.acceleration[1]);
        save_append(args, o.time[0]);
        save_append(args, o.time[1]);
        save_append(args, o.cycle[0]);
        save_append(args, o.cycle[1]);
        save_append(args, o.output[0]);
        save_append(args, o.output[1]);
        save_append(args, o.cyclecount[0]);
        save_append(args, o.cyclecount[1]);
        save_append(args, o.duration[0]);
        save_append(args, o.duration[1]);
	break;
	case obj_screenshake:
		save_append(args, o.h_value);
        save_append(args, o.h_value0);
        save_append(args, o.v_value);
        save_append(args, o.v_value0);
        save_append(args, o.rate);
        save_append(args, o.time);
        save_append(args, o.time_clock);
        save_append(args, o.decrease);
	break;
	case obj_present:
        save_append(args, o.f);
        save_append(args, o.wave_cycle);
        save_append(args, o.number);
        save_append(args, o.picked);
	break;
	case obj_ultimate_activation:
        save_append(args, o.size);
        save_append(args, o.stage);
        save_append(args, o.progress);
	break;
	case obj_evilflame_ultimate:
		save_append(args, o.player);
        save_append(args, o.hp);
        save_append(args, o.hpmax);
        save_append(args, o.hpmark);
        save_append(args, o.hpmark_v);
        save_append(args, o.inv);
        save_append(args, o.invtime);
        save_append(args, o.cb);
        save_append(args, o.charge);
        save_append(args, o.ctime);
        save_append(args, o.discharge);
        save_append(args, o.ccooldown);
        save_append(args, o.artcharge);
        save_append(args, o.color);
        save_append(args, o.shot);
        save_append(args, o.bar_opacity[0]);
        save_append(args, o.bar_opacity[1]);
        save_append(args, o.bar_opacity[2]);
        save_append(args, o.bar_yoffset[0]);
        save_append(args, o.bar_yoffset[1]);
        save_append(args, o.bar_yoffset[2]);
	break;
	case obj_emerald_ultimate:
		save_append(args, o.scale_v);
        save_append(args, o.scale_stage);
        save_append(args, o.rot);
        save_append(args, o.rot_cycle);
        save_append(args, o.spawn_clock);
        save_append(args, o.lifespan);
	break;
		case obj_emerald_ultimate_flow:
        save_append(args, o.scale_v);
        save_append(args, o.scale_stage);
        save_append(args, o.rot);
        save_append(args, o.size_growth);
        save_append(args, o.clock);
	break;
	case obj_emerald_ultimate_force:
		save_append(args, o.clock);
	break;
	case obj_bobileusz_ultimate:
		save_append(args, o.tx);
        save_append(args, o.ty);
        save_append(args, o.progress);
        save_append(args, o.goal);
        save_append(args, o.lifespan);
        save_append(args, o.lifespan_max);
        save_append(args, o.prev_angle);
        save_append(args, o.debuffs);
	break;
	case obj_debris:
		save_append(args, (o.split_sprite != -1)? global.save_sindex[? sprite_get_name(o.split_sprite)] : -1);
        save_append(args, o.split_sprite_index);
        save_append(args, o.split_sprite_xscale);
        save_append(args, o.split_sprite_yscale);
        save_append(args, o.split_sprite_color);
        save_append(args, o.split_sprite_alpha);
        save_append(args, o.split_angle);
        save_append(args, o.split_part);
        save_append(args, o.custom_sprite);
	break;
}

args[@ 0] += args[@ 1];