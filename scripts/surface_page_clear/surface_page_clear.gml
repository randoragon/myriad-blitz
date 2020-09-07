/// @description surface_page_clear(page)
function surface_page_clear() {

	// Frees all surfaces and clears all lists of a given page.

	var page = global.surface_pages[? argument[0]];
	var free = page[0];
	var sufs = page[1];

	for (var i = 0; i < ds_list_size(sufs); i++) {
		if (surface_exists(sufs[| i].id)) {
			surface_free(sufs[| i].id);
			delete sufs[| i];
		}
	}

	ds_list_clear(free);
	ds_list_clear(sufs);


}
