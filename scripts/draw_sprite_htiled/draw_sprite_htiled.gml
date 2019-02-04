/// @description draw_sprite_htiled(sprite, subimg, x, y)
/// @param sprite
/// @param subimg
/// @param x
/// @param y

var w = sprite_get_width(argument[0]);

for (var i = 0; i < room_width; i += w) {
	draw_sprite(argument[0], argument[1], argument[2] % w + i, argument[3]);
}