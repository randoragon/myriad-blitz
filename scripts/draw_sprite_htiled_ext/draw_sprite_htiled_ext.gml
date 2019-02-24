/// @description draw_sprite_htiled_ext(sprite, subimg, x, y, xscale, yscale, color, alpha)
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param color
/// @param alpha

var w = argument[4] * sprite_get_width(argument[0]);
var h = argument[5] * sprite_get_height(argument[0]);

for (var i = 0; i < room_width; i += w) {
	draw_sprite_ext(argument[0], argument[1], argument[2] % w + i, argument[3], argument[4], argument[5], 0, argument[6], argument[7]);
}