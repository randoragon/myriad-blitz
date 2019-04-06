/// @description scrt_main_to_menu();

// unload everything
audio_group_unload(audiogroup_default_gameplay);
audio_group_unload(audiogroup_realm_christmas);
audio_group_unload(audiogroup_character_evilflame);
audio_group_unload(audiogroup_character_emerald);
audio_group_unload(audiogroup_character_scootomik);

if (audio_group_load_progress(audiogroup_menu) == 0) {
	audio_group_load(audiogroup_menu);
}
	
progress -= (!audio_group_is_loaded(audiogroup_menu));