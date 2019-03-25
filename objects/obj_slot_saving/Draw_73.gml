/// @description Draw GUI

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw GUI

if (phase == 0) {
    if (++intro == 15) {
	    phase      = 1;
	    inst_count = 0;
	    for (var i = 0; i < instance_count; i++) {
	        if (object_is_ancestor(instance_id_get(i).object_index, obj_save_group)) {
	            inst_id[inst_count] = instance_id_get(i);
	            inst_count++;
	        }
	    }
	    global.loading = true;
    }
} else if (phase == 5) {
    if (++intro == 30) {
        global.busy--;
        instance_destroy();
    }
}

draw_set_color(c_black);
draw_rectangle(CANVAS_XEND - ((intro / 15) * CANVAS_WIDTH), CANVAS_Y, CANVAS_X + (2 * CANVAS_WIDTH) - ((intro / 15) * CANVAS_WIDTH), CANVAS_YEND, 0);

if (phase != 0 && phase != 5) {
    var caption;
    switch(phase) {
	    case 1: caption = "fetching";   break;
	    case 2: caption = "parsing";    break;
	    case 3: caption = "encrypting"; break;
	    case 4: caption = "writing";    break;
    }
    var percentage;
    if (phase != 1) {
        percentage = progress / progress_max;
    } else {
        percentage = (progress + inst_index) / (progress_max + inst_count);
    }
    draw_set_color(c_white);
    draw_rectangle(CANVAS_X + 300 - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 420, CANVAS_X + 300 + ((CANVAS_WIDTH - 600) * percentage) - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 450, 0);
    draw_set_align(fa_left, fa_top);
    draw_text_transformed(CANVAS_X + 300 - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 460, string_hash_to_newline("SAVING " + string(phase) + "/4 " + caption + "... (" + string_format(100 * percentage, -1, 0) + "%)"), 2, 2, 0);
}

#endregion

#region Reset surface

surface_reset_target();

#endregion