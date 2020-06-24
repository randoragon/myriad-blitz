/// @description Destroy audio_groups list

if (ds_exists(audio_groups, ds_type_list)) {
	ds_list_destroy(audio_groups);
}