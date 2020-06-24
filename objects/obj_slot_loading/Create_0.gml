/// @description Setup
/*
Phase 0: black rectangle moving to cover the screen
Phase 1: loading
Phase 2: black rectangle moving out
*/

#region Setup

/* This list stores IDs of audio groups that
 * need to be loaded.
 */
audio_groups = ds_list_create();

#endregion

#region Increment global.busy

global.busy++;

#endregion
