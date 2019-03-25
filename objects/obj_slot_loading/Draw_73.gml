/// @description Draw GUI

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw GUI

if (phase == 0) {
    if (++intro == 15) {
        var temp_file = file_text_open_read(fname);
        progress_max = 0;
        file_text_readln(temp_file);
        file_text_readln(temp_file);
        save_key = file_text_readbit(temp_file); //leave the last 2 characters out
        while (!file_text_eof(temp_file)) {
            file_text_readln(temp_file);
			progress_max += 1;
        }
        file_text_close(temp_file);
        
        file = file_text_open_read(fname);
        file_text_readln(temp_file); //skip the disclaimer
        file_text_readln(temp_file); //skip slot title
        file_text_readln(temp_file); //skip slot date
        
        phase			= 1;
        global.loading	= true;
        global.state			= 1;
        global.transition = 1;
        room_goto(rm_Main);
    }
} else if (phase == 6) {
    if (++intro == 30) {
        global.busy--;
        instance_destroy();
    }
}

draw_set_color(c_black);
draw_rectangle(CANVAS_XEND - ((intro / 15) * CANVAS_WIDTH), CANVAS_Y, CANVAS_X + (2 * CANVAS_WIDTH) - ((intro / 15) * CANVAS_WIDTH), CANVAS_YEND, 0);

if (phase != 0 && phase != 5 && phase != 6) {
    var caption;
    switch(phase) {
	    case 1: caption = "reading"; break;
	    case 2: caption = "decrypting"; break;
	    case 3: caption = "rearranging"; break;
	    case 4: caption = "applying"; break;
    }
    var percentage;
    if (phase != 3) {
        percentage = progress / progress_max;
    } else {
        percentage = inst_index / inst_count;
    }
    draw_set_color(c_white);
    draw_rectangle(CANVAS_X + 300 - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 420, CANVAS_X + 300 + ((CANVAS_WIDTH - 600) * percentage) - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 450, 0);
    draw_set_align(fa_left, fa_top);
    draw_text_transformed(CANVAS_X + 300 - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 460, string_hash_to_newline("LOADING " + string(phase) + "/4 " + caption + "... (" + string_format(100 * percentage, -1, 0) + "%)"), 2, 2, 0);
}

#endregion

#region Reset surface

surface_reset_target();

#endregion