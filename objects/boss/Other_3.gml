/// @description Auto Save & Wipe
ini_open(working_directory+"\\userconfig.mbdat");
ini_write_real("settings","fullscreen",global.fullscreen);
ini_write_real("settings","screenshake",global.screenshake);
ini_write_real("settings","music",global.muspercentage);
ini_write_real("settings","sfx",global.sfxpercentage);
ini_write_real("settings","save_chunk_size",global.save_chunk_size);
ini_write_real("settings","save_particles",global.save_particles);
ini_write_real("settings","left_handed_mode",global.left_handed_mode);
ini_write_real("settings","enemy_selection_auto_aim",global.enemy_details_selection_auto_aim);
ini_close();
wipe(all);

