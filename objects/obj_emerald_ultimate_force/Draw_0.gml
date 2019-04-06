/// @description Draw Lines

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw lines

draw_set_alpha(0.5);
gpu_set_alphatestref(0);
var max_length = sqrt(sqr(CANVAS_WIDTH) + sqr(CANVAS_HEIGHT));
var length     = (clock * 2) + 10;
draw_set_color(c_white);
draw_line_width(x + lengthdir_x(max_length * clock / 60, image_angle), y + lengthdir_y(max_length * clock / 60, image_angle), x + lengthdir_x((max_length * clock / 60) + length, image_angle), y + lengthdir_y((max_length * clock / 60) + length, image_angle), 2);
draw_set_alpha(1);
gpu_set_alphatestref(254);

#endregion

#region Reset surface

surface_reset_target();

#endregion