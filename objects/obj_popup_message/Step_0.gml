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

if (place_meeting(x, y, boss)) {
	if (mouse_check_button_pressed(mb_left)) { grabbed = true; }
	if (mouse_check_button_released(mb_left) && grabbed) { script_execute(script); } 
}

if (!mouse_check_button(mb_left)) { grabbed = false; }
image_index = grabbed;

#endregion