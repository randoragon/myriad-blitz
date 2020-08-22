/// @description surface_page_index(page, index)
/// @param page
/// @param index
function surface_page_index() {

	// Returns a surface ID from a list index of a selected surface page.
	// This is just a wrapper, because having to tear down structures layer
	// by layer is annoying.

	var page = global.surface_pages[? argument[0]];
	var sufs = page[1];
	return sufs[| argument[1]];


}
