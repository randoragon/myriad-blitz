/// @description Hiding

#region Hiding

y = ystart + (350 * global.transition);

#endregion

#region Destroy oscillators when hidden

if (y == ystart + 350 && osc != -1) {
	wipe(osc);
	osc = -1;
	if (global.state == 1) { instance_destroy(); }
}

if (y < ystart + 350 && !instance_exists(osc)) {
	osc = fx_wave(3, 4, -3, -4, 1, 30, 0, -1, 3, 4, -3, -4, 3, 45, 0, -1);
}

#endregion

#region Scroll grab

if (place_meeting(x, y, boss) && is_undefined(grab_scroll) && mouse_check_button_pressed(mb_left)) {
	grab_scroll  = scroll;
	grab_mouse_y = boss.y;
} else if (!is_undefined(grab_scroll) && !mouse_check_button(mb_left)) {
	scrollv     = (boss.y - boss.yprevious);
	grab_scroll  = undefined;
	grab_mouse_y = undefined;
}

#endregion