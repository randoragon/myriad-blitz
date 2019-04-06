/// @description Draw Damage Particles

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Draw damage particles

if (part_system_count_pro(PART_SYSTEM_DAMAGE_INDICATORS) > 0) {
    surface_set_target(GUI_SURFACE);
    gpu_set_alphatestref(0);
    if (global.shader_conditions == 0) {
        part_system_draw_pro(PART_SYSTEM_DAMAGE_INDICATORS);
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        part_system_draw_pro(PART_SYSTEM_DAMAGE_INDICATORS);
        shader_reset();
    }
    gpu_set_alphatestref(254);
    surface_reset_target();
}

#endregion