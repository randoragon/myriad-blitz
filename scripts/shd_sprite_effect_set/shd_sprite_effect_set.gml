/// @description shd_sprite_effect_set(case);
/// @param case
function shd_sprite_effect_set() {

	/* This script expects an argument real number that has its bits arranged in a way that represents
	 * which shader effects should be taken into account.
	 * for example, the last bit is focus mode, so the bit structure of the provided number would be:
	 * 0000 0000 0000 0000 0000 0000 0000 0001
	 * which is equivelent to integer 1.
	 */

	shader_set(shd_sprite_effect);
	var arg, u_gpspeed, u_gptime, u_minColorAvg, u_maxColorAvg, u_contrastIntensity, u_desaturationIntensity, u_brightnessIntensity, u_flickerInterval;
	arg                     = argument[0];
	u_gpspeed               = global.gpspeed;
	u_gptime                = global.gptime;
	u_minColorAvg           = 0;
	u_maxColorAvg           = 1;
	u_contrastIntensity     = 0;
	u_desaturationIntensity = 0;
	u_brightnessIntensity   = 0;
	u_flickerInterval       = 0;

	if (arg == 1) { 													// focus mode
		u_contrastIntensity   = 1 - global.gpspeed;
	} else if (object_index == obj_player && (arg == 2 || arg == 3)) { 	// ultimate activation
		u_brightnessIntensity = flash_clock / 40;
	} else if (arg == 4 || arg == 5) { 									// chip tuning
		u_brightnessIntensity = -1;
		if (fps > 50 && global.gpspeed != 0) { u_flickerInterval = 3; }
	} else if (arg == 6 || arg == 7) { 									// ultimate activation && chip tuning
		if (object_index == obj_player) {
			u_brightnessIntensity = -1 + (obj_player.flash_clock / 20);
		} else {
			u_brightnessIntensity = (obj_player.flash_clock / 40) - 1;
		}
	
		if (fps > 50 && global.gpspeed != 0) { u_flickerInterval = 3; }
	}

	shader_set_uniform_f(global.shd_sprite_effect_uni[| 0], u_gpspeed);
	shader_set_uniform_f(global.shd_sprite_effect_uni[| 1], u_gptime);
	shader_set_uniform_f(global.shd_sprite_effect_uni[| 2], u_contrastIntensity);
	shader_set_uniform_f(global.shd_sprite_effect_uni[| 3], u_minColorAvg);
	shader_set_uniform_f(global.shd_sprite_effect_uni[| 4], u_maxColorAvg);
	shader_set_uniform_f(global.shd_sprite_effect_uni[| 5], u_desaturationIntensity);
	shader_set_uniform_f(global.shd_sprite_effect_uni[| 6], u_brightnessIntensity);
	shader_set_uniform_f(global.shd_sprite_effect_uni[| 7], u_flickerInterval);



}
