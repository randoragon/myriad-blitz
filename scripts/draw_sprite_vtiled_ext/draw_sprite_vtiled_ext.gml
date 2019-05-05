/// @description draw_sprite_vtiled_ext(sprite, subimg, x, y, xscale, yscale, angle, color, alpha, y0, height)
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param angle
/// @param color
/// @param alpha
/// @param y0
/// @param height

var tborder = (argument_count == 11 ? argument[9] : 0);
var bborder = tborder + (argument_count == 11 ? argument[10] : room_height);
var angle   = (argument[6] % 360) + (argument[6] < 0 ? 360 : 0);

var h, top_edge, xlen, ylen, yoffset;
if (angle > 0 && angle < 90) {
	h		  = (argument[5] * sprite_get_height(argument[0]) * dcos(angle)) + (argument[4] * sprite_get_width(argument[0]) * dsin(angle));
	xlen      = argument[5] * sprite_get_yoffset(argument[0]);
	ylen      = argument[4] * (sprite_get_width(argument[0]) - sprite_get_xoffset(argument[0]));
    yoffset   = dcos(angle) * ((dtan(angle) * ylen) + xlen);
	top_edge  = argument[3] - yoffset;
} else if (angle > 90 && angle < 180) {
	h		  = (argument[4] * sprite_get_width(argument[0]) * dcos(angle - 90)) + (argument[5] * sprite_get_height(argument[0]) * dsin(angle - 90));
    xlen      = argument[4] * (sprite_get_width(argument[0]) - sprite_get_xoffset(argument[0]));
    ylen      = argument[5] * (sprite_get_height(argument[0]) - sprite_get_yoffset(argument[0]));
    yoffset   = dcos(angle - 90) * ((dtan(angle - 90) * ylen) + xlen);
	top_edge  = argument[3] - yoffset;
} else if (angle > 180 && angle < 270) {
	h		  = (argument[5] * sprite_get_height(argument[0]) * dcos(angle - 180)) + (argument[4] * sprite_get_width(argument[0]) * dsin(angle - 180));
	xlen      = argument[4] * (sprite_get_height(argument[0]) - sprite_get_yoffset(argument[0]));
    ylen      = argument[5] * sprite_get_xoffset(argument[0]);
    yoffset   = dcos(angle - 180) * ((dtan(angle - 180) * ylen) + xlen);
	top_edge  = argument[3] - yoffset;
} else if (angle > 270 && angle < 360) {
	h         = (argument[4] * sprite_get_width(argument[0]) * dcos(angle - 270)) + (argument[5] * sprite_get_height(argument[0]) * dsin(angle - 270));
	xlen      = argument[4] * sprite_get_xoffset(argument[0]);
	ylen      = argument[5] * sprite_get_yoffset(argument[0]);
    yoffset   = dcos(angle - 270) * ((dtan(angle - 270) * ylen) + xlen);
	top_edge  = argument[3] - yoffset;
} else if (angle == 0 || angle == 360) {
	h	      = argument[5] * sprite_get_height(argument[0]);
    yoffset   = argument[5] * sprite_get_yoffset(argument[0]);
    top_edge  = argument[3] - yoffset;
} else if (angle == 90) {
	h	      = argument[4] * sprite_get_width(argument[0]);
    yoffset   = argument[4] * sprite_get_xoffset(argument[0]);
    top_edge  = argument[3] - yoffset;
} else if (angle == 180) {
	h	      = argument[5] * sprite_get_height(argument[0]);
    yoffset   = argument[5] * (sprite_get_height(argument[0]) - sprite_get_yoffset(argument[0]));
    top_edge  = argument[3] - yoffset;
} else if (angle == 270) {
	h	      = argument[4] * sprite_get_width(argument[0]);
    yoffset   = argument[4] * (sprite_get_width(argument[0]) - sprite_get_xoffset(argument[0]));
    top_edge  = argument[3] - yoffset;
}
 
top_edge %= h;
while (top_edge < tborder) { top_edge += h; }
while (top_edge > tborder) { top_edge -= h; }


for (var i = top_edge; i < bborder; i += h) {
	draw_sprite_ext(argument[0], argument[1], argument[2], i + yoffset, argument[4], argument[5], angle, argument[7], argument[8]);
}