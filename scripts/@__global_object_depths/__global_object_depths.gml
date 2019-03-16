// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -99; // boss
global.__objectDepths[1] = 0; // obj_damage_indicators
global.__objectDepths[2] = 0; // obj_player_tparticles
global.__objectDepths[3] = 0; // obj_player_bparticles
global.__objectDepths[4] = 0; // obj_ultimate_particles
global.__objectDepths[5] = 0; // obj_charge_particles
global.__objectDepths[6] = 0; // obj_enemy_particles
global.__objectDepths[7] = 0; // obj_frag_particles
global.__objectDepths[8] = 0; // obj_player
global.__objectDepths[9] = 1; // obj_wrap_helper
global.__objectDepths[10] = -1; // obj_projectile
global.__objectDepths[11] = 5; // obj_frag
global.__objectDepths[12] = 3; // obj_charge
global.__objectDepths[13] = 0; // obj_evilflame_ultimate
global.__objectDepths[14] = 0; // obj_emerald_ultimate
global.__objectDepths[15] = 0; // obj_emerald_ultimate_flow
global.__objectDepths[16] = 0; // obj_emerald_ultimate_force
global.__objectDepths[17] = 0; // obj_enemy
global.__objectDepths[18] = 2; // obj_eprojectile
global.__objectDepths[19] = 0; // obj_oscillator
global.__objectDepths[20] = 0; // obj_screenshake
global.__objectDepths[21] = -9; // obj_transition
global.__objectDepths[22] = 0; // obj_ultimate_activation
global.__objectDepths[23] = 98; // obj_screenflash
global.__objectDepths[24] = 0; // obj_shockwave
global.__objectDepths[25] = 0; // obj_prev_imgspd
global.__objectDepths[26] = 0; // obj_save_group
global.__objectDepths[27] = 0; // obj_speeds_physics
global.__objectDepths[28] = 0; // obj_knockback_physics
global.__objectDepths[29] = 0; // obj_popup_group
global.__objectDepths[30] = 0; // obj_startup_loading
global.__objectDepths[31] = -90; // obj_slot_saving
global.__objectDepths[32] = -90; // obj_slot_loading
global.__objectDepths[33] = 0; // obj_button
global.__objectDepths[34] = 0; // obj_keyboard
global.__objectDepths[35] = 0; // obj_statboard
global.__objectDepths[36] = 0; // obj_lore
global.__objectDepths[37] = 0; // obj_sound_bar
global.__objectDepths[38] = 0; // obj_slot_name
global.__objectDepths[39] = 0; // obj_slot_load
global.__objectDepths[40] = 0; // obj_slot
global.__objectDepths[41] = 0; // obj_popup_question
global.__objectDepths[42] = 0; // obj_popup_message
global.__objectDepths[43] = 0; // obj_realm_button
global.__objectDepths[44] = 0; // obj_settings_checkbox
global.__objectDepths[45] = -10; // obj_lock
global.__objectDepths[46] = 0; // obj_changelog_board
global.__objectDepths[47] = 0; // obj_present
global.__objectDepths[48] = 0; // obj_ultimate_pickup
global.__objectDepths[49] = 0; // obj_explosion
global.__objectDepths[50] = -2; // obj_presentHD
global.__objectDepths[51] = 0; // obj_logo_M
global.__objectDepths[52] = 0; // obj_debris
global.__objectDepths[53] = 1; // obj_menu_board
global.__objectDepths[54] = 1; // obj_content_board
global.__objectDepths[55] = 0; // obj_randoragon_logo


global.__objectNames[0] = "boss";
global.__objectNames[1] = "obj_damage_indicators";
global.__objectNames[2] = "obj_player_tparticles";
global.__objectNames[3] = "obj_player_bparticles";
global.__objectNames[4] = "obj_ultimate_particles";
global.__objectNames[5] = "obj_charge_particles";
global.__objectNames[6] = "obj_enemy_particles";
global.__objectNames[7] = "obj_frag_particles";
global.__objectNames[8] = "obj_player";
global.__objectNames[9] = "obj_wrap_helper";
global.__objectNames[10] = "obj_projectile";
global.__objectNames[11] = "obj_frag";
global.__objectNames[12] = "obj_charge";
global.__objectNames[13] = "obj_evilflame_ultimate";
global.__objectNames[14] = "obj_emerald_ultimate";
global.__objectNames[15] = "obj_emerald_ultimate_flow";
global.__objectNames[16] = "obj_emerald_ultimate_force";
global.__objectNames[17] = "obj_enemy";
global.__objectNames[18] = "obj_eprojectile";
global.__objectNames[19] = "obj_oscillator";
global.__objectNames[20] = "obj_screenshake";
global.__objectNames[21] = "obj_transition";
global.__objectNames[22] = "obj_ultimate_activation";
global.__objectNames[23] = "obj_screenflash";
global.__objectNames[24] = "obj_shockwave";
global.__objectNames[25] = "obj_prev_imgspd";
global.__objectNames[26] = "obj_save_group";
global.__objectNames[27] = "obj_speeds_physics";
global.__objectNames[28] = "obj_knockback_physics";
global.__objectNames[29] = "obj_popup_group";
global.__objectNames[30] = "obj_startup_loading";
global.__objectNames[31] = "obj_slot_saving";
global.__objectNames[32] = "obj_slot_loading";
global.__objectNames[33] = "obj_button";
global.__objectNames[34] = "obj_keyboard";
global.__objectNames[35] = "obj_statboard";
global.__objectNames[36] = "obj_lore";
global.__objectNames[37] = "obj_sound_bar";
global.__objectNames[38] = "obj_slot_name";
global.__objectNames[39] = "obj_slot_load";
global.__objectNames[40] = "obj_slot";
global.__objectNames[41] = "obj_popup_question";
global.__objectNames[42] = "obj_popup_message";
global.__objectNames[43] = "obj_realm_button";
global.__objectNames[44] = "obj_settings_checkbox";
global.__objectNames[45] = "obj_lock";
global.__objectNames[46] = "obj_changelog_board";
global.__objectNames[47] = "obj_present";
global.__objectNames[48] = "obj_ultimate_pickup";
global.__objectNames[49] = "obj_explosion";
global.__objectNames[50] = "obj_presentHD";
global.__objectNames[51] = "obj_logo_M";
global.__objectNames[52] = "obj_debris";
global.__objectNames[53] = "obj_menu_board";
global.__objectNames[54] = "obj_content_board";
global.__objectNames[55] = "obj_randoragon_logo";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for