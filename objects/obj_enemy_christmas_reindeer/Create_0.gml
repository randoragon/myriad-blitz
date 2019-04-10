/// @description Setup

#region Inherit parent event 

event_inherited();

#endregion

#region Setup

image_scale(1, 1);
image_index = irandom(image_number);
image_speed	= random_range(0.15, 0.2) * global.gpspeed;
y = clamp(y, 100, 556);

if (global.gpspeed != 0) {
	hspeed1 = -25 * image_speed / global.gpspeed;
} else {
	if (global.prev_gpspeed != 0) {
		hspeed1 = -25 * image_speed / global.prev_gpspeed;
	} else {
		hspeed1 = -25 * image_speed;
	}
}

time_mark = global.gptime;
loot      = ds_map_create();
if (global.kill_count >= boss.last_ult + 100 || (global.kill_count > boss.last_ult && irandom(99) == 0)) {
	loot[? "ultimate"] = 1;
	boss.last_ult     += 100;
}

beh		= 1;
intro	= 0;
hp		= 80;
hpmax	= hp;
bdef	= 42;
pdef	= 58;
fdef	= 45;
cdef	= 65;
udef	= 80;
bdmg	= 95;
bpen	= 0;
bkb		= 125;
bkbres	= 43;
pkbres	= 90;
fkbres	= 95;
ckbres	= 55;
ukbres	= 30;

pdmg	= 115;
ppen	= 35;
pkb		= 70;

#endregion