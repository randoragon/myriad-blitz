/// @description Draw Loading Bar

#region set GENERAL_SURFACE

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw loading bar

if (stage != 0) {
	var num1 = 0;
	for (var i = 0; i < array_length(audiogroups); i++) { num1 += audio_group_load_progress(audiogroups[i]); }
	var den1 = array_length(audiogroups) * 100;
	var num2 = image_index;
	var den2 = image_number;
	var precision = 0.0001;
	var progress = ceil(((num1 * den2) + (num2 * den1)) / (2 * den1 * den2 * precision)) * precision;
	if (test < progress) { test = progress; }
    
    draw_set_color(hsv(90, 193 + (32 * dsin(cycle)), 255));
    draw_rectangle(CANVAS_XMID - sprite_get_xoffset(spr_loading_bar) + 14, 550 - sprite_get_yoffset(spr_loading_bar) + 14, CANVAS_XMID - sprite_get_xoffset(spr_loading_bar) + 14 + (progress * 1000), 550 - sprite_get_yoffset(spr_loading_bar) + 88, 0);
    draw_sprite(spr_loading_bar, 0, CANVAS_XMID, 550);
    draw_sprite_ext(spr_loading_caption, 0, CANVAS_XMID, 550, 0.5, 0.5, 0, c_white, 1);
    if (num2 < progress * den2) { image_index += (image_index < image_number - 1); }
    if (image_index >= image_number - 1 && stage == max_stage) {
		image_index = image_number - 1;
		stage       = max_stage + 1;
		alarm[2]    = 60;
	}
    draw_self();
}

#endregion

#region Reset surface

surface_reset_target();

#endregion