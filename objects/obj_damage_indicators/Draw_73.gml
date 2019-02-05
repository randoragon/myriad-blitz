/// @description Draw Damage Particles

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Draw damage particles

if (part_system_count_pro(global.part_system[1]) > 0) {
    surface_set_target(GUI_SURFACE);
    draw_set_alpha_test_ref_value(0);
    if (global.shader_conditions == 0) {
        part_system_draw_pro(global.part_system[1]);
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        part_system_draw_pro(global.part_system[1]);
        shader_reset();
    }
    draw_set_alpha_test_ref_value(254);
    surface_reset_target();
}

#endregion