/// @description skip if loading
if global.loading==1 exit;

///draw self & apply shaders

if!(inv>0 && (inv/2)%2==0) {
    surface_set_target(GENERAL_SURFACE);
    draw_set_alpha_test_ref_value(0);
    if(global.shader_conditions==0) {
        draw_afterimage_remove();
        draw_self();
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        if(global.shader_conditions>=4 && global.shader_conditions<=7) {
            if(gpspeed!=0) {
                draw_afterimage(8,1,1,0,1);
            } else {
                draw_afterimage_pause(0);
            }
        }
        draw_self();
        shader_reset();
    }
    draw_set_alpha_test_ref_value(254);
    surface_reset_target();
}

