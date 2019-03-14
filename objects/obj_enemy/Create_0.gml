/// @description Setup

#region Inherit parent event

event_inherited();

#endregion

#region Setup

depth              = general_depth.enemy;
image_speed        = 0;
time_mark          = gptime;
loot               = ds_map_create();
sprite_index       = noone;

#endregion