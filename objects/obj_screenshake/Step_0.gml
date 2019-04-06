/// @description Screenshake

#region Directional screenshake

if (image_angle != 360) {
    if (time_clock % 2 >= 1) {
		camera_set_view_pos(view_get_camera(0), global.viewxstartpos + h_value, global.viewystartpos + v_value)
    } else {
		camera_set_view_pos(view_get_camera(0), global.viewxstartpos - h_value, global.viewystartpos - v_value)
    }
}

#endregion

#region Omnidirectional screenshake

if (image_angle == 360) {
    if (time_clock % 8 >= 7) {
        camera_set_view_pos(view_get_camera(0), global.viewxstartpos + h_value, global.viewystartpos)
    } else if (time_clock % 8 >= 6) {
		camera_set_view_pos(view_get_camera(0), global.viewxstartpos + lengthdir_x(h_value, 225), global.viewystartpos + lengthdir_y(v_value, 225))
    } else if (time_clock % 8 >= 5) {
		camera_set_view_pos(view_get_camera(0), global.viewxstartpos, global.viewystartpos - v_value)
    } else if (time_clock % 8 >= 4) {
		camera_set_view_pos(view_get_camera(0), global.viewxstartpos + lengthdir_x(h_value, 315), global.viewystartpos + lengthdir_y(v_value, 315))
    } else if (time_clock % 8 >= 3) {
		camera_set_view_pos(view_get_camera(0), global.viewxstartpos + lengthdir_x(h_value, 135), global.viewystartpos + lengthdir_y(v_value, 135))
    } else if (time_clock % 8 >= 2) {
		camera_set_view_pos(view_get_camera(0), global.viewxstartpos, global.viewystartpos + v_value)
    } else if (time_clock % 8 >= 1) {
		camera_set_view_pos(view_get_camera(0), global.viewxstartpos + lengthdir_x(h_value, 45), global.viewystartpos + lengthdir_y(v_value, 45))
    } else {
		camera_set_view_pos(view_get_camera(0), global.viewxstartpos - h_value, global.viewystartpos)
    }
}

#endregion

#region Update Value & Time

if (decrease) {
    h_value = h_value0 * time_clock / time;
    v_value = v_value0 * time_clock / time;
}

if (time_clock <= 0) {
    instance_destroy();
}

if (global.gpspeed != 0) {
    time_clock -= global.gpspeed / rate;
}

#endregion