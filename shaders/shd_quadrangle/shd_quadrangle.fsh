varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 uvs;
uniform vec2 dimensions;
uniform vec2 A, B, C, D;
uniform vec4 color;
uniform bool trim;
uniform bool overwrite_color;
uniform int overwrite_alpha;

// This shader draws color on every pixel that lies within
// a quadrangle defined by 4 points passed as uniforms.
// Points need to be passed in the correct order, i.e. any
// adjacent points should be passed as adjacent uniforms.

// The dimensions vector needs exact TEXTURE size in pixels.
// That means if you want to draw a sprite, simply passing
// "sprite_get_width" or alike won't suffice.
// To get the needed size, use this method:
//
// var tex = sprite_get_uvs(sprite);
// var texW = sprite_get_width(sprite)  * tex[6];
// var texH = sprite_get_height(sprite) * tex[7];
// 
// What's the difference? For example, sprites with a lot of
// transparency get trimmed on the actual texture pages,
// so the texture page dimensions differ from sprite dimensions.

void main()
{
	vec4 P = texture2D(gm_BaseTexture, v_vTexcoord);
	
	// the method is simple
	// We're going to check if the point lies on the same side of every
	// single line that is formed by quadrangle sides, that is
	// AB, BC, CD and DA. Sides are treated like vectors, so AB!=BA.
	// A point will lie on the quadrangle if and only if
	// it either lies on a line, or is to the right or left of every single line.
	// A point does not lie on the quadrangle if it's to the right of
	// any side, and simultaneously to the left of any other side.
	
	// convert point coordinates to pixels
	float Px = dimensions.x * (v_vTexcoord.x - uvs.x) / (uvs.z - uvs.x);
	float Py = dimensions.y * (v_vTexcoord.y - uvs.y) / (uvs.w - uvs.x);
	
	float AB, BC, CD, DA;
	AB = sign(((Px - A.x) * (B.y - A.y)) - ((Py - A.y) * (B.x - A.x)));
	BC = sign(((Px - B.x) * (C.y - B.y)) - ((Py - B.y) * (C.x - B.x)));
	CD = sign(((Px - C.x) * (D.y - C.y)) - ((Py - C.y) * (D.x - C.x)));
	DA = sign(((Px - D.x) * (A.y - D.y)) - ((Py - D.y) * (A.x - D.x)));
	
	if (AB * BC != -1. && AB * CD != -1. && AB * DA != -1. && BC * CD != -1. && BC * DA != -1. && CD * DA != -1.) {
		P.rgb = (overwrite_color)? color.rgb : P.rgb;
		if (overwrite_alpha == 0) {
			P.a *= color.a;
		} else if (overwrite_alpha == 1) {
			P.a = (P.a != 0.)? color.a : 0.;
		} else if (overwrite_alpha == 2) {
			P.a = color.a;
		}
	} else if (trim) {
		P.a = 0.0;
	}
	
    gl_FragColor = v_vColour * P;
}