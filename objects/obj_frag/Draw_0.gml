/// @description Draw self & apply shaders

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw self & shader implementation

if (f == 0 && e == 2) {
    draw_set_blend_mode(bm_add);
}

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
draw_set_blend_mode(bm_normal);

#endregion

#region Reset surface

surface_reset_target();

#endregion