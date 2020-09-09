/// @description Post-processing

/* Some instances have pointers stored, or other kind of data
 * that highly depends on context that can't be stored in a save file.
 * In those kind of situations, post-processing is required to
 * adjust those objects' data so it behaves as expected.
 */

// Run code for various objects
with(obj_save_group) {
	
	// Update enemy details
	if (global.enemy_details_selection == previd) {
	    global.enemy_details_selection = id;
	}
	
	switch(object_index) {
		case obj_player:
		    spawn = id;
			if (version_ge(other.slotversion, "1.2.0")) {
			    with(obj_save_group) {
		            if (other.helper == previd) { other.helper = id; }
			    }
			} else {
				helper = instance_find(obj_wrap_helper, 0);
			}
		break;
		case obj_projectile:
			var found = FALSE;
			with(obj_save_group) {
		        if (other.spawn == previd) { other.spawn = id; found = TRUE; }
		    }
			if (!found && spawn != noone) {
				show_debug_message("WARNING: no spawn id found for " + object_get_name(object_index) + ", previd=" + string(spawn));
				spawn = instance_find(obj_player, 0);
			}
			
			if (global.chrsel == PLAYER_BOBILEUSZ) {
				suf1 = 0;
				surface_overlay = surface_page_capture("projectile", 250);
			}
		break;
		case obj_charge: case obj_minion:
			var found = FALSE;
		    with(obj_save_group) {
		        if (other.spawn == previd) { other.spawn = id; found = TRUE; }
		    }
			if (!found && spawn != noone) {
				show_debug_message("WARNING: no spawn id found for " + object_get_name(object_index) + ", previd=" + string(spawn));
				spawn = instance_find(obj_player, 0);
			}
		break;
		case obj_eprojectile:
			var found = FALSE;
		    with(obj_save_group) {
		        if (other.spawn == previd) { other.spawn = id; found = TRUE; }
		    }
			if (!found && spawn != noone) {
				show_debug_message("WARNING: no spawn id found for " + object_get_name(object_index) + ", previd=" + string(spawn));
			}
		break;
		case obj_frag:
			var found1 = FALSE, found2 = FALSE;
		    with(obj_save_group) {
		        if (other.spawn == previd) { other.spawn = id; found1 = TRUE; }
		        if (other.enemy = previd) { other.enemy = id; found2 = TRUE; }
		    }
			if (!found1 && spawn != noone) {
				show_debug_message("WARNING: no spawn id found for " + object_get_name(object_index) + ", previd=" + string(spawn));
				spawn = instance_find(obj_player, 0);
			}
			if (!found2 && enemy != noone) {
				show_debug_message("WARNING: no enemy id found for " + object_get_name(object_index) + ", previd=" + string(enemy));
				enemy = noone;
			}
			
			if (global.chrsel == PLAYER_BOBILEUSZ) {
				suf1 = 0;
				surface_overlay = surface_page_capture("projectile", 250);
			}
		break;
		case obj_evilflame_ultimate:
		    player = instance_find(obj_player, 0);
		break;
	}
}

progress++;