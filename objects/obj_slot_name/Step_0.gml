/// @description Input

#region Inherit parent event

event_inherited();

#endregion

#region Input

if (boss.x >= x + 196 && boss.x <= x + 243 && boss.y >= y - 93 && boss.y <= y - 49 && mouse_check_button_pressed(mb_left)) {
    grabbed = 2;
}

if (keyboard_check_pressed(vk_escape) || (boss.x >= x + 196 && boss.x <= x + 243 && boss.y >= y - 93 && boss.y <= y - 49 && grabbed == 2 && mouse_check_button_released(mb_left))) {
    instance_destroy();
}

if (keyboard_string != "") {
    if (boss.x >= x - 240 && boss.x <= x - 192 && boss.y >= y + 50 && boss.y <= y + 195 && mouse_check_button_pressed(mb_left)) {
        grabbed = 1;
    }
    if (keyboard_check_pressed(vk_enter) || (boss.x >= x - 240 && boss.x <= x - 192 && boss.y >= y + 50 && boss.y <= y + 195 && grabbed == 1 && mouse_check_button_released(mb_left))) {
        switch(f) {
	        case 0:
	            scr_Save(keyboard_string);
	        break;
	        case 1:
	            scr_Rename(obj_slot_load.selection, keyboard_string);
	            var prevpage = obj_slot_load.page;
	            with (obj_slot_load) {
	                wipe(obj_slot);
					wipe(button[0]);
					wipe(button[1]);
					wipe(button[2]);
					wipe(button[3]);
	                instance_destroy();
	            }
	            instance_destroy();
	            var n = instance_create(lerp(CANVAS_X, CANVAS_XEND, 0.5), lerp(CANVAS_Y, CANVAS_YEND, 0.5), obj_slot_load);
	            n.page = prevpage;
	        break;
        }
        instance_destroy();
    }
    image_index = grabbed;
} else {
    image_index = 3 + (grabbed == 2);
}

if (!mouse_check_button(mb_left)) {
    grabbed = 0;
}

#endregion