/// @description surface_pool_capture(page, size)
/// @param page
/// @param size
function surface_page_capture() {

	// Targets a surface page and finds a free surface that can be used.
	// If no surface is available, append a new one.
	// Returns ds_list index that can be used to retrieve the surface ID.

	var page = global.surface_pages[? argument[0]];
	var free = page[0];
	var sufs = page[1];
	var size = argument[1];

	// Find suitable surface that isn't being used
	for (var i = 0; i < ds_list_size(free); i++) {
		if (free[| i] && sufs[| i].size >= size) {
			free[| i] = FALSE;
			return i;
		}
	}

	// If no available, allocate more memory
	var struct = {
		id:   surface_create(size, size),
		size: size
	};
	ds_list_add(sufs, struct);
	ds_list_add(free, FALSE);
	return ds_list_size(sufs) - 1;


}
