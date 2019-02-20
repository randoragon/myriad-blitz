/// @description Cleanup

#region Destroy afterimage grid

draw_afterimage_remove();

#endregion

#region Destroy custom sprites

if (custom_sprite == 0) {
	sprite_delete(sprite_index);
}

#endregion