/// @description GUI_SURFACE set
surface_set_target(GUI_SURFACE);

///draw everything and stuff
if busy==start_busy {
draw_set_color(c_black);
draw_set_alpha(0.3);
draw_set_alpha_test_ref_value(0);
draw_set_blend_mode(bm_add);
draw_rectangle(CANVAS_X,CANVAS_Y,CANVAS_XEND,CANVAS_YEND,0);
draw_set_blend_mode(bm_normal);
draw_set_color_write_enable(1,1,1,0);
draw_rectangle(CANVAS_X,CANVAS_Y,CANVAS_XEND,CANVAS_YEND,0);
draw_set_color_write_enable(1,1,1,1);
draw_set_alpha(1);
draw_set_alpha_test_ref_value(254);
}
draw_self();

if string_length(keyboard_string)>26 keyboard_string=string_copy(keyboard_string,1,26);
draw_set_align(fa_left,fa_middle);
draw_text_transformed(x-208,y+16,string_hash_to_newline(string_replace(keyboard_string,"#","\\#")),3,3,0);

///SURFACE RESET
surface_reset_target();

