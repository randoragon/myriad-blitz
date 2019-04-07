/// @description scrq_restart();

play_sfx(sfx_back, 0, 0);
screen_transition(-1, scrt_restart, 20, choose(-1, 1, -2, 2), c_black);
instance_destroy();