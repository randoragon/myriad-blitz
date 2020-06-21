/// @description surface_map_release(index)
/// @param index

for (var i = 0; i < ds_list_size(global.surface_maps); i++) {
	if (global.surface_maps[| i] == argument[0]) {
		global.surface_map_free[| i] = TRUE;
	}
}