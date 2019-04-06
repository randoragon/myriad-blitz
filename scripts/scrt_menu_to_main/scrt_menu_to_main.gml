/// @description scrt_menu_to_main();

audio_group_unload(audiogroup_menu)

if (audio_group_load_progress(audiogroup_default_gameplay) == 0) {
	audio_group_load(audiogroup_default_gameplay);
}

var ag;
switch(global.realm) {
	case 1: ag = audiogroup_realm_christmas; break;
}

if (audio_group_load_progress(ag) == 0) {
	audio_group_load(ag);
}
	
progress -= (!audio_group_is_loaded(audiogroup_default_gameplay) || !audio_group_is_loaded(ag));