 /// @description fly_towards(x0, y0, x1, y1, time)
/// @param x0
/// @param y0
/// @param x1
/// @param y1
/// @param time

direction = point_direction(argument[0], argument[1], argument[2], argument[3]);
speed1    = distance_to_point(argument[2], argument[3]) / argument[4];