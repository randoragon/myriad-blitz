/// @description draw_sprite_htiled(sprite, subimg, x, y, y0, height)
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param y0
/// @param height

var tborder = (argument_count == 6 ? argument[4] : 0);
var bborder = tborder + (argument_count == 6 ? argument[5] : room_width);

var h = sprite_get_height(argument[0]);
var top_edge = argument[3] - sprite_get_yoffset(argument[0]);
top_edge %= h;
top_edge += tborder - (top_edge > 0 ? h : 0);
while (top_edge < tborder) { top_edge += h; }
while (top_edge > tborder) { top_edge -= h; }

for (var i = top_edge; i < bborder; i += h) {
	draw_sprite(argument[0], argument[1], argument[2], i);
}