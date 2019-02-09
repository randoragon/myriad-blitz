/// @description Setup

#region Setup

image_scale(2, 2);
image_alpha = 0;
image_speed = 0;
instance_create(0, 0, obj_randoragon_logo);

progress = 0;
stage    = 0;
cycle    = 0;

#endregion


#region Load settings on startup

if (file_exists(working_directory + "\\userconfig.mbdat")) {
    ini_open(working_directory + "\\userconfig.mbdat");
    global.fullscreen                       = ini_read_real("settings", "fullscreen", 1);
    global.screenshake                      = ini_read_real("settings", "screenshake", 1);
    global.muspercentage                    = ini_read_real("settings", "music", 20);
    global.sfxpercentage                    = ini_read_real("settings", "sfx", 80);
    global.save_chunk_size                  = ini_read_real("settings", "save_chunk_size", 500);
    global.save_particles                   = ini_read_real("settings", "save_particles", 1);
    global.left_handed_mode                 = toggle(ini_read_real("settings", "left_handed_mode", 0));
    global.enemy_details_selection_auto_aim = ini_read_real("settings","enemy_selection_auto_aim", 1);
    scrc_left_handed_mode();
    ini_close();
} else {
    global.fullscreen                       = 1;
    global.screenshake                      = 1;
    global.muspercentage                    = 100;
    global.sfxpercentage                    = 100;
    global.save_chunk_size                  = 500;
    global.save_particles                   = 1;
    global.left_handed_mode                 = 1;
    global.enemy_details_selection_auto_aim = 1;
    scrc_left_handed_mode();
}

window_set_fullscreen(global.fullscreen);

#endregion