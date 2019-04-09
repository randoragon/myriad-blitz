/// @description scr_PlayerReset();

with (obj_player) {
	ds_grid_destroy(global.player_status_effects);     // this grid gets recreated in the player's create event so this line destroys the already existing grid to avoid doubles
	event_perform(ev_create, 0);
	xv						= 0;
	yv						= 0;
	shot					= 0;
	inv						= 0;
	focus_state				= 0;
	charge					= 0;
	discharge				= 0;
	artcharge				= FALSE;
	cb						= FALSE;
	ultcount				= 1;
	ultblink				= 0;
	flash_clock				= 0;
	spawn					= 0;
	hpmark_v				= 0;
	helper					= noone;
	bar_opacity[0]			= 0;
	bar_opacity[1]			= 0;
	bar_opacity[2]			= 0;
	bar_yoffset[0]			= 52;
	bar_yoffset[1]			= 44;
	bar_yoffset[2]			= 36;
	evilflame_sprite_swap	= FALSE;
	evilflame_twilight_fury = FALSE;
	afterimage_ds_grid		= - 1;
}