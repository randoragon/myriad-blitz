/// @description Draw self & apply shaders

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw self & apply shaders

// enable transparency only when necessary (increases overhead)
if (FALSE) {
	gpu_set_alphatestref(0);
}

// enable additive blending for extra effects
if (FALSE) {
    gpu_set_blendmode(bm_add);
}

if (global.shader_conditions == 0) {
    draw_afterimage_remove();
    draw_self();
} else {
    shd_sprite_effect_set(global.shader_conditions);
    if (global.shader_conditions >= 4 && global.shader_conditions <= 7) {
        if (global.gpspeed != 0) {
            draw_afterimage(30, 0.5, 1, 0, 4);
        } else {
            draw_afterimage_pause(0);
        }
    }
    draw_self();
    shader_reset();
}

gpu_set_alphatestref(254);
gpu_set_blendmode(bm_normal);

#endregion

#region Reset surface

surface_reset_target();

#endregion