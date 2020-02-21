/// @description draw_tooltip(text, 'text_color, 'bg_color, 'border_color);
/// @param text
/// @param 'text_color
/// @param 'bg_color
/// @param 'border_color

var col1 = "255255255";
var col2 = "000000000";
var col3 = "255255255";

if argument_count == 2 {
	col1 = string_replace_all(string_format(color_get_red(argument[1]), 3, 0) + string_format(color_get_green(argument[1]), 3, 0) + string_format(color_get_blue(argument[1]), 3, 0), " ", "0");
} else if argument_count == 3 {
	col1 = string_replace_all(string_format(color_get_red(argument[1]), 3, 0) + string_format(color_get_green(argument[1]), 3, 0) + string_format(color_get_blue(argument[1]), 3, 0), " ", "0");
	col2 = string_replace_all(string_format(color_get_red(argument[2]), 3, 0) + string_format(color_get_green(argument[2]), 3, 0) + string_format(color_get_blue(argument[2]), 3, 0), " ", "0");
} else if argument_count == 4 {
	col1 = string_replace_all(string_format(color_get_red(argument[1]), 3, 0) + string_format(color_get_green(argument[1]), 3, 0) + string_format(color_get_blue(argument[1]), 3, 0), " ", "0");
	col2 = string_replace_all(string_format(color_get_red(argument[2]), 3, 0) + string_format(color_get_green(argument[2]), 3, 0) + string_format(color_get_blue(argument[2]), 3, 0), " ", "0");
	col3 = string_replace_all(string_format(color_get_red(argument[3]), 3, 0) + string_format(color_get_green(argument[3]), 3, 0) + string_format(color_get_blue(argument[3]), 3, 0), " ", "0");
}

var str = col1 + col2 + col3 + argument[0];
ds_queue_enqueue(global.tooltips, str);