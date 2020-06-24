/// @description Draw GUI

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw GUI

if (phase == 0) {
    if (++intro == 15) {
	    phase = 1;
	    global.loading = TRUE;
    }
} else if (phase == 2) {
    if (++intro == 30) {
        global.busy--;
        instance_destroy();
    }
}

draw_set_color(c_black);
draw_rectangle(CANVAS_XEND - ((intro / 15) * CANVAS_WIDTH), CANVAS_Y, CANVAS_X + (2 * CANVAS_WIDTH) - ((intro / 15) * CANVAS_WIDTH), CANVAS_YEND, 0);

if (phase == 1) {
    var percentage;
    percentage = progress / progress_max;
    draw_set_color(c_white);
    draw_rectangle(CANVAS_X + 300 - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 420, CANVAS_X + 300 + ((CANVAS_WIDTH - 600) * percentage) - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 450, 0);
    draw_set_align(fa_left, fa_top);
    draw_text_transformed(CANVAS_X + 300 - (CANVAS_WIDTH * ((intro - 15) / 15)), CANVAS_Y + 460, "SAVING... (" + string_format(100 * percentage, -1, 0) + "%)", 2, 2, 0);
}

#endregion

#region Reset surface

surface_reset_target();

#endregion