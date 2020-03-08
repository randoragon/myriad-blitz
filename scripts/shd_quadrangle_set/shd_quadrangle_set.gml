/// @description shd_quadrangle_set(uvs, texture_width, texture_height, A[x], [y], B[x], [y], C[x], [y], D[x], [y], color, alpha, trim, overwrite_alpha);
/// @param uvs
/// @param texture_width
/// @param texture_height
/// @param A[x]
/// @param [y]
/// @param B[x]
/// @param [y]
/// @param C[x]
/// @param [y]
/// @param D[x]
/// @param [y]
/// @param color
/// @param alpha
/// @param trim
/// @param overwrite_alpha

// If trim is enabled, only the colored quadrangle will be drawn.

// If -1 is passed as color, the shader will not change any colors.

// If overwrite_alpha is 0, each pixel within the quadrangle will have its alpha multiplied by "alpha".
// If overwrite_alpha is 1, each non-transparent pixel will have exactly the alpha passed with "alpha".
// If overwrite_alpha is 2, each and every pixel will have exactly the alpha passed with "alpha".

// CAREFUL!
// If drawing a sprite, be sure to obtain its TEXTURE width and height, like so:
// var uvs = sprite_get_uvs(sprite);
// var w = sprite_get_width(sprite) * uvs[6];
// var w = sprite_get_height(sprite) * uvs[7];
// This is very important, as sprites tend to be trimmed and tinkered with prior
// to being put on a texture page.

// UVS can be obtained
// 1) for surfaces: texture_get_uvs(surface_get_texture(suf))
// 2) for sprites:	sprite_get_uvs(sprite)
var uvs = argument[0];

var col = argument[11];
var r, g, b;
if (col == -1) {
	r = -1; // these values don't matter, because
	g = -1; // they will be ignored by the shader 
	b = -1; // via the overwrite_color uniform
} else {
	r = color_get_red(col)   / 255;
	g = color_get_green(col) / 255;
	b = color_get_blue(col)  / 255;
}

shader_set(shd_quadrangle);
shader_set_uniform_f(global.shd_quadrangle_uni[| 0], uvs[@ 0], uvs[@ 1], uvs[@ 2], uvs[@ 3]);
shader_set_uniform_f(global.shd_quadrangle_uni[| 1], argument[1], argument[2]);
shader_set_uniform_f(global.shd_quadrangle_uni[| 2], argument[3], argument[4]);
shader_set_uniform_f(global.shd_quadrangle_uni[| 3], argument[5], argument[6]);
shader_set_uniform_f(global.shd_quadrangle_uni[| 4], argument[7], argument[8]);
shader_set_uniform_f(global.shd_quadrangle_uni[| 5], argument[9], argument[10]);
shader_set_uniform_f(global.shd_quadrangle_uni[| 6], r, g, b, argument[12]);
shader_set_uniform_f(global.shd_quadrangle_uni[| 7], argument[13]);
shader_set_uniform_f(global.shd_quadrangle_uni[| 8], (argument[11] != -1));
shader_set_uniform_i(global.shd_quadrangle_uni[| 9], argument[14]);
