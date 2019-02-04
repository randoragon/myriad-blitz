/// @description draw_sprite_vtiled(sprite, subimg, x, y)
/// @param sprite
/// @param subimg
/// @param x
/// @param y

var h = sprite_get_height(argument[0]);

for (var i = 0; i < room_height; i += h) {
	draw_sprite(argument[0], argument[1], argument[2], argument[3] % h + i);
}