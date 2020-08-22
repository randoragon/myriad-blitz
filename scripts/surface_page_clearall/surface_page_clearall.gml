/// @description surface_page_clearall()
function surface_page_clearall() {

	// Like surface_page_clear, except it destroys all pages.


	var name = ds_map_find_first(global.surface_pages);

	for (var i = 0; i < ds_map_size(global.surface_pages); i++) {
		surface_page_clear(name);
		name = ds_map_find_next(global.surface_pages, name);
	}


}
