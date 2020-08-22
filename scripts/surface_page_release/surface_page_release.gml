/// @description surface_page_release(page, surface)
/// @param page
/// @param surface
function surface_page_release() {

	// Marks a previously captured surface on a specific page as unused.

	var page = global.surface_pages[? argument[0]];
	var free = page[0];
	var sufs = page[1];

	for (var i = 0; i < ds_list_size(sufs); i++) {
		if (sufs[| i] == argument[0]) {
			free[| i] = TRUE;
		}
	}


}
