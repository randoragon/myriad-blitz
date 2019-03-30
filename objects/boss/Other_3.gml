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

if (ds_exists(global.player_status_effects, ds_type_grid)) { ds_grid_destroy(global.player_status_effects); }
if (ds_exists(global.object_layer, ds_type_map))		   { ds_map_destroy(global.object_layer);		    }
if (ds_exists(global.save_index, ds_type_map))			   { ds_map_destroy(global.save_index);				}
if (ds_exists(global.save_name, ds_type_map))			   { ds_map_destroy(global.save_name);				}

surface_reset_target();