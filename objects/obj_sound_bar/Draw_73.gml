/// @description GUI_SURFACE set
surface_set_target(GUI_SURFACE);

///draw self & dot
draw_self();
draw_sprite_ext(spr_slider_dot,grabbed,xdot,ydot,1,1,0,image_blend,1);
draw_set_color(c_white);
draw_set_align(fa_center,fa_middle);
draw_text_transformed(xdot+1,ydot,string_hash_to_newline(string(floor(val))),2,2,0);

///SURFACE RESET
surface_reset_target();

