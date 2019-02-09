/// @description Transition

#region Transition

draw_set_font(f_pixeldise);
draw_set_color(c_white);
screen_transition(-1, scrt_loading, 20, choose(-1, 1, -2, 2), c_black);
alarm[1] = 20;

#endregion