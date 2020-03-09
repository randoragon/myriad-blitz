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

// Determinant of a 3D matrix
float det(vec3 u, vec3 v, vec3 w)
{
	return (u.x * v.y * w.z) + (u.y * v.z * w.x) + (u.z * v.x * w.y) - (u.z * v.y * w.x) - (u.x * v.z * w.y) - (u.y *v.x * w.z);
}

// Determinant of a 2D matrix
float det(vec2 u, vec2 v)
{
	return (u.x * v.y) - (u.y * v.x);
}

// Checks on which line side lies a point
float plside(vec2 l1, vec2 l2, vec2 p)
{
	return sign(det(vec3(l1.x, l1.y, 1.), vec3(l2.x, l2.y, 1.), vec3(p.x, p.y, 1.)));
}

bool doVectorsIntersect(vec2 u0, vec2 u1, vec2 v0, vec2 v1)
{
	// Vectors intersect when one of 5 conditions is fulfilled (this reflects the return code below):
	/* (1) v1 and v0 are on opposite sides of vector u, and u1 and u0 are on opposite sides of vector v
	 * (2) v0 lies on u
	 * (3) v1 lies on u
	 * (4) u0 lies on v
	 * (5) u1 lies on v
	 */
	return (plside(u0, u1, v0) != plside(u0, u1, v1) && plside(v0, v1, u0) != plside(v0, v1, u1))
	|| (plside(u0, u1, v0) == 0. && v0.x >= min(u0.x, u1.x) && v0.x <= max(u0.x, u1.x) && v0.y >= min(u0.y, u1.y) && v0.y <= max(u0.y, u1.y))
	|| (plside(u0, u1, v1) == 0. && v1.x >= min(u0.x, u1.x) && v1.x <= max(u0.x, u1.x) && v1.y >= min(u0.y, u1.y) && v1.y <= max(u0.y, u1.y))
	|| (plside(v0, v1, u0) == 0. && u0.x >= min(v0.x, v1.x) && u0.x <= max(v0.x, v1.x) && u0.y >= min(v0.y, v1.y) && u0.y <= max(v0.y, v1.y))
	|| (plside(v0, v1, u1) == 0. && u1.x >= min(v0.x, v1.x) && u1.x <= max(v0.x, v1.x) && u1.y >= min(v0.y, v1.y) && u1.y <= max(v0.y, v1.y));
}

void main()
{
	vec4 P = texture2D(gm_BaseTexture, v_vTexcoord);
	
	// Method used: Ray Casting
	// Read about it here: https://stackoverflow.com/a/218081
	
	// Convert point coordinates to pixels
	float Px = dimensions.x * (v_vTexcoord.x - uvs.x) / (uvs.z - uvs.x);
	float Py = dimensions.y * (v_vTexcoord.y - uvs.y) / (uvs.w - uvs.x);
	
	// This variable will hold the final result
	bool within;
	
	// Check if point is even worth using the ray-casting method on
	float xmin = min(A.x, min(B.x, min(C.x, D.x)));
	float xmax = max(A.x, max(B.x, max(C.x, D.x)));
	float ymin = min(A.y, min(B.y, min(C.y, D.y)));
	float ymax = max(A.y, max(B.y, max(C.y, D.y)));
	within = (Px >= xmin && Px <= xmax && Py >= ymin && Py <= ymax);
	
	if (within) {
		// Pick any point outside the quadrangle as ray starting point
		vec2 R = vec2(xmin - 1., Py);
	
		// Count the number of intersections with quadrangle sides
		float intersections = 0.;
		intersections += (doVectorsIntersect(R, vec2(Px, Py), A, B)? 1. : 0.);
		intersections += (doVectorsIntersect(R, vec2(Px, Py), B, C)? 1. : 0.);
		intersections += (doVectorsIntersect(R, vec2(Px, Py), C, D)? 1. : 0.);
		intersections += (doVectorsIntersect(R, vec2(Px, Py), D, A)? 1. : 0.);
	
		// If the number of intersections is odd, the point lies within
		within = (mod(intersections, 2.) == 1.);
	}
	
	if (within) {
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