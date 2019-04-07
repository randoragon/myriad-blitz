/// @description scr_PlayerUpdateAudioGroup()

// unload all
for (var i = 0; i < CHRCOUNT; i++) {
	audio_group_unload(global.character_audiogroup[i]);
}

// load current
audio_group_load(global.character_audiogroup[global.chrsel]);