/// @description Draw Self

#region Skip if loading

if (global.loading == 1)  { exit; }

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw self & shader implementation

if (sprite_exists(sprite_index)) {
	gpu_set_alphatestref(0);

	if (global.shader_conditions == 0) {
		draw_self();
	} else {
		shd_sprite_effect_set(global.shader_conditions);
		if (global.shader_conditions >= 4 && global.shader_conditions <= 7) {
			draw_set_alpha(image_alpha);
			if (gpspeed != 0) {
				draw_afterimage(30, 0.1, 1, 0, 4);
			} else {
				draw_afterimage_pause(0);
			}
			draw_set_alpha(1);
		}
		draw_self();
		shader_reset();
	}
	gpu_set_alphatestref(254);
}

#endregion

#region Reset surface

surface_reset_target();

#endregion