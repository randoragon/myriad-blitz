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

texture_flush("Standard Gameplay");
texture_flush(global.realm_name[global.realm]);
for (var i = 0; i < CHRCOUNT; i++) {
	texture_flush(global.name[i]);
}
texture_prefetch("Menu");

if (!audio_group_is_loaded(audiogroup_menu)) {
	progress -= 1;
} else {
	play_music(mus_menu_intro, sound_priority.music, 0);
	boss.menu_intro = TRUE;
}