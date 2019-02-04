/// @description skip if loading
if global.loading==1 exit;

///event_inherited();
event_inherited();

///setup

if obj_player.hp<obj_player.hpmax f=irandom(1);
else {
if instance_exists(obj_evilflame_ultimate) && obj_evilflame_ultimate.hp<obj_evilflame_ultimate.hpmax
f=irandom(1);
else f=1;
}
number=0;
if f==0 number=irandom_range(ceil(global.hp*0.1),ceil(global.hp*0.2));
hspeed1=-4;
picked=0;
wave_cycle=0;
image_speed=0;
image_scale(3,3);
switch(f)
{
case 0: image_index=0; break;
case 1: image_index=boss.chrsel+1; break;
}

afterimage_ds_grid=-1;

///fetch enum depth
depth=general_depth.present;

