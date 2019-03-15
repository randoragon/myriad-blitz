/// @description Draw Self

#region Skip if loading

if (global.loading == 1)  { exit; }

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw self & apply shaders

if (global.shader_conditions == 0) {
    draw_afterimage_remove();
    draw_self();
} else {
    shd_sprite_effect_set(global.shader_conditions);
    if (global.shader_conditions >= 4 && global.shader_conditions <= 7) {
        if (global.gpspeed != 0) {
            draw_afterimage(10, 0.1, 1, 0, 6);
        } else {
            draw_afterimage_pause(0);
        }
    }
    draw_self();
    shader_reset();
}

#endregion

#region Reset surface

surface_reset_target();

#endregion