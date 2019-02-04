/// @description hiding
y=ystart+(350*boss.transition);
if y==ystart+350 && osc!=-1 {wipe(osc); osc=-1; if state==1 instance_destroy();}
if y<ystart+350 && !instance_exists(osc) osc=fx_wave(3,4,-3,-4,1,30,0,-1,3,4,-3,-4,3,45,0,-1);

