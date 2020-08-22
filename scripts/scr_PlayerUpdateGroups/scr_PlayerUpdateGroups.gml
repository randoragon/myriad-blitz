/// @description scr_PlayerUpdateGroups()
function scr_PlayerUpdateGroups() {

	// unload all
	for (var i = 0; i < CHRCOUNT; i++) {
		audio_group_unload(global.character_audiogroup[i]);
	}

	for (var i = 0; i < CHRCOUNT; i++) {
		if (i != global.chrsel)	{ texture_flush(global.name[i]); }
	}

	// load current
	audio_group_load(global.character_audiogroup[global.chrsel]);


}
