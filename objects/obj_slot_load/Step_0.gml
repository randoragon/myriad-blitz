/// @description Button Interaction

#region Inherit parent event

event_inherited();

#endregion

#region Button interaction

if (page > ceil((array_length_1d(slot) - 1) / 6)) {
	page = ceil((array_length_1d(slot) - 1) / 6);
}

if (obj_slot_load.start_busy != global.busy) { exit; }
if (boss.x >= x + 284 && boss.x <= x + 331 && boss.y >= y - 240 && boss.y <= y - 194 && mouse_check_button_pressed(mb_left)) { grabbed = 2; }
if (keyboard_check_pressed(vk_escape) || (boss.x >= x + 284 && boss.x <= x + 331 && boss.y >= y - 240 && boss.y <= y - 194 && grabbed == 2 && mouse_check_button_released(mb_left))) {
	wipe(obj_slot);
	wipe(button[0]);
	wipe(button[1]);
	wipe(button[2]);
	wipe(button[3]);
	play_sfx(sfx_button3, 0);
	instance_destroy();
}

if (selection != "") {
	if (boss.x >= x - 329 && boss.x <= x - 280 && boss.y >= y + 195 && boss.y <= y + 241 && mouse_check_button_pressed(mb_left)) { grabbed = 1; }
	if (boss.x >= x - 329 && boss.x <= x - 280 && boss.y >= y + 195 && boss.y <= y + 241 && grabbed == 1 && mouse_check_button_released(mb_left)) {
	    scr_Load(selection, selection_ver);
	    wipe(obj_slot);
		wipe(button[0]);
		wipe(button[1]);
		wipe(button[2]);
		wipe(button[3]);
	    music_volume(0, 500);
	    instance_destroy();
	}
	image_index = grabbed;
} else {
	image_index = 3 + (grabbed == 2);
}

if (!mouse_check_button(mb_left)) { grabbed = 0; }

#endregion