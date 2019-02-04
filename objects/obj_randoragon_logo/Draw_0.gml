/// @description draw self & text
surface_set_target(GENERAL_SURFACE);
draw_set_alpha_test_ref_value(0);
draw_self();
draw_sprite_ext(spr_randoragon_caption,0,x,y+200,0.5,0.5,0,c_white,text_alpha);
draw_set_alpha_test_ref_value(254);
surface_reset_target();

