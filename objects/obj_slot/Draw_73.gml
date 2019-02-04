/// @description GUI_SURFACE set
surface_set_target(GUI_SURFACE);

///draw UI
draw_self();
draw_set_align(fa_center,fa_top);
if !version_check(ver) draw_set_color(c_red); else draw_set_color(c_black);
draw_text_transformed(x,y-(40*image_yscale),string_hash_to_newline(string_replace(name,"#","\\#")),2*image_xscale,2*image_yscale,0);
draw_text_full(x-(30*image_xscale),y-(15*image_yscale),global.realm_name[rlm],2*image_xscale,2*image_yscale,0,1,fa_left,fa_top,color_shift_hsv(image_blend,0,0,-160,1));
draw_text_full(x-(30*image_xscale),y+(5*image_yscale),"score: "+string(points),2*image_xscale,2*image_yscale,0,1,fa_left,fa_top,color_shift_hsv(image_blend,0,0,-160,1));
draw_text_full(x+(129*image_xscale),y+(43*image_yscale),"SAVE FROM: "+date,image_xscale,image_yscale,0,1,fa_right,fa_bottom,color_shift_hsv(image_blend,0,0,-200,1));
draw_set_alpha_test_ref_value(0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(spr_slot_char,char,x,y,image_xscale,image_yscale,0,c_white,1);
draw_set_blend_mode(bm_normal);
draw_set_color_write_enable(1,1,1,0);
draw_sprite_ext(spr_slot_char,char,x,y,image_xscale,image_yscale,0,c_white,1);
draw_set_color_write_enable(1,1,1,1);
draw_set_alpha_test_ref_value(254);

///SURFACE RESET
surface_reset_target();

