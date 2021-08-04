/// @description Setup

/* Phase 0: black rectangle moving to cover the screen
 * Phase 1: saving all data
 * Phase 2: black rectangle moving out
 */

#region Setup

initial_seed = random_get_seed();

#endregion

#region Build Save Queue

/* For the progress bar and percentage to be calculatable during
 * slot loading, the progress_max variable must be saved inside the slot.
 * However, progress_max may vary from slot to slot, so it's necessary
 * to wait until the very end of enqueueing to have the accurate value.
 * That's why SAVE_DATA_GLOBALS is enqueued at the very end with a 
 * priority second only to SAVE_DATA_HEADER.
 */

queue = ds_priority_create();
enqueue_tuple(queue, SAVE_DATA_HEADER, 0, 100); // this part is unencrypted and MUST be first
progress_max++;
enqueue_tuple(queue, SAVE_DATA_STATUS_EFFECTS, 0);
progress_max++;

// Enqueue particle systems and particle slots
enqueue_tuple(queue, SAVE_DATA_PART_SYSTEM, PART_SYSTEM_PLAYERBOT_LT);
progress_max++;
enqueue_tuple(queue, SAVE_DATA_PART_SYSTEM, PART_SYSTEM_DAMAGE_INDICATORS_PRO);
progress_max++;
enqueue_tuple(queue, SAVE_DATA_PART_SYSTEM, PART_SYSTEM_FRAG_ULT);
progress_max++;
enqueue_tuple(queue, SAVE_DATA_PART_SYSTEM, PART_SYSTEM_CHARGE_ULT);
progress_max++;
enqueue_tuple(queue, SAVE_DATA_PART_SYSTEM, PART_SYSTEM_ENEMY_LT);
progress_max++;
enqueue_tuple(queue, SAVE_DATA_PART_SYSTEM, PART_SYSTEM_PLAYERTOP_LT);
progress_max++;
enqueue_tuple(queue, SAVE_DATA_PART_SYSTEM, PART_SYSTEM_ULTIMATE_LT);
progress_max++;
enqueue_tuple(queue, SAVE_DATA_PART_SYSTEM, PART_SYSTEM_MINION_LT);
progress_max++;
enqueue_tuple(queue, SAVE_DATA_PART_SLOTS, global.part_type_pro_slots);
progress_max++;
enqueue_tuple(queue, SAVE_DATA_PART_SLOTS, global.part_type_lt_slots);
progress_max++;
enqueue_tuple(queue, SAVE_DATA_PART_SLOTS, global.part_type_ult_slots);
progress_max++;

// Enqueue all instances within save group
for (var i = 0; i < instance_count; i++) {
	var instance = instance_id_get(i);
	if (object_is_ancestor(instance.object_index, obj_save_group)) {
	    enqueue_tuple(queue, SAVE_DATA_INSTANCE, instance);
		progress_max++;
		
		// If instance has afterimage grid, enqueue it
		// Note that afterimage should never be saved earlier than its "host"
		if (variable_instance_exists(instance, "afterimage_ds_grid") && ds_exists(instance.afterimage_ds_grid, ds_type_grid)) {
			enqueue_tuple(queue, SAVE_DATA_AFTERIMAGE, instance, -1);
			progress_max++;
		}
	}
}

// Enqueue all music and sfx
for (var i = 0; i < array_length(global.music); i++) {
	var snd = global.music[i];
	if (audio_exists(snd) && audio_is_playing(snd)) {
		enqueue_tuple(queue, SAVE_DATA_SOUND, snd);
		progress_max++;
	}
}
for (var i = 0; i < array_length(global.sfx); i++) {
	var snd = global.sfx[i];
	if (audio_exists(snd) && audio_is_playing(snd)) {
		enqueue_tuple(queue, SAVE_DATA_SOUND, snd);
		progress_max++;
	}
}

enqueue_tuple(queue, SAVE_DATA_GLOBALS, progress_max + 1, 99); // this part MUST be second (for obj_slot_load)

#endregion

#region Increment global.busy

global.busy++;

#endregion