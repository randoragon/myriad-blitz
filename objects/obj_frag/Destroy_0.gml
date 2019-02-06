/// @description Cleanup

#region Burst disperse particles

if (lifespan <= 0) {
	switch(f) {
		case 0:
			if (e != 2) {
				disperse_particles(global.part_system[5], x, x, y, y, irandom_range(3, 5), c_orange);
			} else {
				disperse_particles(global.part_system[5], x, x, y, y, irandom_range(3, 5), rgb(82, 0, 255));
			}
		break;
		case 2:
			if (e == 0 || e == 2) {
				disperse_particles(global.part_system[5], x, x, y, y, irandom_range(3, 5), c_yellow);
			} else if (e == 1 || e == 3) {
				disperse_particles(global.part_system[5], x, x, y, y, irandom_range(3, 5), c_red);
			}
		break;
		default:
			disperse_particles(global.part_system[5], x, x, y, y, irandom_range(3, 5), global.color[boss.chrsel]);
		break;
	}
}

#endregion

#region Destroy afterimage grid

draw_afterimage_remove();

#endregion