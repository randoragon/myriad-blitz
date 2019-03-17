/// @description draw_sprite_htiled(sprite, subimg, x, y, x0, width)
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param x0
/// @param width

var lborder = (argument_count == 6 ? argument[4] : 0);
var rborder = lborder + (argument_count == 6 ? argument[5] : room_width);

var w = sprite_get_width(argument[0]);
var left_edge = argument[2] - sprite_get_xoffset(argument[0]);
left_edge %= w;
while (left_edge < lborder) { left_edge += w; }
while (left_edge > lborder) { left_edge -= w; }

for (var i = left_edge; i < rborder; i += w) {
	draw_sprite(argument[0], argument[1], i, argument[3]);
}