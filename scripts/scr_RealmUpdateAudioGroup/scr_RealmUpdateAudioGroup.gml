/// @description scr_RealmUpdateAudioGroup()
function scr_RealmUpdateAudioGroup() {

	// unload all
	for (var i = 0; i < RLMCOUNT; i++) {
		audio_group_unload(global.realm_audiogroup[i]);
	}

	// load current
	audio_group_load(global.realm_audiogroup[global.realm]);


}
