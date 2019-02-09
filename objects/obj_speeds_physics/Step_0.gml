/// @description Apply Forces

#region Inherit parent event

event_inherited();

#endregion

#region Apply forces

x += hspeed1 * gpspeed;
y += vspeed1 * gpspeed;
x += lengthdir_x(speed1 * gpspeed, direction);
y += lengthdir_y(speed1 * gpspeed, direction);

#endregion