/// @description skip if loading
if global.loading==1 exit;

///setup

with(obj_projectile) speed1/=2;
with(obj_frag) speed1/=2;

depth=general_depth.emerald_ultimate_center;
image_scale(0,0);
scale_v=0; scale_stage=0;
rot=choose(5,-5);
image_speed=0.5*gpspeed;
rot_cycle=irandom(360);
spawn_clock=60;
lifespan=900; //15 seconds long lifespan

///event_inherited()
event_inherited();

