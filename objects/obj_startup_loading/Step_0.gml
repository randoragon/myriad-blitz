/// @description Load Audio Groups

#region Load audio groups

if (stage != 0 && stage <= array_length_1d(audiogroups) * 2) {
	var all_loaded = bool(stage % 2 == 1);
	var i = 0;
	for (; i < array_length_1d(audiogroups); i++) {
		if (!audio_group_is_loaded(audiogroups[i])) {
			all_loaded = FALSE;
			break;
		}
	}
	i = min(i, array_length_1d(audiogroups) - 1);
	
	if (!all_loaded && stage % 2 == 1) {
		audio_group_load(audiogroups[i]);
		stage += 1;
	} else if (!all_loaded && stage % 2 == 0 && audio_group_is_loaded(audiogroups[i])) {
		stage += 1;
	} else if (all_loaded) {
		stage = (array_length_1d(audiogroups) * 2) + 1;
	}
}

if (audio_group_is_loaded(audiogroup_menu) && !audio_is_playing(mus_menu_intro) && !audio_is_playing(mus_menu_loop)) {
	play_music(mus_menu_intro, sound_priority.music, 0);
	boss.menu_intro = TRUE;
}


#endregion

#region Cycle

cycle = (cycle + 7) % 360;

#endregion