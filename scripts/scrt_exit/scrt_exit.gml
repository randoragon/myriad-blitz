/// @description scrt_exit();

audio_stop_all();
if (surface_exists(GENERAL_SURFACE)) {
	surface_free(GENERAL_SURFACE);
}
if (surface_exists(GUI_SURFACE)) {
	surface_free(GUI_SURFACE);
}
gpu_set_colorwriteenable(0, 0, 0, 0) ;
draw_clear_alpha(0, 0);
game_end();