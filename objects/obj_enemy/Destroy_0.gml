/// @description Cleanup

#region Destroy loot ds_map

ds_map_destroy(loot);

#endregion

#region Destroy afterimage grid

draw_afterimage_remove();

#endregion

#region Clean lingering instance IDs related to this instance

with(obj_eprojectile) {
	if (spawn == other.id) {
		spawn = noone;
	}
}

with(obj_frag) {
	if (enemy == other.id) {
		enemy = noone;
	}
}

#endregion