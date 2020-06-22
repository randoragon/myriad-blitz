/// @description scr_SurfaceMapUpdate()

surface_map_clear();

switch(global.chrsel) {
	case PLAYER_BOBILEUSZ:
		surface_map_allocate(250, 100);
		// Bobileusz bullets all require a pitch white surface
		// to cast to another surface so that the quadrangle shader
		// creates a quadrangle. It's pointless to have them capture
		// and release this surface over and over, because only one
		// is really needed. So, as a convention, when playing as Bobileusz
		// the first surface on the surface map list is reserved for
		// the bullets to use and is colored pitch white.
		surface_set_target(surface_map_capture(250));
		draw_clear(c_white);
		surface_reset_target();
	break;
}