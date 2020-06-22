/// @description Draw Enemy Particles

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Draw enemy particles

if (part_system_count_lt(PART_SYSTEM_ENEMY_LT) > 0) {
    surface_set_target(GENERAL_SURFACE);
    gpu_set_alphatestref(0);
    if (global.shader_conditions == 0) {
        part_system_draw_lt(PART_SYSTEM_ENEMY_LT);
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        part_system_draw_lt(PART_SYSTEM_ENEMY_LT);
        shader_reset();
    }
    gpu_set_alphatestref(254);
    surface_reset_target();
}

#endregion