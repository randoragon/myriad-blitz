/// @description scr_PlayerUpdateAudioGroup()

// unload all
audio_group_unload(audiogroup_character_evilflame);
audio_group_unload(audiogroup_character_emerald);
audio_group_unload(audiogroup_character_scootomik);

// load current
switch(global.chrsel) {
	case 0: audio_group_load(audiogroup_character_evilflame); break;
	case 1: audio_group_load(audiogroup_character_emerald);   break;
	case 2: audio_group_load(audiogroup_character_scootomik); break;
}