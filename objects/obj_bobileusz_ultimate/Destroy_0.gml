/// @description Burst into icicles

audio_sound_gain(sfx_bobileusz_prism_idle1, 0, 500);
audio_sound_gain(sfx_bobileusz_prism_idle2, 0, 500);
audio_sound_gain(sfx_bobileusz_prism_idle3, 0, 500);
disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x-20, x+20, y-40, y+40, 60, c_white);
part_type_spawn_lt(PART_SYSTEM_PLAYERTOP_LT, PART_TYPE_P_BOBILEUSZ_SNOWFLAKE_LT, 0, x-20, y-20, x+20, y+20, "ellipse", "linear", 40);
spawn_bullet_ring(x, y, obj_frag, global.chrsel, 1, noone, instance_find(obj_player, 0), irandom_range(5, 7), 0);