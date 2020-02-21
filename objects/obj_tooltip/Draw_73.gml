/// @description Draw tooltips

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw tooltips

while (ds_queue_size(global.tooltips)) {
	// Reads the tooltip-formatted string off the tooltip queue
	var str = ds_queue_dequeue(global.tooltips);
	
	// The tooltip string is of format "%TextColor%BackgroundColor%BorderColor%Text" (without %s)
	// All colors are stored in RRRGGGBBB format
	var textcol = rgb(real(string_copy(str, 1, 3)), real(string_copy(str, 4, 3)), real(string_copy(str, 7, 3)));
	var bgcol   = rgb(real(string_copy(str, 10, 3)), real(string_copy(str, 13, 3)), real(string_copy(str, 16, 3)));
	var bdcol   = rgb(real(string_copy(str, 19, 3)), real(string_copy(str, 22, 3)), real(string_copy(str, 25, 3)));
	var text	= string_copy(str, 28, string_length(str) - 27);
	draw_tooltip_raw(text, textcol, bgcol, bdcol);
}

#endregion

#region Reset surface

surface_reset_target();

#endregion