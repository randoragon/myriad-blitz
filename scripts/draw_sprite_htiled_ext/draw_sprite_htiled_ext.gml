/// @description draw_sprite_htiled_ext(sprite, subimg, x, y, xscale, yscale, angle, color, alpha, x0, width)
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param angle
/// @param color
/// @param alpha
/// @param x0
/// @param width
function draw_sprite_htiled_ext() {

	var lborder = (argument_count == 11 ? argument[9] : 0);
	var rborder = lborder + (argument_count == 11 ? argument[10] : room_width);
	var angle   = (argument[6] % 360) + (argument[6] < 0 ? 360 : 0);

	var w, left_edge, xlen, ylen, xoffset;
	if (angle > 0 && angle < 90) {
		w		  = (argument[5] * sprite_get_height(argument[0]) * dsin(angle)) + (argument[4] * sprite_get_width(argument[0]) * dcos(angle));
		xlen      = argument[4] * sprite_get_xoffset(argument[0]);
	    ylen      = argument[5] * sprite_get_yoffset(argument[0]);
	    xoffset   = dcos(angle) * ((dtan(angle) * ylen) + xlen);
		left_edge = argument[2] - xoffset;
	} else if (angle > 90 && angle < 180) {
		w		  = (argument[4] * sprite_get_width(argument[0]) * dsin(angle - 90)) + (argument[5] * sprite_get_height(argument[0]) * dcos(angle - 90));
	    xlen      = argument[5] * sprite_get_yoffset(argument[0]);
		ylen      = argument[4] * (sprite_get_width(argument[0]) - sprite_get_xoffset(argument[0]));
	    xoffset   = dcos(angle - 90) * ((dtan(angle - 90) * ylen) + xlen);
		left_edge = argument[2] - xoffset;
	} else if (angle > 180 && angle < 270) {
		w		  = (argument[5] * sprite_get_height(argument[0]) * dsin(angle - 180)) + (argument[4] * sprite_get_width(argument[0]) * dcos(angle - 180));
		xlen      = argument[4] * (sprite_get_width(argument[0]) - sprite_get_xoffset(argument[0]));
	    ylen      = argument[5] * (sprite_get_height(argument[0]) - sprite_get_yoffset(argument[0]));
	    xoffset   = dcos(angle - 180) * ((dtan(angle - 180) * ylen) + xlen);
		left_edge = argument[2] - xoffset;
	} else if (angle > 270 && angle < 360) {
		w         = (argument[4] * sprite_get_width(argument[0]) * dsin(angle - 270)) + (argument[5] * sprite_get_height(argument[0]) * dcos(angle - 270));
		xlen      = argument[5] * (sprite_get_height(argument[0]) - sprite_get_yoffset(argument[0]));
		ylen      = argument[4] * sprite_get_xoffset(argument[0]);
	    xoffset   = dcos(angle - 270) * ((dtan(angle - 270) * ylen) + xlen);
		left_edge = argument[2] - xoffset;
	} else if (angle == 0 || angle == 360) {
		w	      = argument[4] * sprite_get_width(argument[0]);
	    xoffset   = argument[4] * sprite_get_xoffset(argument[0]);
	    left_edge = argument[2] - xoffset;
	} else if (angle == 90) {
		w	      = argument[5] * sprite_get_height(argument[0]);
	    xoffset   = argument[5] * sprite_get_yoffset(argument[0]);
	    left_edge = argument[2] - xoffset;
	} else if (angle == 180) {
		w	      = argument[4] * sprite_get_width(argument[0]);
	    xoffset   = argument[4] * (sprite_get_width(argument[0]) - sprite_get_xoffset(argument[0]));
	    left_edge = argument[2] - xoffset;
	} else if (angle == 270) {
		w	      = argument[5] * sprite_get_height(argument[0]);
	    xoffset   = argument[5] * (sprite_get_height(argument[0]) - sprite_get_yoffset(argument[0]));
	    left_edge = argument[2] - xoffset;
	}

	left_edge %= w;
	while (left_edge < lborder) { left_edge += w; }
	while (left_edge > lborder) { left_edge -= w; }


	for (var i = left_edge; i < rborder; i += w) {
		draw_sprite_ext(argument[0], argument[1], i + xoffset, argument[3], argument[4], argument[5], angle, argument[7], argument[8]);
	}


}
