/// @description Cleanup

#region Clear particles

if (lifespan <= 0) {
	switch(f) {
		case 0:
			disperse_particles(global.part_system[5], x, x, y, y, irandom_range(2, 3), c_white);
		break;
		case 1:
			disperse_particles(global.part_system[5], x, x, y, y, irandom_range(2, 3), c_aqua);
		break;
		case 2:
			disperse_particles(global.part_system[5], x, x, y, y, irandom_range(2, 3), c_red);
		break;
	}
}

#endregion


#region Destroy afterimage grid

draw_afterimage_remove();

#endregion