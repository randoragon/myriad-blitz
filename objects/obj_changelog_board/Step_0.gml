/// @description Scroll with mouse cursor

#region Scroll grab

if (place_meeting(x, y, boss) && is_undefined(grab_scroll) && mouse_check_button_pressed(mb_left)) {
	grab_scroll  = scroll;
	grab_mouse_y = boss.y;
} else if (!is_undefined(grab_scroll) && !mouse_check_button(mb_left)) {
	scrollv     = (boss.y - grab_mouse_y) / 6;
	grab_scroll  = undefined;
	grab_mouse_y = undefined;
}

#endregion