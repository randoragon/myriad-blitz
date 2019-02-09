/// @description Setup

#region Setup

image_speed          = 0;
global.viewystartpos = __view_get( e__VW.YView, 0 );
global.viewxstartpos = __view_get( e__VW.XView, 0 );
h_value              = 5;
h_value0			 = 5;
v_value				 = 5;
v_value0			 = 5;
image_angle			 = 360;
rate				 = 1;
time_clock			 = 60;
time				 = 60;
decrease			 = 0;

#endregion

#region Inherit parent event

event_inherited();

#endregion