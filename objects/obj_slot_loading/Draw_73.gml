/// @description Draw GUI

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw GUI

if (phase == 0) {
    if (++intro == 15) {
		// Prepare file for reading
        file = file_text_open_read(fpath);
        file_text_readln(file); // skip slot disclaimer
        file_text_readln(file); // skip slot name
        save_key = file_text_readbit(file);
        
		// Extract progress_max but leave the line in tact for actual loading
		line = file_text_readbit(file);
		var line_ = [flip_decode(line, save_key)];
		repeat(5) {	string_readln(line_); }
		progress_max = string_readln_real(line_) + 1; // add one for post-processing
		
		// Start the actual loading
        phase			  = 1;
        global.loading	  = TRUE;
        global.state	  = 1;
        global.transition = 1;
        room_goto(rm_Main);
    }
} else if (phase == 2) {
    if (++intro == 30) {
        global.busy--;
        instance_destroy();
    }
}

draw_set_color(c_black);
draw_rectangle(CANVAS_XEND - ((intro / 15) * CANVAS_WIDTH), CANVAS_Y, CANVAS_X + (2 * CANVAS_WIDTH) - ((intro / 15) * CANVAS_WIDTH), CANVAS_YEND, 0);

// The black rectangle covers the popup message, so draw it on top
if (audio_groups_timeout) {
	with(obj_popup_message) {
		event_perform(ev_draw, ev_draw_end);
	}
}

if (phase == 1) {
    var percentage;
    percentage = progress / progress_max;
    draw_set_color(c_white);
    draw_rectangle(CANVAS_X + 300 - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 420, CANVAS_X + 300 + ((CANVAS_WIDTH - 600) * percentage) - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 450, 0);
    draw_set_align(fa_left, fa_top);
    draw_text_transformed(CANVAS_X + 300 - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 460, "LOADING... (" + string_format(100 * percentage, -1, 0) + "%)", 2, 2, 0);
	draw_set_color(c_black);
}

#endregion

#region Reset surface

surface_reset_target();

#endregion