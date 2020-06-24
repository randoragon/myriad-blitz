/// @description Load Data

#region Phase 1 - Fetching Data

if (phase == 1 && clock-- <= 0) {
    chunk[progress++] = file_text_readbit(file);
    if (progress<progress_max) {
        chunk[progress++] = file_text_readbit(file);
    }
    clock = interval;
    if (progress >= progress_max) {
        file_text_close(file);
        phase        = 2;
        interval     = 1 - (global.save_chunk_size > 500);
        clock        = interval;
        progress     = 0;
        progress_max = array_length_1d(chunk);
        with (obj_save_group) {
			instance_destroy();
        }
    }
}

#endregion

#region Phase 2 - Decrypting Data

if (phase == 2 && clock-- <= 0) {
    chunk[progress] = flip_decode(chunk[progress], save_key);
    progress += 1;
    clock = interval;
    if (progress >= progress_max) {
        progress   = 0;
        phase      = 3;
        interval   = 2 * (global.save_chunk_size <= 500);
        clock      = interval;
        data       = "";
        inst_index = 0;
        inst_count = array_length_1d(chunk);
    }
}

#endregion

#region Phase 3 - Rearranging Data

if (phase == 3 && clock-- <= 0) {
    var index0 = inst_index;
    var pos;
    while (inst_index < array_length_1d(chunk)) {
        pos = string_pos(separator, chunk[inst_index]);
        //found in the middle
        if (pos != 0) {
            break;
        }
        else {
            //end of chunks
            if (inst_index == array_length_1d(chunk) - 1) {
                pos = string_length(chunk[inst_index]) + 1;
                break;
            } else
            //intersection 2:1
            if (string_copy(chunk[inst_index], string_length(chunk[inst_index]) - 1, 2) == string_copy(separator, 1, 2)) {
                if (string_char_at(chunk[inst_index + 1], 1) == string_char_at(separator, 3)) {
                    pos = string_length(chunk[inst_index]) - 1;
                    break;
                }
            } else
            //intersection 1:2
            if (string_char_at(chunk[inst_index], string_length(chunk[inst_index])) == string_char_at(separator, 1)) {
                if (string_copy(chunk[inst_index + 1], 1, 2) == string_copy(separator, 2, 2)) {
                    pos = string_length(chunk[inst_index]);
                    break;
                }
            } else {
            inst_index += 1;
            }
        }
    }
    
    line[progress] = "";
    for (var i = index0; i < inst_index; i += 1) {
        line[progress] += chunk[i];
        chunk[i] = "";
    }
    
    line[progress] += string_copy(chunk[inst_index], 1, pos - 1);
    if (pos < string_length(chunk[inst_index]) - 2) {
        chunk[inst_index] = string_delete(chunk[inst_index], 1, pos + 2);
    } else {
        var intersection = string_length(chunk[inst_index]) - pos + 1; //this is how many characters of the separator are at the end of the chunk (3, 2 or 1)
        chunk[inst_index] = "";
        inst_index += 1;
        if (inst_index < inst_count) {
            chunk[inst_index] = string_delete(chunk[inst_index], 1, 3 - intersection);
        }
    }
    
    progress += 1;
    clock = interval;
    if (inst_index >= inst_count) {
        interval     = 2 * (global.save_chunk_size <= 500);
        clock        = interval;
        phase        = 4;
        data         = "";
        progress     = 0;
        progress_max = array_length_1d(line);
    }
}

#endregion

#region Phase 4 - Applying Data

if (phase == 4 && clock-- <= 0) {
	scr_obj_loading_applying_data_legacy();
}

#endregion

#region Phase 5 - Reassigning Pointers

if (phase == 5) {
	scr_UpdateSurfacePages();
	with (obj_save_group) {
	    if (global.enemy_details_selection == previd) {
	        global.enemy_details_selection = id;
	    }
	    switch(object_index) {
		    case obj_player:
		        spawn = id;
		        with (obj_save_group) {
	                if (other.helper == previd) other.helper = id;
		        }
		    break;
		    case obj_projectile:
				with (obj_save_group) {
		            if (other.spawn == previd) other.spawn = id;
		        }
				if (global.chrsel == PLAYER_BOBILEUSZ) {
					suf1 = surface_page_index("projectile", 0);
					surface_overlay = surface_page_capture("projectile", 250);
				}
			break;
			case obj_charge: case obj_eprojectile:
		        with (obj_save_group) {
		            if (other.spawn == previd) other.spawn = id;
		        }
		    break;
		    case obj_frag:
		        with (obj_save_group) {
		            if (other.spawn == previd) other.spawn = id;
		            if (other.enemy = previd) other.enemy = id;
		        }
				if (global.chrsel == PLAYER_BOBILEUSZ) {
					suf1 = surface_page_index("projectile", 0);
					surface_overlay = surface_page_capture("projectile", 250);
				}
		    break;
		    case obj_evilflame_ultimate:
		        player = instance_find(obj_player, 0);
		    break;
	    }
	}

	phase = 6;
	global.loading = FALSE;
	random_set_seed(new_seed);
	scr_Pause();	
}

#endregion