/// @description Cleanup

#region Destroy sprites

if (sprite_index != noone) {
	for (var i = 0; i < array_length(cut1); i++) {
		sprite_delete(cut1[i]); 
		cut1[i] = -4;
	}

	for (var i = 0; i < array_length(cut2); i++) {
		sprite_delete(cut2[i]);
		cut2[i] = -4;
	}
}

#endregion