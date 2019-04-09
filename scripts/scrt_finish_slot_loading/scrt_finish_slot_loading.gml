/// @description scrt_finish_slot_loading();

play_sfx(sfx_run_start, 0, 0);
global.loading = FALSE;
global.busy--;
wipe(obj_slot_loading);