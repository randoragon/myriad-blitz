/// @description surface_pool_capture(page, size)
/// @param page
/// @param size
function surface_page_capture() {

	// Targets a surface page and finds a free surface that can be used.
	// If no surface is available, append a new one.
	// Returns surface ID.

	var page = global.surface_pages[? argument[0]];
	var free = page[0];
	var sufs = page[1];
	var size = argument[1];

	// Find suitable surface that isn't being used
	for (var i = 0; i < ds_list_size(free); i++) {
		if (free[| i] && surface_get_width(sufs[| i]) >= size) {
			free[| i] = FALSE;
			return sufs[| i];
		}
	}

	// If no available, allocate more memory
	ds_list_add(sufs, surface_create(size, size));
	ds_list_add(free, FALSE);
	return sufs[| ds_list_size(sufs) - 1];


}
