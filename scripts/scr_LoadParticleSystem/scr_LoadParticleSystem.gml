/// @description scr_LoadStatusEffects(data)
/// @param data

var args = argument[0];

var index = string_readln_real(args);

global.part_system[index] = ds_grid_create(0, 0);
global.part_system[index] = ds_grid_import(global.part_system[index], args[0]);
