/// @description Setup

#region Setup

image_speed          = 0;
global.viewystartpos = camera_get_view_x(view_get_camera(0))
global.viewxstartpos = camera_get_view_y(view_get_camera(0))
image_angle			 = 360;

#endregion

#region Inherit parent event

event_inherited();

#endregion