/// @description scr_LoadStatusEffects(data)
/// @param data

var args = argument[0];

var type = string_readln(args);

switch(type) {
	case "pro":
		global.part_type_pro_slots = ds_grid_create(0, 0);
		global.part_type_pro_slots = ds_grid_import(global.part_type_pro_slots, args[0]);
	break;
	case "lt":
		global.part_type_lt_slots = ds_grid_create(0, 0);
		global.part_type_lt_slots = ds_grid_import(global.part_type_lt_slots, args[0]);
	break;
	case "ult":
		global.part_type_ult_slots = ds_grid_create(0, 0);
		global.part_type_ult_slots = ds_grid_import(global.part_type_ult_slots, args[0]);
	break;
	default:
		show_debug_message("WARNING: No part slots type found for string \"" + type + "\"!");
	break;
}
