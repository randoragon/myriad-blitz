/// @description scr_LoadStatusEffects(data)
/// @param data
function scr_LoadParticleSystem() {

	var args = argument[0];

	if (!global.save_particles) {
		exit;
	}

	var index = string_readln_real(args);

	global.part_system[index] = ds_grid_create(0, 0);
	global.part_system[index] = ds_grid_import(global.part_system[index], args[0]);



}
