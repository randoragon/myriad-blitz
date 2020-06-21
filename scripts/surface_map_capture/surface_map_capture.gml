/// @description surface_map_capture(size)
/// @param size

var size = argument[0];

// Find suitable surface that isn't being used
for (var i = 0; i < ds_list_size(global.surface_map_free); i++) {
	if (global.surface_map_free[| i] && surface_get_width(global.surface_maps[| i]) >= size) {
		global.surface_map_free[| i] = FALSE;
		return global.surface_maps[| i];
	}
}

// If no available, allocate more memory
ds_list_add(global.surface_maps, surface_create(size, size));
ds_list_add(global.surface_map_free, FALSE);
return global.surface_maps[| ds_list_size(global.surface_maps) - 1];