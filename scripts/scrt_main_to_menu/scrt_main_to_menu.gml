/// @description scrt_main_to_menu();

// unload everything
for (var i = 0; i < RLMCOUNT; i++) {
	audio_group_unload(global.realm_audiogroup[i + 1]);
}
for (var i = 0; i < CHRCOUNT; i++) {
	audio_group_unload(global.character_audiogroup[i]);
}

if (audio_group_load_progress(audiogroup_menu) == 0) {
	audio_group_load(audiogroup_menu);
}
	
progress -= (!audio_group_is_loaded(audiogroup_menu));