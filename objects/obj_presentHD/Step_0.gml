/// @description Opening

#region Opening

if (mouse_check_button_pressed(mb_left) && (place_meeting(x, y, boss) || open) && state == 2) {
	open = toggle(open);
	if (open) {
		busy++;
	} else {
		busy--;
	}
}

if (state == 1) { open = false; }
if ( open && alpha < 1) { alpha += 0.02; }
if (!open && alpha > 0) { alpha -= 0.02; }

#endregion