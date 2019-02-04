/// @description setup
sprite_index=spr_logo_spelled;
x=x-sprite_get_xoffset(spr_logo)+sprite_xoffset;
xstart=x;
y=y-sprite_get_yoffset(spr_logo)+sprite_yoffset;
ystart=y;
sprite_index=0;
image_speed=0;

xx=array_setup(0,11);
yy=array_setup(0,11);
xscale=array_setup(1,11);
yscale=array_setup(1,11);
angle=array_setup(0,11);
effect=array_setup(-1,11);
effect_progress=array_setup(30,11);
var delay=10;
for(var i=0; i<11; i++) effect_clock[i]=60+(i*delay);


