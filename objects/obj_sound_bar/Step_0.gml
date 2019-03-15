/// @description Dot Interaction

#region Dot interaction

if (global.busy == 0) {
	if (grabbed == 1) {
		val = (clamp(boss.x, x - 169, x + 169) - x + 169) * 100 / 338;
		switch(f) {
			case 0: global.muspercentage = val; break;
			case 1: global.sfxpercentage = val; break;
		}
	}

	xdot = x - 169 + (val * 338 / 100);
	ydot = y + 11 - (13 * abs((val * 338 / 100) - 169) / 169);

	if (place_meeting(x, y, boss) && mouse_check_button_pressed(mb_left)) { grabbed = 1; }

	if (mouse_check_button_released(mb_left) && grabbed == 1) {
		grabbed = 0;
		if (!f) {
			play_music(sfx_button4, sound_priority.music, 0, 100);
		} else {
			play_sfx(sfx_button4, 0, 0, 100);
		}
	}
}

#endregion