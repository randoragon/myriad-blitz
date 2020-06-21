/// @description surface_map_allocate(size, count)
/// @param size
/// @param count

var index = ds_list_size(global.surface_maps);

repeat(argument[1]) {
	ds_list_add(global.surface_maps, surface_create(argument[0], argument[0]));
	ds_list_add(global.surface_map_free, TRUE);
}

return index;