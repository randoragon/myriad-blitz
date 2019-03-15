/// @description Apply Forces

#region Inherit parent event

event_inherited();

#endregion

#region Apply forces

x += hspeed1 * global.gpspeed;
y += vspeed1 * global.gpspeed;
x += lengthdir_x(speed1 * global.gpspeed, direction);
y += lengthdir_y(speed1 * global.gpspeed, direction);

#endregion