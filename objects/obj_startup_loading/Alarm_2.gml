/// @description Move On To Menu

#region Move on to menu

show_debug_message(audio_group_is_loaded(audiogroup_menu));
screen_transition(rm_Menu, -1, 30, choose(-1, 1, -2, 2), c_white);

#endregion