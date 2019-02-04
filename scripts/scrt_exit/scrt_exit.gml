audio_stop_all();
surface_free(GENERAL_SURFACE);
surface_free(GUI_SURFACE);
draw_set_color_write_enable(0,0,0,0);
draw_clear_alpha(0,0);
game_end();
