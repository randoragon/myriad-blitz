/// @description draw_tooltip_raw(text, text_color, bg_color, border_color);
/// @param text
/// @param text_color
/// @param bg_color
/// @param border_color
function draw_tooltip_raw() {

	var text         = argument[0];
	var text_width   = 2 * string_width(text);
	var text_height  = 2 * string_height(text);

	var text_color	 = c_white;
	var bg_color	 = c_black;
	var border_color = c_white;

	if argument_count == 2 {
		text_color	 = argument[1];
	} else if argument_count == 3 {
		text_color	 = argument[1];
		bg_color	 = argument[2];
	} else if argument_count == 4 {
		text_color	 = argument[1];
		bg_color	 = argument[2];
		border_color = argument[3];
	}

	var dir;
	if (boss.x - 1 - text_width - 8 >= CANVAS_X) {
	    dir = -1;
	    draw_set_align(fa_left, fa_bottom);
	} else {
	    dir = 1;
	    draw_set_align(fa_right, fa_bottom);
	}

	draw_set_color(bg_color);
	draw_rectangle(boss.x + dir, boss.y - (text_height + 7), boss.x + (dir * (text_width + 7)), boss.y - 1, 0);
	draw_set_color(text_color);
	draw_text_transformed(boss.x + (dir * (text_width + 2)), boss.y - 4, text, 2, 2, 0);
	draw_set_color(border_color);
	draw_rectangle(boss.x, boss.y - (text_height + 7), boss.x + (dir * (text_width + 8)), boss.y - 1, 1);
	draw_rectangle(boss.x + dir, boss.y - (text_height + 8), boss.x + (dir * (text_width + 7)), boss.y, 1);


}
