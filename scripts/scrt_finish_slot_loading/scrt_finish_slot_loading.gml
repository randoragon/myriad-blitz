/// @description scrt_finish_slot_loading();
play_sfx(sfx_run_start,0,0);
global.loading=0;
busy--;
wipe(obj_slot_loading);
draw_texture_flush();
