/// @description shd_background_effect_set(case);
/// @param case
function shd_background_effect_set() {

	/* This script expects an argument real number that has its bits arranged in a way that represents
	 * which shader effects should be taken into account.
	 * for example,  the last bit is focus mode,  so the bit structure of the provided number would be:
	 * 0000 0000 0000 0000 0000 0000 0000 0001
	 * which is equivelent to integer 1.
	 */

	shader_set(shd_background_effect);
	var arg, u_blendIntensity, u_colorBlend, u_gptime, u_contrastIntensity, u_desaturationIntensity, u_brightnessIntensity;
	arg                     = argument[0];
	u_blendIntensity        = 0;
	u_colorBlend            = c_black;
	u_gptime                = global.gptime;
	u_contrastIntensity     = 0;
	u_desaturationIntensity = 0;
	u_brightnessIntensity   = 0;

	if (arg == 1 || arg == 3) { // focus mode
	    u_gptime = 0;
	    u_desaturationIntensity = 1 - global.gpspeed;
	} else if (arg == 4 || arg == 5) { // chip tuning
	    u_contrastIntensity     = 0.2;
	    u_desaturationIntensity = 1;
	u_brightnessIntensity       = 0.25;
	} else if (arg == 6 || arg == 7) { // ultimate activation && chip tuning
	    u_contrastIntensity     = (1 - (obj_player.flash_clock / 40)) * 0.2;
	    u_desaturationIntensity = (1 - (obj_player.flash_clock / 40));
	    u_brightnessIntensity   = (1 - (obj_player.flash_clock / 40)) * 0.25;
	}

	shader_set_uniform_f(global.shd_background_effect_uni[| 0], u_blendIntensity);
	shader_set_uniform_f(global.shd_background_effect_uni[| 1], color_get_red(u_colorBlend)/255, color_get_green(u_colorBlend)/255, color_get_blue(u_colorBlend)/255);
	shader_set_uniform_f(global.shd_background_effect_uni[| 2], u_gptime);
	shader_set_uniform_f(global.shd_background_effect_uni[| 3], u_contrastIntensity);
	shader_set_uniform_f(global.shd_background_effect_uni[| 4], u_desaturationIntensity);
	shader_set_uniform_f(global.shd_background_effect_uni[| 5], u_brightnessIntensity);



}
