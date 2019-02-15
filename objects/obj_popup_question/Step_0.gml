/// @description UI

#region Inherit parent event

event_inherited();

#endregion

#region Growth

image_xscale += spd;
spd			 -= acc;
image_yscale  = image_xscale;
if (spd < 0 && image_xscale + spd <= 1) {
	image_scale(1, 1);
	spd = 0;
	acc = 0;
}

#endregion

#region Button clicking

if (boss.x >= x - 214 && boss.x <= x - 33 && boss.y >= y + 54 && boss.y <= y + 99) {
	if (mouse_check_button_pressed(mb_left)) { grabbed = 1; }
	if (mouse_check_button_released(mb_left) && grabbed == 1) { script_execute(script[1]); }
}

if (boss.x >= x + 25 && boss.x <= x + 206 && boss.y >= y + 54 && boss.y <= y + 99) {
	if (mouse_check_button_pressed(mb_left)) { grabbed = 2; }
	if (mouse_check_button_released(mb_left) && grabbed == 2) { script_execute(script[0]); }
}

if (!mouse_check_button(mb_left)) { grabbed = 0; }
image_index = grabbed;

#endregion