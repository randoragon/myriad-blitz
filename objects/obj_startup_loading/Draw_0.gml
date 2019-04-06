/// @description Draw Loading Bar

#region set GENERAL_SURFACE

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw loading bar

if (stage != 0) {
	var progress = 0;
	for (var i = 0; i < array_length_1d(audiogroups); i++) { progress += audio_group_load_progress(audiogroups[i]); }
	progress /= array_length_1d(audiogroups) * 100;
	progress += image_index / image_number;
    progress /= 2;
    
    draw_set_color(hsv(90, 193 + (32 * dsin(cycle)), 255));
    draw_rectangle(CANVAS_XMID - sprite_get_xoffset(spr_loading_bar) + 14, 550 - sprite_get_yoffset(spr_loading_bar)+14,CANVAS_XMID-sprite_get_xoffset(spr_loading_bar) + 14 + (progress * 998), 550 - sprite_get_yoffset(spr_loading_bar) + 88, 0);
    draw_sprite(spr_loading_bar, 0, CANVAS_XMID, 550);
    draw_sprite_ext(spr_loading_caption, 0, CANVAS_XMID, 550, 0.5, 0.5, 0, c_white, 1);
    if (image_index > progress * (image_number - 1)) { image_index = progress * (image_number - 1); }
    if (image_index >= image_number - 1 && image_speed > 0) {
		image_speed = 0;
		image_index = image_number - 1;
		stage       = 5;
		alarm[2]    = 60;
	}
    draw_self();
}

#endregion

#region Reset surface

surface_reset_target();

#endregion