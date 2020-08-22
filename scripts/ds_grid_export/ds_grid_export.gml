/// @description ds_grid_export(grid, 'separator)
/// @param grid
/// @param 'separator
function ds_grid_export() {

	/* Converts a grid into a string.
	 * Separator must be a single character.
	 */

	var grid      = argument[0];
	var str       = "";
	var width     = ds_grid_width(grid);
	var height    = ds_grid_height(grid);
	var separator = (argument_count == 1 ? ";" : argument[1]);

	str += string(width) + separator + string(height) + separator;
	var data_type;
	for (var i = 0; i < height; i++) {
	    for (var j = 0; j < width; j++) {
	        data_type = is_string(grid[# j, i]) + (is_undefined(grid[# j, i]) << 1);
	        if (data_type == 2) { str += separator; continue; }
	        str += string(data_type) + string(grid[# j, i]) + separator;
	    }
	}

	return str;


}
