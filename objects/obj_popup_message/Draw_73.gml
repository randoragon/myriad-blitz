/// @description Draw Content

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw content

if (global.busy == start_busy) {
	screen_darken(image_xscale * (3 - (global.gpspeed == 0 || instance_exists(obj_slot_load))) / 4); //basically it's 0.75, but it lowers to 0.5 if global.gpspeed==0 or slot_load exists
}
draw_self();
draw_set_align(fa_left, fa_middle);
draw_text_transformed(x - (210 * image_xscale), y - (15 * image_yscale), string_hash_to_newline(content), image_xscale * 2, image_yscale * 2, 0);

#endregion

#region Reset surface

surface_reset_target();

#endregion