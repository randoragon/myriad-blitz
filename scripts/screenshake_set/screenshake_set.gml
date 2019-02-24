/// @description screenshake_set(offset, direction, time, rate, smoothing)
/// @param offset
/// @param direction
/// @param time
/// @param rate
/// @param smoothing

if (global.screenshake == 0) { exit; }

var screenshake = (instance_exists(obj_screenshake) ? obj_screenshake : instance_create(0, 0, obj_screenshake));

if (argument[1] != 360) {
    screenshake.h_value = clamp(lengthdir_x(argument[0], argument[1]), -20, 20);
    screenshake.v_value = clamp(lengthdir_y(argument[0], argument[1]), -20, 20);
} else {
    screenshake.h_value = clamp(argument[0], -20, 20);
    screenshake.v_value = clamp(argument[0], -20, 20);
}

screenshake.h_value0    = screenshake.h_value;
screenshake.v_value0    = screenshake.v_value;
screenshake.image_angle = argument[1];
screenshake.time        = argument[2];
screenshake.time_clock  = argument[2];
screenshake.rate        = argument[3];
screenshake.decrease    = argument[4];

return screenshake;
