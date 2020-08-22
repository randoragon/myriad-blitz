/// @description surface_page_create(name)
/// @param name
function surface_page_create() {

	// Creates a new surface page which can store an arbitrary number
	// of surfaces of varying sizes.

	var name = argument[0]
	if (!ds_map_exists(global.surface_pages, name)) {
		var val = array_setup(-1, 2);
		val[0] = ds_list_create();
		val[1] = ds_list_create();
		ds_map_add(global.surface_pages, name, val);
	}


}
