/// @description scrm_abort_loading();
function scrm_abort_loading() {

	with(obj_slot_loading) {
		file_text_close(file);
		phase = 2;
	}

	// This block is extracted from scr_Restart
	global.gpspeed_state               = 1;
	global.gpspeed_focus               = 1;
	global.gpspeed_ultimate_activation = 1;
	global.gpspeed_ultimate            = 1;
	global.state                       = 0;
	global.spawnrate                   = 10;
	global.gptime                      = 0;
	global.gpstep                      = 1;
	boss.lastpresent                   = 0;
	global.transition                  = 1;
	boss.last_ult                      = 0;
	boss.dizzy_alpha                   = 0;
	global.kill_count                  = 0;
	with (all) {
		if (object_index != obj_player && object_is_ancestor(object_index, obj_save_group)) {
		    instance_destroy();
		}
	}
	wipe(obj_keyboard);
	wipe(obj_lore);
	wipe(obj_statboard);
	part_system_clear_lt (PART_SYSTEM_PLAYERBOT_LT);
	part_system_clear_pro(PART_SYSTEM_DAMAGE_INDICATORS_PRO);
	part_system_clear_ult(PART_SYSTEM_FRAG_ULT);
	part_system_clear_ult(PART_SYSTEM_CHARGE_ULT);
	part_system_clear_lt (PART_SYSTEM_ENEMY_LT);
	part_system_clear_lt (PART_SYSTEM_PLAYERTOP_LT);
	part_system_clear_lt (PART_SYSTEM_ULTIMATE_LT);
	part_system_clear_lt (PART_SYSTEM_MINION_LT);
	boss.menu_intro = FALSE;

	// Some random variables that need to be fixed
	global.loading = FALSE;
	global.state = 0;
	global.transition = 0;
	global.shader_conditions = 0;

	screen_transition(rm_Realms, scrt_main_to_menu, 1, 0, c_black);

	instance_destroy();


}
