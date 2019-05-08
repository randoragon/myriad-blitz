/// @description Insert description here
// You can write your code in this editor

event_inherited();

surface_set_target(GENERAL_SURFACE);
draw_set_color(c_white);
draw_set_alpha(1);
draw_text_transformed(x, y + 20, string(state), 3, 3, 0);
surface_reset_target();