/// @description Draw Self

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw self

screen_darken(0.75);
draw_self();
draw_set_align(fa_center, fa_middle);
if (slotcount == 0) {
	draw_text_transformed(x, y, "You don't have any slot saves yet,\nyou can make one by accessing\nthe pause menu while playing.", 2, 2, 0);
} else {
	draw_text_transformed(x, y + 210, string_replace(string_format(page + 1, 2, 0), " ", "0") + "/" + string_replace(string_format(ceil((array_length_1d(slot) - 1) / 6), 2, 0), " ", "0"), 2, 2, 0);
}

#endregion

#region Reset surface

surface_reset_target();

#endregion