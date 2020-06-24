/// @description Loading

/* Make sure that audio groups are loaded
 * if their loading has been initialized
 * (otherwise list size is 0 so loop doesn't start).
 */
if (audio_groups_timeout) { exit; }
var audio_groups_loaded = TRUE;
for (var i = 0; i < ds_list_size(audio_groups); i++) {
	if (!audio_group_is_loaded(audio_groups[| i])) {
		audio_groups_loaded = FALSE;
		break;
	}
}

if (phase == 1 && audio_groups_loaded) {
	if (clock == 0) {
		// Encrypt line and add to search buffer
		line = flip_decode(line, save_key);
		data += line;
	
		// Find and apply portions of data
		var i;
		i = (line != "")? string_length(data) - string_length(line) - string_length(separator) + 2 : 1;
		line = "";
		while (i < string_length(data) - string_length(separator) + 2) {
			if (string_copy(data, i, 3) == separator) {
				// Extract data portion
				to_read = [string_copy(data, 1, i - 1)];
				data = string_delete(data, 1, i + 2);
			
				// If something was found, read it and apply it
				if (is_array(to_read)) {
					var type, args;
					type = string_readln_real(to_read);
					switch(type) {
						case SAVE_DATA_GLOBALS:
							args = [to_read[0], slotversion, new_seed, audio_groups];
							scr_LoadGlobals(args);
							slotversion  = args[1];
							new_seed	 = args[2];
							alarm[0]     = 300; // audio groups timeout
						break;
						case SAVE_DATA_STATUS_EFFECTS:
							args = [to_read[0], slotversion];
							scr_LoadStatusEffects(args);
						break;
						case SAVE_DATA_PART_SYSTEM:
							args = [to_read[0], slotversion];
							scr_LoadParticleSystem(args);
						break;
						case SAVE_DATA_PART_SLOTS:
							args = [to_read[0], slotversion];
							scr_LoadParticleSlots(args);
						break;
						case SAVE_DATA_INSTANCE:
							args = [to_read[0], slotversion];
							scr_LoadInstance(args);
						break;
						case SAVE_DATA_SOUND:
							args = [to_read[0], slotversion];
							scr_LoadSound(args);
						break;
						case SAVE_DATA_AFTERIMAGE:
							args = [to_read[0], slotversion];
							scr_LoadAfterimage(args);
						break;
					}	
					progress++;
				
					/* SAVE_DATA_GLOBALS initializes loading of audio groups,
					 * which is going to finish asynchronously. We can't load
					 * anything until it finishes, because sounds won't play
					 * unless their group is loaded.
					 */
					if (type == SAVE_DATA_GLOBALS) {
						/* By exiting here we skip reading a new line of file
						 * and instead line will stay at "" value, which will cause
						 * the iterator i to be set to 1, which is what we want,
						 * because we haven't necessarily finished reading all
						 * the information stored in the data string.
						 */
						exit;
					}
				}
				i = 0;
			}
			i++;
		}
	
		/* After everything available has been extracted and applied,
		 * pull more data from the file which will be examined in the
		 * next iteration of the step event.
		 */
		if (!file_text_eof(file)) {
			line = file_text_readbit(file);
		} else {
			// If we got through all the data, execute post-processing code and finish
			file_text_close(file);
			event_perform(ev_other, ev_user0);
			phase = 2;
			global.loading = FALSE;
			random_set_seed(new_seed);
			scr_Pause();
		}
	}

	clock = max(clock - 1, 0);
}