/// @description scrt_menu_to_main();

audio_group_unload(audiogroup_menu)

if (audio_group_load_progress(audiogroup_default_gameplay) == 0) {
	audio_group_load(audiogroup_default_gameplay);
}

var ag = global.realm_audiogroup[global.realm];
if (audio_group_load_progress(ag) == 0) {
	audio_group_load(ag);
}

texture_flush("Menu");
texture_prefetch("Standard Gameplay");
texture_prefetch(global.realm_name[global.realm]);
for (var i = 0; i < CHRCOUNT; i++) {
	texture_prefetch(global.name[i]);
}

// suspends the transition if the audio group hasn't loaded yet
progress -= (!audio_group_is_loaded(audiogroup_default_gameplay) || !audio_group_is_loaded(ag));