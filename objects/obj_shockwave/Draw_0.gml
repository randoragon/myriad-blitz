/// @description skip if loading
if global.loading==1 exit;

///GENERAL_SURFACE set
surface_set_target(GENERAL_SURFACE);

///drawing
image_alpha-=maxalpha/time;
draw_set_alpha(1-(radius/maxradius));
draw_set_circle_precision(clamp(4*floor(2*pi*radius/16),4,64));
draw_set_color(image_blend);
draw_set_alpha(image_alpha);
draw_set_alpha_test_ref_value(0);
for(var i=0; i<image_xscale; i++) {
    draw_circle(x,y,radius-(image_xscale/2)+(i/image_xscale),1);
}
draw_set_alpha_test_ref_value(254);


///SURFACE RESET
surface_reset_target();

