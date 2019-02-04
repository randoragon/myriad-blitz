/// @description skip if loading
if global.loading==1 exit;

///setup
instance_setup(0,0,random(360),0.5);
clock=irandom_range(60,160);
depth=general_depth.emerald_ultimate_flow_top;

///event_inherited()
event_inherited();

