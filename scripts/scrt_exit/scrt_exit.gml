/// @description scrt_exit();

audio_stop_all();
global.close_game = TRUE;
gpu_set_colorwriteenable(0, 0, 0, 0) ;
draw_clear_alpha(0, 0);
game_end();