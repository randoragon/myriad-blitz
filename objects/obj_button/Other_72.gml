/// @description Start run

if (async_load != -1 && async_load[? "type"] == "audiogroup_load" && async_load[? "group_id"] == global.character_audiogroup[global.chrsel] && !global.loading && global.state == 0) {
	scr_toggle_stats_selection(0);
	scr_UpdateSurfacePages();
	play_sfx(sfx_run_start, 0, 0);
	play_music(mus_rlm_christmas + global.realm - 1, sound_priority.music, 1);
	global.state = 1;
	global.points = 0;
	mouse_clear(mb_left);
	mouse_clear(mb_right);
	keyboard_clear(vk_space);
	keyboard_clear(vk_shift);
	keyboard_clear(ord("W"));
	keyboard_clear(ord("A"));
	keyboard_clear(ord("S"));
	keyboard_clear(ord("D"));
	randomize();
	
	if (global.chrsel == PLAYER_BOBILEUSZ) {
		player_status_add(STATUS_EFFECT_GEAR5, -2, 0);
		spawn_minion(500, 500, MINION_BOBILEUSZ_BOTTLE, 0, obj_player);
	}
}