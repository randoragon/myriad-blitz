/// @description Backgrounds & Shaders

#region Backgrounds & Shaders

if (!global.loading && room != rm_Startup) {
    surface_set_target(GENERAL_SURFACE);
    gpu_set_alphatestref(0);
	
    if (global.shader_conditions != 0) {
		shd_background_effect_set(global.shader_conditions);
	}
    for (var i = 0; i < 8; i++) {
        if (global.background_sprite[i] != noone) {
			if (global.background_htiled[i] && !global.background_vtiled[i]) {
				draw_sprite_htiled(global.background_sprite[i], global.background_sprite_index[i], global.background_x[i], global.background_y[i]);
			} else if (global.background_htiled[i] && global.background_vtiled[i]) {
				draw_sprite_tiled(global.background_sprite[i], global.background_sprite_index[i], global.background_x[i], global.background_y[i]);
			} else if (global.background_vtiled[i]) {
				draw_sprite_vtiled(global.background_sprite[i], global.background_sprite_index[i], global.background_x[i], global.background_y[i]);
			} else {
				draw_sprite(global.background_sprite[i], global.background_sprite_index[i], global.background_x[i], global.background_y[i]);
			}
		}
			
		global.background_x[i]			  += global.background_hspeed[i]	  * global.gpspeed;
		global.background_y[i]			  += global.background_vspeed[i]	  * global.gpspeed;
		global.background_sprite_index[i] += global.background_image_speed[i] * global.gpspeed;
    }
	
	if (global.shader_conditions != 0) {
		shader_reset();
	}
	
	gpu_set_alphatestref(254);
	surface_reset_target();
}

#endregion