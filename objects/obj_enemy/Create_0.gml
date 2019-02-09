/// @description Setup

#region Inherit parent event

event_inherited();

#endregion

#region Setup

depth              = general_depth.enemy;
image_speed        = 0;
cooldown           = 60;
time_mark          = gptime;
touchable          = 1;
hp                 = -1;
loot               = ds_map_create();
sprite_index       = noone;
afterimage_ds_grid = -1;
bar_extension      = 0;

#endregion