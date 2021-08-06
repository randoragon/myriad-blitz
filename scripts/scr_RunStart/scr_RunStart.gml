function scr_RunStart(){
	
	// This script is called when a round starts, i.e. when a character
	// gets selected to be played.
	scr_toggle_stats_selection(0);
	scr_UpdateSurfacePages();
	play_sfx(sfx_run_start, 0);
	play_music(mus_rlm_christmas + global.realm - 1, 1);
	global.state = 1;
	global.points = 0;
	mouse_clear(mb_left);
	mouse_clear(mb_right);
	keyboard_clear(KEYBIND_SHOOT);
	keyboard_clear(KEYBIND_FOCUS);
	keyboard_clear(KEYBIND_UP);
	keyboard_clear(KEYBIND_LEFT);
	keyboard_clear(KEYBIND_DOWN);
	keyboard_clear(KEYBIND_RIGHT);
	keyboard_clear(KEYBIND_CHARGE);
	keyboard_clear(KEYBIND_PAUSE);
	randomize();
	
	if (global.chrsel == PLAYER_BOBILEUSZ) {
		player_status_add(STATUS_EFFECT_GEAR5, -2, 0);
		spawn_minion(500, 500, MINION_BOBILEUSZ_BOTTLE, 0, instance_find(obj_player, 0));
	}
}