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

if (ds_exists(global.part_type_pro_grid[0], ds_type_grid)) { ds_grid_destroy(global.part_type_pro_grid[0]); }
if (ds_exists(global.part_type_pro_grid[1], ds_type_list)) { ds_list_destroy(global.part_type_pro_grid[1]); }
if (ds_exists(global.part_type_lt_grid[0],  ds_type_grid)) { ds_grid_destroy(global.part_type_lt_grid[0]);  }
if (ds_exists(global.part_type_lt_grid[1],  ds_type_list)) { ds_list_destroy(global.part_type_lt_grid[1]);  }
if (ds_exists(global.part_type_ult_grid[0], ds_type_grid)) { ds_grid_destroy(global.part_type_ult_grid[0]); }
if (ds_exists(global.part_type_ult_grid[1], ds_type_list)) { ds_list_destroy(global.part_type_ult_grid[1]); }
for (var i = 0; i < array_length_1d(global.part_system); i++) {
	if (ds_exists(global.part_system[i], ds_type_grid)) {
		ds_grid_destroy(global.part_system[i]);
	}
}
for (var i = 0; i < array_length_1d(global.charge_part); i++) {
	if (ds_exists(global.charge_part[i], ds_type_grid)) {
		ds_grid_destroy(global.charge_part[i]);
	}
}
for (var i = 0; i < array_length_1d(global.player_part); i++) {
	if (ds_exists(global.player_part[i], ds_type_grid)) {
		ds_grid_destroy(global.player_part[i]);
	}
}
for (var i = 0; i < array_length_1d(global.indicator_part); i++) {
	if (ds_exists(global.indicator_part[i], ds_type_grid)) {
		ds_grid_destroy(global.indicator_part[i]);
	}
}
for (var i = 0; i < array_length_1d(global.frag_part); i++) {
	if (ds_exists(global.frag_part[i], ds_type_grid)) {
		ds_grid_destroy(global.frag_part[i]);
	}
}
for (var i = 0; i < array_length_1d(global.ultimate_part); i++) {
	if (ds_exists(global.ultimate_part[i], ds_type_grid)) {
		ds_grid_destroy(global.ultimate_part[i]);
	}
}
for (var i = 0; i < array_length_1d(global.enemy_part); i++) {
	if (ds_exists(global.enemy_part[i], ds_type_grid)) {
		ds_grid_destroy(global.enemy_part[i]);
	}
}
if (ds_exists(global.disperse_part, ds_type_grid))		   { ds_grid_destroy(global.disperse_part);	}

if (ds_exists(global.player_status_effects, ds_type_grid)) { ds_grid_destroy(global.player_status_effects); }
if (ds_exists(global.object_layer, ds_type_map))		   { ds_map_destroy(global.object_layer);		    }
if (ds_exists(global.save_index, ds_type_map))			   { ds_map_destroy(global.save_index);				}
if (ds_exists(global.save_name, ds_type_map))			   { ds_map_destroy(global.save_name);				}

if (ds_exists(global.shd_sprite_effect_uni, ds_type_list))				{ ds_list_destroy(global.shd_sprite_effect_uni);			  }
if (ds_exists(global.shd_background_effect_uni, ds_type_list))			{ ds_list_destroy(global.shd_background_effect_uni);		  }
if (ds_exists(global.shd_application_surface_effect_uni, ds_type_list)) { ds_list_destroy(global.shd_application_surface_effect_uni); }
if (ds_exists(global.shd_shine_uni, ds_type_list))						{ ds_list_destroy(global.shd_shine_uni);					  }
if (ds_exists(global.shd_outline_uni, ds_type_list))					{ ds_list_destroy(global.shd_outline_uni);					  }