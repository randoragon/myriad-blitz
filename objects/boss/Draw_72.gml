/// @description Backgrounds & Shaders

#region Backgrounds & Shaders

if (!global.loading && room != rm_Startup) {
    surface_set_target(GENERAL_SURFACE);
    gpu_set_alphatestenable(1);
    gpu_set_alphatestref(0);
    var border = BORDER_THICKNESS * SURFACE_SCALE;
    
    if (room != rm_Startup && global.shader_conditions == 0) {
        for (var i = 0; i < 8; i++) {
            if(__background_get( e__BG.Index, i )==-1) { break; }
            __background_set( e__BG.X, i, __background_get( e__BG.X, i ) + (global.gpspeed*global.parallax_speed[i,0]) );
            __background_set( e__BG.Y, i, __background_get( e__BG.Y, i ) + (global.gpspeed*global.parallax_speed[i,1]) );
            draw_background_tiled(__background_get( e__BG.Index, i ),__background_get( e__BG.X, i ),__background_get( e__BG.Y, i ));
        }
    } else {
        shd_background_effect_set(global.shader_conditions);
        for(var i = 0; i < 8; i++) {
            if(__background_get( e__BG.Index, i ) == -1) { break; }
            __background_set( e__BG.X, i, __background_get( e__BG.X, i ) + (global.gpspeed*global.parallax_speed[i,0]) );
            __background_set( e__BG.Y, i, __background_get( e__BG.Y, i ) + (global.gpspeed*global.parallax_speed[i,1]) );
            draw_background_tiled(__background_get( e__BG.Index, i ),__background_get( e__BG.X, i ),__background_get( e__BG.Y, i ));
        }
        shader_reset();
    }
    gpu_set_alphatestref(254);
    surface_reset_target();
}

#endregion