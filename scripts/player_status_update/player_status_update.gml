/// @description player_status_update();

ds_grid_add_region(global.player_status_effects, 1, 0, 1, ds_grid_height(global.player_status_effects) - 1, -global.gpspeed);

for (var i = 0; i < ds_grid_height(global.player_status_effects); i++) {
    if (global.player_status_effects[# 1, i] <= 0 && global.player_status_effects[# 1, i] >= -1) {
        // update player status_effect array
        var deceased_effect_id = global.player_status_effects[# 0, i];
        obj_player.status_effect[deceased_effect_id] = FALSE;

        // get rid of the used cooldown
        if (i < ds_grid_height(global.player_status_effects) - 1) {
            ds_grid_set_grid_region(global.player_status_effects, global.player_status_effects, 0, i + 1, 2, ds_grid_height(global.player_status_effects) - 1, 0, i);
            i--;
        }
        if (ds_grid_height(global.player_status_effects) > 1) {
            ds_grid_resize(global.player_status_effects, 3, ds_grid_height(global.player_status_effects) - 1);
        } else {
            ds_grid_destroy(global.player_status_effects);
            global.player_status_effects = ds_grid_create(3, 0);
        }

        // aftereffects
        switch (deceased_effect_id) {
            case STATUS_EFFECT_CHIP_TUNING:
                player_status_add(STATUS_EFFECT_ULTIMATE_COOLDOWN, obj_player.ucooldown, 0);
                global.gpspeed_ultimate = 1;
            break;
            case STATUS_EFFECT_TWILIGHT_FURY:
                player_status_add(STATUS_EFFECT_ULTIMATE_COOLDOWN, 1200, 0);
                player_status_add(STATUS_EFFECT_DIZZY, 600,  1);
                obj_player.evilflame_twilight_fury = FALSE;
                obj_player.sprite_index = spr_evilflame;
            break;
        }
    }
}