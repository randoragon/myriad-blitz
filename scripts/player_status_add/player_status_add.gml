/// @description player_status_add(statusid, duration, relative);
/// @param statusid
/// @param duration
/// @param relative

// To add a permanent status use anything below -1 as duration.
// To erase a permanent status use 0 as duration AND set relative to 0.

// check if the status effect already exists, in which case you're supposed to add to the timer, rather than creating a duplicate status effect
if (ds_grid_value_exists(global.player_status_effects, 0, 0, 0, ds_grid_height(global.player_status_effects), argument[0])) {
    var y_index = ds_grid_value_y(global.player_status_effects, 0, 0, 0, ds_grid_height(global.player_status_effects), argument[0]);
    if (argument[2]) {
        ds_grid_add_region(global.player_status_effects, 1, y_index, 2, y_index, argument[1]);
    } else {
        ds_grid_set_region(global.player_status_effects, 1, y_index, 2, y_index, argument[1]);
    }
    exit;
}

// make room for new status effect
ds_grid_resize(global.player_status_effects, 3, ds_grid_height(global.player_status_effects) + 1);

// move the old status effects one row lower, to make room for the new status effect
ds_grid_set_grid_region(global.player_status_effects, global.player_status_effects, 0, 0, 2, ds_grid_height(global.player_status_effects) - 2, 0, 1);

// set the top row to the new status effect
global.player_status_effects[# 0, 0] = argument[0];
global.player_status_effects[# 1, 0] = argument[1];
global.player_status_effects[# 2, 0] = argument[1];

// update player status_effect array
obj_player.status_effect[argument[0]] = true;

/* STATUS EFFECTS:
 * 0 - Exhausted
 * 1 - Magic Fatigue
 * 2 - Spell-Dried
 * 3 - Paralyzed
 * 4 - Dizzy
 * 5 - Dual Clone
 * 6 - Ultimate Cooldown
 * 7 - Current Crush
 * 8 - Chip Tuning
 * 9 - Twilight Fury
 * 10 - Berserk
 */

