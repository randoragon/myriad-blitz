/// @description scrt_menu_to_main();

audio_group_unload(audiogroup_menu)

if (audio_group_load_progress(audiogroup_default_gameplay) == 0) {
	audio_group_load(audiogroup_default_gameplay);
}

var ag = global.realm_audiogroup[global.realm];
if (audio_group_load_progress(ag) == 0) {
	audio_group_load(ag);
}

// suspends the transition if the audio group hasn't loaded yet
progress -= (!audio_group_is_loaded(audiogroup_default_gameplay) || !audio_group_is_loaded(ag));