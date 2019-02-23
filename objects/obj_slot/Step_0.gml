/// @description Behavior

#region Lock depending on busy state

if (obj_slot_load.start_busy != busy) { exit; }

#endregion

#region Appear & disappear

if (phase == 0) {
	image_scale(home(image_xscale, 1, 0.1, 0), image_xscale);
	if (image_xscale == 1) { phase = 1; }
}
if (phase == 2) {
	if (image_xscale > 0) { image_scale(home(image_xscale, 0, 0.1, 0), image_xscale);
	} else {
		instance_destroy();
	}
}

if (phase == 1) {
	if (grabbed) {
		image_scale(home(image_xscale, 0.8, 0.04, 0), image_xscale);
	} else {
		image_scale(home(image_xscale, 1, 0.05, 0), image_xscale);
	}
	if (obj_slot_load.selection == slotid) {
		image_blend = hsv(color_get_hue(image_blend), color_get_saturation(image_blend), 175);
	} else {
		image_blend = hsv(color_get_hue(image_blend), color_get_saturation(image_blend), 255);
	}
}

#endregion

#region Button functionality
if (place_meeting(x, y, boss)) {
    if (mouse_check_button_pressed(mb_left)) {
        if (version_check(ver)) {
            play_sfx(sfx_button4, 0, 0);
            with(obj_slot) { grabbed = 0; }
            grabbed = 1;
            obj_slot_load.selection = slotid;
            obj_slot_load.selection_name = name;
        } else {
            obj_slot_load.selection = slotid;
            ask("WHOOPS!#This save slot originates from#Myriad Blitz version " + ver + ", which is incompatible#with the version you are running now (" + VER + ").#Loading impossible. Delete the slot?", scrq_reset_slot_selection, scrq_delete_slot);
        }
    }
}
if (!mouse_check_button(mb_left) && grabbed) { grabbed = 0; }

#endregion