/// @description Draw self & apply shaders

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw self & apply shaders

if (!(inv > 0 && (inv / 2) % 2 == 0)) {
    gpu_set_alphatestref(0);
    if (global.shader_conditions == 0) {
        draw_afterimage_remove();
        draw_self();
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        if (global.shader_conditions >= 4 && global.shader_conditions <= 7) {
            if (global.gpspeed != 0) {
                draw_afterimage(8, 1, 1, 0, 1);
            } else {
                draw_afterimage_pause(0);
            }
        }
        draw_self();
        shader_reset();
    }
    gpu_set_alphatestref(254);
}

#endregion

#region Post processing

if (global.state == 0) {
	if (global.chrsel == PLAYER_BOBILEUSZ) {
		draw_sprite_ext(spr_bobileusz_bottle, 0, x + 10, y - 12 + (2 * (image_index >= 4 && image_index < 6)), 2, 2, 0, c_white, 1);
	}
}

#endregion

#region Reset surface

surface_reset_target();

#endregion