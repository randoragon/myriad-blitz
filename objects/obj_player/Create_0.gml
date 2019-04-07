/// @description Setup

#region General
      spawn = id;
 image_speed = 0.4 * global.gpspeed;
sprite_index = spr_evilflame + global.chrsel;
 image_alpha = 1;
 image_angle = 0;
           x = CANVAS_XMID;
		   y = CANVAS_YMID - 32;
		   
if (!global.loading) { // this code is run everytime the run resets
    scr_PlayerDataUpdate(global.chrsel);
    scr_PlayerGetData();
    scr_ParticlesUpdate();
	scr_BackgroundUpdate(global.realm);
    image_scale(2, 2);
}

#endregion

#region Status effects

for (var i = global.status_effect_count - 1; i >= 0; i--) {
	status_effect[i] = FALSE;
}

if (!global.loading) {
	global.player_status_effects = ds_grid_create(3, 0);
	ds_grid_clear(global.player_status_effects, -1);
}

#endregion

#region Inherit parent code

event_inherited();

#endregion