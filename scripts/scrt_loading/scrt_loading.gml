/// @description scrt_loading();

play_music(mus_menu_intro, sound_priority.music, 0);
boss.menu_intro = TRUE;
layer_set_visible(layer_get_id("Black_Color"), FALSE);
layer_set_visible(layer_get_id("bg_loading"), TRUE);
