function scr_MonitorSurfacePages(){
	// This script takes care of recreating surfaces, had they been destroyed
	// (this happens for example when resizing the window). This script needs
	// to be run once per step when surface pages are being actively used, to
	// ensure a bug-free performance.
	
	var name = ds_map_find_first(global.surface_pages);

	for (var i = 0; i < ds_map_size(global.surface_pages); i++) {
		var page = global.surface_pages[? name];
		var sufs = page[1];
		
		for (var j = 0; j < ds_list_size(sufs); j++) {
			if (is_struct(sufs[| j]) && !surface_exists(sufs[| j].id)) {
				sufs[| j].id = surface_create(sufs[| j].size, sufs[| j].size);
				
				// Handle exceptional case for Bobileusz (see comment in scr_UpdateSurfacePages)
				if (global.chrsel == PLAYER_BOBILEUSZ && j == 0) {
					surface_set_target(sufs[| j].id);
					draw_clear(c_white);
					surface_reset_target();
				}
			}
		}
		
		name = ds_map_find_next(global.surface_pages, name);
	}
}