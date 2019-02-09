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

intro = 0;
phase = 0;

progress     = 0;
progress_max = 0;
inst_index   = 0;
inst_count   = -4;

line[0]  = "";
chunk[0] = "";

separator = "###";
clock     = 1;
interval  = 1 - (global.save_chunk_size > 500);

fname    = "";
save_key = "";
file     = -1;

#endregion

#region Increment busy

busy++;

#endregion
