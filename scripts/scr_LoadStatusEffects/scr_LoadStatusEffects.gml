/// @description scr_LoadStatusEffects(data)
/// @param data
function scr_LoadStatusEffects() {

	var args = argument[0];

	global.player_status_effects = ds_grid_create(0, 0);
	global.player_status_effects = ds_grid_import(global.player_status_effects, args[0]);



}
