/// @description scr_LoadData(data)
/// @param data
function scr_LoadAfterimage() {

	var args = argument[0];

	// Read former instance id
	var oldid, newid, obj;
	var oldid = string_readln_real(args);

	/* When instances are saved, only their object indices are saved in the slot,
	 * because instance IDs by themselves don't carry the information about the object.
	 * However, in the case of afterimages, we need the actual instance id, because
	 * we must be modifying the correct instance after it's been created, and we don't
	 * have the luxury of running this code during the new instance's creation (in scr_LoadInstance).
	 * For that reason, when afterimage data is saved, it actually saves the old instance
	 * id, and because this code is guaranteed to run after the new instance has been created,
	 * we can simply search all instance by their "previd" variable and find our match.
	 * We search from the back of the array, because the one we're looking for has likely
	 * just been instantiated.
	 */
	newid = -1;
	for (var i = instance_count-1; i >= 0; i--) {
		var instance = instance_id_get(i);
		if (variable_instance_exists(instance, "previd") && instance.previd == oldid) {
			newid = instance;
			obj = newid.object_index;
			break;
		}
	}
	if (newid == -1) {
		show_debug_message("WARNING: afterimage failed to find its host, previd = " + string(oldid) + "!");
		exit;
	}

	// Load afterimage grid
	switch(obj) {
		case obj_debris:
			newid.afterimage_ds_grid = ds_grid_create(0, 0);
			newid.afterimage_ds_grid = ds_grid_import(newid.afterimage_ds_grid, args[0]);
		
			// If debris had unusual sprites, that means they got recreated during loading,
			// so now is the time to assign them to the afterimage grid
			if (newid.custom_sprite == 2) {
				with(instance) {
					draw_afterimage_set_sprite(sprite_index, 0);
				}
			} else {
				// If it has normal sprites, just convert it as usual
				for (var i = 1; i < ds_grid_width(newid.afterimage_ds_grid); i++) {
					newid.afterimage_ds_grid[# i, 0] = asset_get_index(global.save_sname[? newid.afterimage_ds_grid[# i, 0]]);
				}
			}
		break;
		default:
			newid.afterimage_ds_grid = ds_grid_create(0, 0);
			newid.afterimage_ds_grid = ds_grid_import(newid.afterimage_ds_grid, args[0]);
			
			// Convert sindices back into normal sprites
			for (var i = 1; i < ds_grid_width(newid.afterimage_ds_grid); i++) {
				newid.afterimage_ds_grid[# i, 0] = asset_get_index(global.save_sname[? newid.afterimage_ds_grid[# i, 0]]);
			}
		break;
	}


}
