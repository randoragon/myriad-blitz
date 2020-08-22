/// @description surface_page_allocate(page, size, count)
/// @param page
/// @param size
/// @param count
function surface_page_allocate() {

	// Appends some number of free to use surfaces of a selected size to a surface page.
	// Returns the first allocated surface's index in the page's list.

	var page = global.surface_pages[? argument[0]];
	var size = argument[1];
	var index = ds_list_size(page[1]);

	repeat(argument[1]) {
		ds_list_add(page[1], surface_create(size, size));
		ds_list_add(page[0], TRUE);
	}

	return index;


}
