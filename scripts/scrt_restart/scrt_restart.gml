/// @description scrt_restart();
wipe(obj_sound_bar);
scr_Restart();
boss.transition=1;
play_music(mus_rlm_christmas+realm-1,sound_priority.music,1);
state=1;
global.points=0;
randomize();
draw_texture_flush();
