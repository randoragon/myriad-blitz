/// @description scr_LoadData(data)
/// @param data
function scr_LoadGlobals() {

	var args = argument[0], ver;

	args[@ 1] = string_readln(args);
	ver       = args[@ 1];
	global.chrsel = string_readln_real(args);
	global.points = string_readln_real(args);
	global.realm = string_readln_real(args);

	string_readln_real(args); // skip progress_max

	boss.lastpresent = string_readln_real(args);
	global.spawnrate = string_readln_real(args);
	global.gpspeed = string_readln_real(args);
	global.prev_gpspeed = string_readln_real(args);
	global.gpspeed_state = string_readln_real(args);
	global.gpspeed_focus = string_readln_real(args);
	global.gpspeed_ultimate_activation = string_readln_real(args);
	global.gpspeed_ultimate = string_readln_real(args);
	global.gpstep = string_readln_real(args);
	global.viewxstartpos = string_readln_real(args);
	global.viewystartpos = string_readln_real(args);
	args[@ 2] = string_readln_real(args);
	global.shader_conditions = string_readln_real(args);
	global.enemy_details_selection = string_readln_real(args);
	boss.last_ult = string_readln_real(args);
	global.kill_count = string_readln_real(args);
	boss.dizzy_alpha = string_readln_real(args);

	for (var i = 0; i < 8; i++) {
		var name = global.save_sname[? string_readln_real(args)];
		global.background_sprite[i] = (name == "none")? noone : asset_get_index(name);
		global.background_image_index[i] = string_readln_real(args);
		global.background_image_speed[i] = string_readln_real(args);
		global.background_x[i] = string_readln_real(args);
		global.background_y[i] = string_readln_real(args);
		global.background_htiled[i] = string_readln_real(args);
		global.background_vtiled[i] = string_readln_real(args);
		global.background_hspeed[i] = string_readln_real(args);
		global.background_hspeed[i] = string_readln_real(args);
	}

	// Update player variables
	if (version_ge(ver, "1.2.1")) {
		global.hp            = string_readln_real(args);
	    global.bdmg          = string_readln_real(args);
	    global.bdef          = string_readln_real(args);
	    global.bpen          = string_readln_real(args);
	    global.bkb           = string_readln_real(args);
	    global.bkbres        = string_readln_real(args);
	    global.acc           = string_readln_real(args);
	    global.counteracc    = string_readln_real(args);
	    global.spd           = string_readln_real(args);
	    global.invtime       = string_readln_real(args);
	    global.foctime       = string_readln_real(args);
	    global.pdmg          = string_readln_real(args);
	    global.pdef          = string_readln_real(args);
	    global.ppen          = string_readln_real(args);
	    global.pkb           = string_readln_real(args);
	    global.pkbres        = string_readln_real(args);
	    global.pspd          = string_readln_real(args);
	    global.sacc          = string_readln_real(args);
	    global.sspd          = string_readln_real(args);
	    global.fmin          = string_readln_real(args);
	    global.fmax          = string_readln_real(args);
	    global.fdmg          = string_readln_real(args);
	    global.fpen          = string_readln_real(args);
	    global.fkb           = string_readln_real(args);
	    global.cdmg          = string_readln_real(args);
	    global.cpen          = string_readln_real(args);
	    global.ckb           = string_readln_real(args);
	    global.ctime         = string_readln_real(args);
	    global.ccooldown     = string_readln_real(args);
	    global.ucooldown     = string_readln_real(args);
		global.gptime        = string_readln_real(args);
	} else {
		scr_PlayerDataUpdate(global.chrsel);
		global.gptime = 0;
	}

	// Update surface pages
	scr_UpdateSurfacePages();

	// Unload all audio groups
	for (var i = 0; i < CHRCOUNT; i++) {
		audio_group_unload(global.character_audiogroup[i]);
	}
	for (var i = 0; i < RLMCOUNT; i++) {
		audio_group_unload(global.realm_audiogroup[i]);
	}

	// Load needed audio groups
	ds_list_add(args[@ 3], audiogroup_default_gameplay);
	ds_list_add(args[@ 3], global.character_audiogroup[global.chrsel]);
	ds_list_add(args[@ 3], global.realm_audiogroup[global.realm]);
	audio_group_load(audiogroup_default_gameplay);
	audio_group_load(global.character_audiogroup[global.chrsel]);
	audio_group_load(global.realm_audiogroup[global.realm]);

	// Flush superfluous texture pages
	for (var i = 0; i < CHRCOUNT; i++) {
		if (i != global.chrsel)	{
			texture_flush(global.name[i]);
		}
	}
	for (var i = 0; i < RLMCOUNT; i++) {
		if (i != global.realm) {
			texture_flush(global.realm_name[i]);
		}
	}


}
