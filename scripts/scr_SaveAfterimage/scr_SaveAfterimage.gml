/// @description scr_SaveAfterimage(args)
/// @param args

var args = argument[0];
var o = args[2];

save_append(args, SAVE_DATA_AFTERIMAGE);
save_append(args, o);

switch(o.object_index) {
	case obj_debris:
		/* debris's afterimage grid needs additional tinkering prior to saving
		 * due to the possibility of existence of temporary sprites created from surfaces
		 * which possess sprite indices that are not mapped globally in global.save_sindex
		 * and global.save_sname variables.
		 */
		 
		// Convert normal sprites into global indices
		var afterimage2 = ds_grid_create(0, 0);
		ds_grid_copy(afterimage2, o.afterimage_ds_grid);
		if (o.custom_sprite != 2) {
			for (var fi = 1; fi < ds_grid_width(afterimage2); fi++) {
				afterimage2[# fi, 0] = global.save_sindex[? sprite_get_name(afterimage2[# fi, 0])];
			}
		} else {
			/* Erase any sprite indice information, as it will be recreated during loading
				* from the information stored in other instance variables.
				* Setting cells to "1" follows the afterimage_grid convention of storing all data
				* as strings, with real numbers beginning with a "0", and strings beginning with "1",
				* so setting all values to "1" is equivalent to setting everything to an empty string.
				* (The very first cell, [0,0], is used for something else, so it can't be erased)
				*/
			ds_grid_set_region(afterimage2, 1, 0, ds_grid_width(afterimage2) - 1, 0, "1");
		}
		args[@ 0] += ds_grid_export(afterimage2);
		ds_grid_destroy(afterimage2);
	break;
	default:
		// Convert sprites into global indices
		var afterimage2 = ds_grid_create(0, 0);
		ds_grid_copy(afterimage2, o.afterimage_ds_grid);
		for (var fi = 1; fi < ds_grid_width(afterimage2); fi++) {
			afterimage2[# fi, 0] = global.save_sindex[? sprite_get_name(afterimage2[# fi, 0])];
		}
		args[@ 0] += ds_grid_export(afterimage2);
		ds_grid_destroy(afterimage2);
	break;
}

args[@ 0] += args[@ 1];