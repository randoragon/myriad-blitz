/// @description Setup

#region Setup

image_speed          = 0;
global.viewystartpos = __view_get( e__VW.YView, 0 );
global.viewxstartpos = __view_get( e__VW.XView, 0 );
image_angle			 = 360;

#endregion

#region Inherit parent event

event_inherited();

#endregion