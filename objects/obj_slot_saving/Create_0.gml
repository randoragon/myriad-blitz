/// @description Setup

/* Phase 0: black rectangle moving to cover the screen
 * Phase 1: fetching all data
 * Phase 2: parsing all data into chunks
 * Phase 3: encrypting all chunks
 * Phase 4: writing all chunks to the file
 * Phase 5: black rectangle moving out
 */

#region Setup

chunk_length = global.save_chunk_size;
interval	 = 2 * (global.save_chunk_size <= 500);

#endregion

#region Increment global.busy

global.busy++;

#endregion