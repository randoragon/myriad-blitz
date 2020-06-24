/// @description scr_SaveParticleSlots(args)
/// @param args

var args = argument[0];

if (!global.save_particles || !ds_exists(args[@ 2], ds_type_grid)) {
	exit;
}

save_append(args, SAVE_DATA_PART_SLOTS);

switch(args[@ 2]) {
	case global.part_type_pro_slots:
		save_append(args, "pro");
	break;
	case global.part_type_lt_slots:
		save_append(args, "lt");
	break;
	case global.part_type_ult_slots:
		save_append(args, "ult");
	break;
	default:
		show_debug_message("WARNING: Unknown particle slots type, skipping.");
		save_append(args, "err");
	break;
}

args[@ 0] += ds_grid_export(args[@ 2]);

args[@ 0] += args[@ 1];