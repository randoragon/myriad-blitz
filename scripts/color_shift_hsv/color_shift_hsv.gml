/// @description color_shift_hsv(color, hue, saturation, value, relative);
/// @param color
/// @param hue
/// @param saturation
/// @param value
/// @param relative

if (argument[4]) {
	return make_color_hsv(color_get_hue(argument[0]) + argument[1], clamp(color_get_saturation(argument[0]) + argument[2], 0, 255), clamp(color_get_value(argument[0]) + argument[3], 0, 255));
} else {
	if (argument[1] != -1) { var hue		= argument[1]; } else { var hue		   = color_get_hue(argument[0]); }
	if (argument[2] != -1) { var saturation	= argument[2]; } else { var saturation = color_get_hue(argument[0]); }
	if (argument[3] != -1) { var value		= argument[3]; } else { var value	   = color_get_hue(argument[0]); }
	return make_color_hsv(hue, saturation, value);
}