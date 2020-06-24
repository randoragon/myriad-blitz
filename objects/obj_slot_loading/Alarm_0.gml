/// @description Audio groups loading timeout

/* If, for some inexplicable reason, audio groups
 * take forever to load and won't ever stop,
 * this alarm code will execute and terminate loading.
 */

audio_groups_timeout = TRUE;
display_message("ERROR\nTimeout reached while loading audio\ngroups, please report this.\nLoading failed.", scrm_abort_loading);
