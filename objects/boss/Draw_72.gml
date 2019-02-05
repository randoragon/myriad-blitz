/// @description Backgrounds & Shaders

#region Backgrounds & Shaders

if (!global.loading && room != rm_Startup) {
    surface_set_target(GENERAL_SURFACE);
    draw_set_alpha_test(1);
    draw_set_alpha_test_ref_value(0);
    var border = BORDER_THICKNESS * SURFACE_SCALE;
    
    if (room != rm_Startup && global.shader_conditions == 0) {
        for (var i = 0; i < 8; i++) {
            if(__background_get( e__BG.Index, i )==-1) { break; }
            __background_set( e__BG.X, i, __background_get( e__BG.X, i ) + (gpspeed*global.parallax_speed[i,0]) );
            __background_set( e__BG.Y, i, __background_get( e__BG.Y, i ) + (gpspeed*global.parallax_speed[i,1]) );
            draw_background_tiled(__background_get( e__BG.Index, i ),__background_get( e__BG.X, i ),__background_get( e__BG.Y, i ));
        }
    } else {
        shd_background_effect_set(global.shader_conditions);
        for(var i = 0; i < 8; i++) {
            if(__background_get( e__BG.Index, i ) == -1) { break; }
            __background_set( e__BG.X, i, __background_get( e__BG.X, i ) + (gpspeed*global.parallax_speed[i,0]) );
            __background_set( e__BG.Y, i, __background_get( e__BG.Y, i ) + (gpspeed*global.parallax_speed[i,1]) );
            draw_background_tiled(__background_get( e__BG.Index, i ),__background_get( e__BG.X, i ),__background_get( e__BG.Y, i ));
        }
        shader_reset();
    }
    draw_set_alpha_test_ref_value(254);
    surface_reset_target();
}

#endregion