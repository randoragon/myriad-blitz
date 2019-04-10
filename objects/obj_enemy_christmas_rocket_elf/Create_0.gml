/// @description Setup

#region Inherit parent event 

event_inherited();

#endregion

#region Setup

image_scale(1, 1);
image_index = irandom(image_number);
image_speed	= 0.4 * global.gpspeed;

time_mark = global.gptime;
loot      = ds_map_create();
if (global.kill_count >= boss.last_ult + 100 || (global.kill_count > boss.last_ult && irandom(99) == 0)) {
	loot[? "ultimate"] = 1;
	boss.last_ult     += 100;
}

beh		= irandom_range(0, 4);
intro	= 1;
hp		= 100;
hpmax	= hp;
bdef	= 0;
pdef	= 30;
fdef	= 40;
cdef	= 1;
udef	= 1;
bdmg	= 135;
bpen	= 33;
bkb		= 150;
bkbres	= 80;
pkbres	= 80;
fkbres	= 95;
ckbres	= 70;
ukbres	= 50;

#endregion