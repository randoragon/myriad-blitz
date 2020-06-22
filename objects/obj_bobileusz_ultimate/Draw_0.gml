/// @description Draw self & apply shaders

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Draw self & apply shaders

surface_set_target(GENERAL_SURFACE);

if (global.gpspeed != 0) {
    draw_afterimage(3, 0.5, 1, 0, 2);
} else {
    draw_afterimage_pause(0);
}
if (global.shader_conditions == 0) {
    draw_self();
} else {
    shd_sprite_effect_set(global.shader_conditions);
    draw_self();
    shader_reset();
}
surface_reset_target();

#endregion