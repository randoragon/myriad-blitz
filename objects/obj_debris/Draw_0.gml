/// @description skip if loading
if global.loading==1 exit;

///GENERAL_SURFACE set
surface_set_target(GENERAL_SURFACE);

///draw self & shader implementation

if sprite_exists(sprite_index) {
draw_set_alpha_test_ref_value(0);

if global.shader_conditions==0 {
draw_self();
} else {
shd_sprite_effect_set(global.shader_conditions);
if global.shader_conditions>=4 && global.shader_conditions<=7 {
draw_set_alpha(image_alpha);
if gpspeed!=0 draw_afterimage(30,0.1,1,0,4); else draw_afterimage_pause(0);
draw_set_alpha(1);
}
draw_self();
shader_reset();
}

draw_set_alpha_test_ref_value(254);
}

///SURFACE RESET
surface_reset_target();

