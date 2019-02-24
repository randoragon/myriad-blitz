/// @description player_status_update();

ds_grid_add_region(player_status_effects, 1, 0, 1, ds_grid_height(player_status_effects) - 1, -gpspeed);

if (ds_grid_get_min(player_status_effects, 1, 0, 1, ds_grid_height(player_status_effects) - 1) >= -1 && ds_grid_get_min(player_status_effects, 1, 0, 1, ds_grid_height(player_status_effects) - 1) <= 0) {
    for (var i = 0; i < ds_grid_height(player_status_effects); i++) {
        if (player_status_effects[# 1, i] <= 0 && player_status_effects[# 1, i] >= -1) {
            // update player status_effect array
            var deceased_effect_id = player_status_effects[# 0, i];
            obj_player.status_effect[deceased_effect_id] = 0;

            // get rid of the used cooldown
            if (i < ds_grid_height(player_status_effects) - 1) {
                ds_grid_set_grid_region(player_status_effects, player_status_effects, 0, i + 1, 2, ds_grid_height(player_status_effects) - 1, 0, i);
                i--;
            }
            if (ds_grid_height(player_status_effects) > 1) {
                ds_grid_resize(player_status_effects, 3, ds_grid_height(player_status_effects) - 1);
            } else {
                ds_grid_destroy(player_status_effects);
                player_status_effects = ds_grid_create(3, 0);
            }

            // aftereffects
            switch (deceased_effect_id) {
                case 8:
                    player_status_add(6, obj_player.ucooldown, 0);
                    global.gpspeed_ultimate = 1;
                break;
                case 9:
                    player_status_add(6, 1200, 0);
                    player_status_add(4, 600,  1);
                    obj_player.evilflame_twilight_fury = 0;
                    obj_player.sprite_index = spr_evilflame;
                break;
            }
        }
    }
}