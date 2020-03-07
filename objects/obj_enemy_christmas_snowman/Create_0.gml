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

beh		= irandom_range(0, 8);
intro	= 1;
hp		= 145;
hpmax	= hp;
bdef	= 42;
pdef	= 15;
fdef	= 25;
cdef	= 45;
udef	= 10;
bdmg	= 72;
bpen	= 10;
bkb		= 80;
bkbres	= 40;
pkbres	= 40;
fkbres	= 40;
ckbres	= 40;
ukbres	= 40;

pdmg	= 98;
ppen	= 0;
pkb		= 120;

#endregion