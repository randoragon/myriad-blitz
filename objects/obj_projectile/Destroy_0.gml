/// @description Cleanup

#region Burst Disperse Particles

if (lifespan <= 0) {
	switch(f) {
		case PLAYER_EVILFLAME:
			if (e != 2) {
				disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), c_orange);
			} else {
				disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), rgb(82, 0, 255));
			}
		break;
		case PLAYER_DER_SCOOTOMIK:
			if (e == 0) {
				disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), c_yellow);
			} else if (e == 1) {
				disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), c_red);
			}
		break;
		case PLAYER_BOBILEUSZ:
			if (e == 0) {
				disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), rgb(255, 255, 128));
				surface_page_release("projectile", surface_overlay);
			} else {
				disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), rgb(25, 165, 255));
			}
			spawn_bullet_ring(x, y, obj_frag, PLAYER_BOBILEUSZ, 1, -1, spawn, irandom_range(5, 7), 0);
			play_sfx(sfx_bobileusz_icicle_burst, 0, random_range(90, 110));
		break;
		default:
			disperse_particles(PART_SYSTEM_PLAYERTOP_LT, x, x, y, y, irandom_range(3, 5), global.color[global.chrsel]);
		break;
	}
}

#endregion

#region Destroy the afterimage grid

draw_afterimage_remove();

#endregion