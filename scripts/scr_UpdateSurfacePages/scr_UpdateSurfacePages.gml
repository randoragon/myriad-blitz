/// @description scr_SurfaceMapUpdate()

// Beware that this script is run in two occassions:
// 1) at the start of a run
// 2) at the end of slot loading
//
// Take great care what you put into it, especially with respect to 2).

surface_page_clearall();

switch(global.chrsel) {
	case PLAYER_BOBILEUSZ:
		surface_page_create("projectile");
		surface_page_allocate("projectile", 250, 100);
		// Bobileusz bullets all require a pitch white surface
		// to cast to another surface so that the quadrangle shader
		// creates a quadrangle. It's pointless to have them capture
		// and release this surface over and over, because only one
		// is really needed. So, as a convention, when playing as Bobileusz
		// the first surface on the surface page is reserved for
		// the bullets to use and is colored pitch white.
		surface_set_target(surface_page_capture("projectile", 250));
		draw_clear(c_white);
		surface_reset_target();
	break;
}