/// @description Save to slot

if (phase == 1) {
	if (clock == 0) {
		var item, type, value, args;
		item  = ds_priority_delete_max(queue);
		type  = item[0];
		value = item[1];

		/* Various save scripts will append save information to the data string.
		 * After each append operation, if the data string exceeds save chunk size,
		 * chunks will be written to the file and the data string will be left with
		 * the remainder. This way we don't need exorbitant amount of memory to process
		 * all save data, and everything can be taken care of in an orderly way.
		 * HOWEVER, for this to work, each SAVE_DATA type shouldn't append more than
		 * a chunk size worth of data (it's not obligatory, but will add slight overhead).
		 */

		switch(type) {
			case SAVE_DATA_HEADER:
				/* The header consists of three unencrypted lines:
				 * - slot disclaimer
				 * - name of the slot
				 * - datetime
				 * 
				 * In this stage first initialization is done, we obtain
				 * the file path, the encryption key (datetime) and open
				 * the save file for writing.
				 */
				args = [slotname, fpath, save_key];
				scr_SaveHeader(args);
				fpath = args[1];
				save_key = args[2];
				
				file = file_text_open_write(fpath);
				file_text_write_string(file, SLOT_DISCLAIMER);
				file_text_writeln(file);
				file_text_write_string(file, slotname);
				file_text_writeln(file);
				file_text_write_string(file, save_key);
				file_text_writeln(file);
			break;
			case SAVE_DATA_GLOBALS:
				args = [data, separator, progress_max];
				scr_SaveGlobals(args);
				data = args[0];
			break;
			case SAVE_DATA_STATUS_EFFECTS:
				args = [data, separator];
				scr_SaveStatusEffects(args);
				data = args[0];
			break;
			case SAVE_DATA_PART_SYSTEM:
				args = [data, separator, value];
				scr_SaveParticleSystem(args);
				data = args[0];
			break;
			case SAVE_DATA_PART_SLOTS:
				args = [data, separator, value];
				scr_SaveParticleSlots(args);
				data = args[0];
			break;
			case SAVE_DATA_INSTANCE:
				args = [data, separator, value];
				scr_SaveInstance(args);
				data = args[0];
			break;
			case SAVE_DATA_SOUND:
				args = [data, separator, value];
				scr_SaveSound(args);
				data = args[0];
			break;
			case SAVE_DATA_AFTERIMAGE:
				args = [data, separator, value];
				scr_SaveAfterimage(args);
				data = args[0];
			break;
			case undefined:
				// Do nothing, this means the queue is empty.
			break;
			default:
				/* In case of unknown save data, abort loading, because
				 * the only possible way this can happen is if somehow
				 * the save queue is corrupt due to an error in code.
				 */
				display_message("Failed to save.\nThis is most likely a bug,\nplease send a report.", scrm_do_nothing);
				file_text_close(file);
				file_delete(fpath);
				phase = 2;
				progress = progress_max;
		}
		
		// Write off chunk sized strings to the text file
		while (string_length(data) >= global.save_chunk_size) {
			var chunk = string_copy(data, 0, global.save_chunk_size);
			data = string_delete(data, 1, global.save_chunk_size);
			file_text_write_string(file, flip_encode(chunk, save_key));
			file_text_writeln(file);
		}
		
		// Finish loading
		if (ds_priority_empty(queue)) {
			// Write the remainder
			if (string_length(data) > 0) {
				file_text_write_string(file, flip_encode(data, save_key));
				file_text_writeln(file);
			}
			file_text_close(file);
			phase = 2;
			global.loading = FALSE;
			randomize();
			random_set_seed(initial_seed);
		} else {
			progress++;
		}
	}
	
	clock = max(clock - 1, 0);
}