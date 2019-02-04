/// @description skip if loading
if global.loading==1 exit;

///draw enemy particles
if(part_system_count_lt(global.part_system[4])>0) {
    surface_set_target(GENERAL_SURFACE);
    draw_set_alpha_test_ref_value(0);
    if(global.shader_conditions==0) {
        part_system_draw_lt(global.part_system[4]);
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        part_system_draw_lt(global.part_system[4]);
        shader_reset();
    }
    draw_set_alpha_test_ref_value(254);
    surface_reset_target();
}

