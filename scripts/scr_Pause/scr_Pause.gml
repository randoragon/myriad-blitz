/// @description scr_Pause();

global.gpspeed_state = 0;
audio_pause_all();
play_sfx(sfx_pause, 0, 0);

instance_create_f(CANVAS_XMID, CANVAS_Y + 500, obj_sound_bar, 0);
instance_create_f(CANVAS_XMID, CANVAS_Y + 564, obj_sound_bar, 1);

for (var i = 0; i < 4; i++) {
    instance_create_f(CANVAS_XMID, CANVAS_Y + 200 + (i * 60), obj_button, 9 + i);
}