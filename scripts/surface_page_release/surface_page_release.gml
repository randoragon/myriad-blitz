/// @description surface_page_release(page, index)
/// @param page
/// @param surface
function surface_page_release() {

	// Marks a previously captured surface on a specific page as unused.

	var page = global.surface_pages[? argument[0]];
	var free = page[0];
	free[| argument[1]] = TRUE;


}
