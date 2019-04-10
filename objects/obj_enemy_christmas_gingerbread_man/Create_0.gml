/// @description Setup

#region Inherit parent event 

event_inherited();

#endregion

#region Setup

image_scale(1, 1);
image_index = irandom(image_number);
image_speed	= 0.2 * global.gpspeed;

time_mark = global.gptime;
loot      = ds_map_create();
if (global.kill_count >= boss.last_ult + 100 || (global.kill_count > boss.last_ult && irandom(99) == 0)) {
	loot[? "ultimate"] = 1;
	boss.last_ult     += 100;
}

beh		= 1;
intro	= 1;
hp		= 110;
hpmax	= hp;
bdef	= 15;
pdef	= 34;
fdef	= 29;
cdef	= 15;
udef	= 0;
bdmg	= 40;
bpen	= 0;
bkb		= 30;
bkbres	= 10;
pkbres	= 10;
fkbres	= 10;
ckbres	= 10;
ukbres	= 10;

pdmg	= 75;
ppen	= 65;
pkb		= 40;

#endregion