/// @description Setup
/*
Phase 0: black rectangle moving to cover the screen
Phase 1: fetching all data
Phase 2: re-parsing the data back
Phase 3: decrypting all data
Phase 4: importing data onto variables
Phase 5: black rectangle moving out
*/

#region Setup

interval  = 1 - (global.save_chunk_size > 500);

#endregion

#region Increment global.busy

global.busy++;

#endregion
