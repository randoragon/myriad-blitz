/// @description scr_Restart();

global.gpspeed_state               = 1;
global.gpspeed_focus               = 1;
global.gpspeed_ultimate_activation = 1;
global.gpspeed_ultimate            = 1;
global.state                       = 0;
global.spawnrate                   = 10;
global.gptime                      = 0;
global.gpstep                      = 1;
boss.lastpresent                   = 0;
global.transition                  = 1;
boss.last_ult                      = 0;
boss.dizzy_alpha                   = 0;
global.kill_count                  = 0;

with (all) {
    if (object_index != obj_player && object_is_ancestor(object_index, obj_save_group)) {
        instance_destroy();
    }
}

wipe(obj_keyboard);
wipe(obj_lore);
wipe(obj_statboard);
part_system_clear_lt (PART_SYSTEM_PLAYERBOT);
part_system_clear_pro(PART_SYSTEM_DAMAGE_INDICATORS);
part_system_clear_ult(PART_SYSTEM_FRAG);
part_system_clear_ult(PART_SYSTEM_CHARGE);
part_system_clear_lt (PART_SYSTEM_ENEMY);
part_system_clear_lt (PART_SYSTEM_PLAYERTOP);
part_system_clear_lt (PART_SYSTEM_ULTIMATE);
scr_PlayerDataUpdate(global.chrsel);
scr_PlayerGetData();
scr_ParticlesUpdate();
scr_BackgroundUpdate(global.realm);
instance_create_layer  (CANVAS_X + 180,  CANVAS_Y + 583, "Boards", obj_keyboard);
instance_create_layer  (CANVAS_X + 683,  CANVAS_Y + 624, "Boards", obj_lore);
instance_create_layer  (CANVAS_X + 1186, CANVAS_Y + 498, "Boards", obj_statboard);
instance_create_layer_f(CANVAS_X + 896,  CANVAS_Y + 352, "Interactables", obj_button, 6);
instance_create_layer_f(CANVAS_X + 448,  CANVAS_Y + 352, "Interactables", obj_button, 5);

scr_PlayerReset(); // reset player variables
if (global.gpspeed == 0) { obj_player.prev_image_speed = 0.4; }
audio_stop_sound(mus_rlm_christmas + global.realm - 1);