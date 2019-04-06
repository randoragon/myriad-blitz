/// @description Button Mechanics

#region Button mechanics

if (place_meeting(x, y, boss) && image_alpha == 1 && global.busy == 0) {
    image_scale(home(image_xscale, 1.1, 0.04, 0), home(image_yscale, 1.1, 0.04, 0));
} else {
    image_scale(home(image_xscale, 1, 0.04, 0), home(image_yscale, 1, 0.04, 0));
}

if (place_meeting(x, y, boss) && mouse_check_button_pressed(mb_left) && image_alpha == 1 && global.busy == 0 && !instance_exists(obj_transition)) {
    grabbed = TRUE;
}

if (grabbed && image_alpha == 1 && global.busy == 0) {
    image_scale(home(image_xscale, 0.9, 0.08, 0), home(image_yscale, 0.9, 0.08, 0));
}

if (mouse_check_button_released(mb_left) && place_meeting(x, y, boss) && image_alpha == 1 && global.busy == 0 && !instance_exists(obj_transition)) {
    global.realm = rlm;
    play_sfx(sfx_button2, 0, 0);
    music_volume(0, 500);
    screen_transition(rm_Main, scrt_menu_to_main, 30, 0, c_black);
}

if (!mouse_check_button(mb_left)) {
    grabbed = FALSE;
}

#endregion