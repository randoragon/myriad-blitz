/// @description skip if loading
if global.loading==1 exit;

///countdown
clock-=gpspeed;
if clock<=0 instance_destroy();
image_alpha=(clock/60)+0.2;

