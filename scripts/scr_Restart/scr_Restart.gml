/// @description scr_Restart();

global.gpspeed_state               = 1;
global.gpspeed_focus               = 1;
global.gpspeed_ultimate_activation = 1;
global.gpspeed_ultimate            = 1;
state                              = 0;
spawnrate                          = 10;
gptime                             = 0;
gpstep                             = 1;
boss.lastpresent                   = 0;
global.transition                    = 1;
boss.last_ult                      = 0;
boss.dizzy_alpha                   = 0;
kill_count                         = 0;

with (all) {
    if (object_index != obj_player && object_is_ancestor(object_index, obj_save_group)) {
        instance_destroy();
    }
}

wipe(obj_keyboard);
wipe(obj_lore);
wipe(obj_statboard);
part_system_clear_lt (global.part_system[0]);
part_system_clear_pro(global.part_system[1]);
part_system_clear_ult(global.part_system[2]);
part_system_clear_ult(global.part_system[3]);
part_system_clear_lt (global.part_system[4]);
part_system_clear_lt (global.part_system[5]);
part_system_clear_lt (global.part_system[6]);
scr_PlayerDataUpdate(global.chrsel);
scr_PlayerGetData();
scr_ParticlesUpdate();
scr_BackgroundUpdate(realm);
instance_create  (CANVAS_X + 180,  CANVAS_Y  + 583, obj_keyboard);
instance_create  (CANVAS_X + 683,  CANVAS_Y  + 624, obj_lore);
instance_create  (CANVAS_X + 1186, CANVAS_Y  + 498, obj_statboard);
instance_create_f(CANVAS_X + 896,  CANVAS_Y  + 352, obj_button, 6);
instance_create_f(CANVAS_X + 448,  CANVAS_Y  + 352, obj_button, 5);

ds_grid_destroy(player_status_effects);            // this grid gets recreated in the player's create event so this line destroys the already existing grid to avoid doubles
with (obj_player) { event_perform(ev_create, 0); } // reset player variables
if (gpspeed == 0) { obj_player.prev_image_speed = 0.4; }
audio_stop_sound(mus_rlm_christmas + realm - 1);