/// @description surface_map_clear()

for (var i = 0; i < ds_list_size(global.surface_maps); i++) {
	if (surface_exists(global.surface_maps[| i])) {
		surface_free(global.surface_maps[| i]);
	}
}

ds_list_clear(global.surface_maps);
ds_list_clear(global.surface_map_free);