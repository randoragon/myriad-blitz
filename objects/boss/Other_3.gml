/// @description Auto Save, Wipe, Cleanup

ini_open(working_directory+"\\userconfig.mbdat");
ini_write_real("settings", "fullscreen",			   global.fullscreen);
ini_write_real("settings", "screenshake",			   global.screenshake);
ini_write_real("settings", "music",					   global.muspercentage);
ini_write_real("settings", "sfx",					   global.sfxpercentage);
ini_write_real("settings", "save_chunk_size",		   global.save_chunk_size);
ini_write_real("settings", "save_particles",		   global.save_particles);
ini_write_real("settings", "left_handed_mode",		   global.left_handed_mode);
ini_write_real("settings", "enemy_selection_auto_aim", global.enemy_details_selection_auto_aim);
ini_close();

wipe(all);
global.close_game = TRUE;

if (ds_exists(global.part_type_pro_slots, ds_type_list)) { ds_list_destroy(global.part_type_pro_slots); }
if (ds_exists(global.part_type_lt_slots,  ds_type_list)) { ds_list_destroy(global.part_type_lt_slots);  }
if (ds_exists(global.part_type_ult_slots, ds_type_list)) { ds_list_destroy(global.part_type_ult_slots); }
for (var i = 0; i < array_length_1d(global.part_system); i++) {
	if (ds_exists(global.part_system[i], ds_type_grid)) {
		ds_grid_destroy(global.part_system[i]);
	}
}
for (var i = 0; i < array_length_1d(global.part_type); i++) {
	if (ds_exists(global.part_type[i], ds_type_list)) {
		ds_list_destroy(global.part_type[i]);
	}
}

if (ds_exists(global.player_status_effects, ds_type_grid)) { ds_grid_destroy(global.player_status_effects); }
if (ds_exists(global.object_layer, ds_type_map))		   { ds_map_destroy(global.object_layer);		    }
if (ds_exists(global.save_oindex, ds_type_map))			   { ds_map_destroy(global.save_oindex);				}
if (ds_exists(global.save_oname, ds_type_map))			   { ds_map_destroy(global.save_oname);				}

if (ds_exists(global.shd_sprite_effect_uni, ds_type_list))				{ ds_list_destroy(global.shd_sprite_effect_uni);			  }
if (ds_exists(global.shd_background_effect_uni, ds_type_list))			{ ds_list_destroy(global.shd_background_effect_uni);		  }
if (ds_exists(global.shd_application_surface_effect_uni, ds_type_list)) { ds_list_destroy(global.shd_application_surface_effect_uni); }
if (ds_exists(global.shd_shine_uni, ds_type_list))						{ ds_list_destroy(global.shd_shine_uni);					  }
if (ds_exists(global.shd_outline_uni, ds_type_list))					{ ds_list_destroy(global.shd_outline_uni);					  }