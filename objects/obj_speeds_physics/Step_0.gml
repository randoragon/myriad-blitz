/// @description event_inherited();
event_inherited();

///Applying Forces
x+=hspeed1*gpspeed;
y+=vspeed1*gpspeed;
x+=lengthdir_x(speed1*gpspeed,direction);
y+=lengthdir_y(speed1*gpspeed,direction);

