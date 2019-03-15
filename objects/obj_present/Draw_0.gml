/// @description Picking Up & Drawing

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Picking & drawing with shader implementation

if (!picked) {
    surface_set_target(GENERAL_SURFACE);
    if (global.shader_conditions == 0) {
        draw_afterimage_remove();
        draw_self();
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        if (global.shader_conditions >= 4 && global.shader_conditions <= 7) {
            if (gpspeed != 0) {
                draw_afterimage(30, 0.5, 1, 0, 4);
            } else {
                draw_afterimage_pause(0);
            }
        }
        draw_self();
        shader_reset();
    }
    surface_reset_target();
} else {
    switch (f) {
	    case 0:
			indicate(x, y, round(number), 2, rgb(50, 255, 0), rgb(50, 255, 0));
			instance_destroy();
		break;
	    case 1:
			indicate(x, y, "charged", 2, color_shift_hsv(global.color[global.chrsel], 0, 0, 150, 1), global.color[global.chrsel]);
			instance_destroy();
		break;
    }
}

#endregion