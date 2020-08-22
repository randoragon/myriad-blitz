/// @description scr_SaveStatusEffects(args)
/// @param args
function scr_SaveStatusEffects() {

	var args = argument[0];

	save_append(args, SAVE_DATA_STATUS_EFFECTS);

	args[@ 0] += ds_grid_export(global.player_status_effects);

	args[@ 0] += args[@ 1];


}
