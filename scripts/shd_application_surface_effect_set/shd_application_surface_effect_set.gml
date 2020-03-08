/// @description shd_application_surface_effect_set(case);
/// @param case

/* This script expects an argument real number that has its bits arranged in a way that represents
 * which shader effects should be taken into account.
 * for example, the last bit is focus mode, so the bit structure of the provided number would be:
 * 0000 0000 0000 0000 0000 0000 0000 0001
 * which is equivelent to integer 1.
 */

shader_set(shd_application_surface_effect);
var arg, u_waveAmplitude_x, u_waveAmplitude_y, u_waveClock_x, u_waveClock_y, u_wavingSpeed_x, u_wavingSpeed_y, u_waveLength_x, u_waveLength_y, u_blendIntensity, u_colorBlend, u_gptime, u_contrastIntensity, u_desaturationIntensity, u_brightnessIntensity, u_velocityLines;
arg                     = argument[0];
u_waveAmplitude_x       = 0;
u_waveAmplitude_y       = 0;
u_waveClock_x           = 0;
u_waveClock_y           = 0;
u_wavingSpeed_x         = 0;
u_wavingSpeed_y         = 0;
u_waveLength_x          = 0;
u_waveLength_y          = 0;
u_blendIntensity        = 0;
u_colorBlend            = c_black;
u_gptime                = global.gptime;
u_contrastIntensity     = 0;
u_desaturationIntensity = 0;
u_brightnessIntensity   = 0;
u_velocityLines         = 0;

if (arg >= 4 && arg <= 7) { // chip tuning
    u_velocityLines = 1;
} else if (arg >= 8 && arg <= 15) { // current crush
    u_gptime          = 0;
    u_waveAmplitude_x = 7;
    u_waveAmplitude_y = 7;
    u_waveClock_x     = global.gptime;
    u_waveClock_y     = global.gptime+30;
    u_wavingSpeed_x   = 6;
    u_wavingSpeed_y   = 6;
    u_waveLength_x    = 300;
    u_waveLength_y    = 400;
    u_colorBlend      = rgb(0, 115, 255);
    if (obj_player.flash_clock < 40) {
        if (obj_player.flash_clock > 0) {
            u_blendIntensity = (40 - obj_player.flash_clock) / 40;
        } else {
            u_blendIntensity = 1;
        }
    }
}

shader_set_uniform_f(global.shd_application_surface_effect_uni[| 0],  u_waveAmplitude_x, u_waveAmplitude_y);
shader_set_uniform_f(global.shd_application_surface_effect_uni[| 1],  u_waveClock_x, u_waveClock_y);
shader_set_uniform_f(global.shd_application_surface_effect_uni[| 2],  u_wavingSpeed_x, u_wavingSpeed_y);
shader_set_uniform_f(global.shd_application_surface_effect_uni[| 3],  u_waveLength_x, u_waveLength_y);
shader_set_uniform_f(global.shd_application_surface_effect_uni[| 4],  u_blendIntensity);
shader_set_uniform_f(global.shd_application_surface_effect_uni[| 5],  color_get_red(u_colorBlend) / 255, color_get_green(u_colorBlend) / 255, color_get_blue(u_colorBlend) / 255);
shader_set_uniform_f(global.shd_application_surface_effect_uni[| 6],  u_gptime);
shader_set_uniform_f(global.shd_application_surface_effect_uni[| 7],  u_contrastIntensity);
shader_set_uniform_f(global.shd_application_surface_effect_uni[| 8],  u_desaturationIntensity);
shader_set_uniform_f(global.shd_application_surface_effect_uni[| 9],  u_brightnessIntensity);
shader_set_uniform_f(global.shd_application_surface_effect_uni[| 10], u_velocityLines);
