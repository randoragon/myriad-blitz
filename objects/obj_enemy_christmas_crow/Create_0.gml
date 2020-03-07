/// @description Setup

#region Inherit parent event 

event_inherited();

#endregion

#region Setup

image_scale(1, 1);
image_index = irandom(image_number);
image_speed	= global.gpspeed;

time_mark = global.gptime;
loot      = ds_map_create();
if (global.kill_count >= boss.last_ult + 100 || (global.kill_count > boss.last_ult && irandom(99) == 0)) {
	loot[? "ultimate"] = 1;
	boss.last_ult     += 100;
}

beh		= 1;
intro	= 1;
hp		= 90;
hpmax	= hp;
bdef	= 27;
pdef	= 56;
fdef	= 24;
cdef	= 45;
udef	= 50;
bdmg	= 74;
bpen	= 0;
bkb		= 50;
bkbres	= 10;
pkbres	= 5;
fkbres	= 0;
ckbres	= 15;
ukbres	= 20;

#endregion