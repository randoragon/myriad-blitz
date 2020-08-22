/// @description mousepos(x_or_y, view)
/// @param x_or_y
/// @param view
function mousepos() {

	var o;

	if (argument_count == 1) {
		if (!argument[0]) {
			o = ((display_mouse_get_x() - window_get_x()) * (room_width / window_get_width()));
		} else {
			if (argument[0]) {
				o = ((display_mouse_get_y() - window_get_y()) * (room_height / window_get_height()));
			}
		}
	} else {
		if (!argument[0]) {
			o = camera_get_view_x(view_get_camera(argument[1])) + ((display_mouse_get_x() - window_get_x()) * (camera_get_view_width(view_get_camera(argument[1])) / window_get_width()));
		} else {
			if (argument[0]) {
				o = camera_get_view_y(view_get_camera(argument[1])) + ((display_mouse_get_y() - window_get_y()) * (camera_get_view_height(view_get_camera(argument[1])) / window_get_height()));
			}
		}
	}

	return o;




}
