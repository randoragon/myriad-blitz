/// @description Draw App & GUI Surface

gpu_set_alphatestref(0);
var border = BORDER_THICKNESS * SURFACE_SCALE;

//draw application surface & apply shaders
if (global.shader_conditions == 0 || global.loading) {
    draw_surface_stretched(GENERAL_SURFACE, CANVAS_X - (2 * border), CANVAS_Y - (2 * border), window_get_width() + (2 * border), window_get_height() + (2 * border));
    if (dizzy_alpha > 0) {
        draw_set_alpha(dizzy_alpha);
		var dizzy_radius = 16;
        draw_surface_stretched(GENERAL_SURFACE, CANVAS_X - (2 * border) + ((dizzy_radius * dizzy_alpha) * dsin(global.gptime * 3)), CANVAS_Y - (2 * border) + ((dizzy_radius * dizzy_alpha) * dcos(global.gptime * 3)), window_get_width() + (2 * border), window_get_height() + (2 * border));
        draw_set_alpha(1);
    }
} else {
    shd_application_surface_effect_set(global.shader_conditions);
    draw_surface_stretched(GENERAL_SURFACE, CANVAS_X - (2 * border), CANVAS_Y - (2 * border), window_get_width() + (2 * border), window_get_height() + (2 * border));
    if (dizzy_alpha > 0) {
        draw_set_alpha(dizzy_alpha);
        draw_surface_stretched(GENERAL_SURFACE, CANVAS_X - (2 * border) + ((16 * dizzy_alpha) * dsin(global.gptime * 3)), CANVAS_Y - (2 * border) + ((16 * dizzy_alpha) * dcos(global.gptime * 3)), window_get_width() + (2 * border), window_get_height() + (2 * border));
        draw_set_alpha(1);
    }
    shader_reset();
}
 
draw_surface_stretched(GUI_SURFACE, -border, -border, window_get_width() + (2 * border), window_get_height() + (2 * border));

gpu_set_alphatestref(254);
 
surface_set_target(GENERAL_SURFACE);
draw_clear_alpha(0, 0);
surface_reset_target();
 
surface_set_target(GUI_SURFACE);
draw_clear_alpha(0, 0);
surface_reset_target();


