/// @description skip if loading
if global.loading==1 exit;

///GENERAL_SURFACE set
surface_set_target(GENERAL_SURFACE);

///emerald - current crush
image_xscale*=sign(rot);
draw_self();
image_xscale*=sign(rot);

///SURFACE RESET
surface_reset_target();

