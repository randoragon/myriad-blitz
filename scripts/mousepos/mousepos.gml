/// @description mousepos(x_or_y, view)
/// @param x_or_y
/// @param view

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
		o = __view_get( e__VW.XView, argument[1]) + ((display_mouse_get_x() - window_get_x()) * (__view_get( e__VW.WView, argument[1] ) / window_get_width()));
	} else {
		if (argument[0]) {
			o = __view_get( e__VW.YView, argument[1] ) + ((display_mouse_get_y() - window_get_y()) * (__view_get( e__VW.HView, argument[1] ) / window_get_height()));
		}
	}
}

return o;

