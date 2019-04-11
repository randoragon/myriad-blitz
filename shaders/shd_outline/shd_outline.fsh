//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 pixel_size;
uniform vec3 color;
uniform bool rough;

void main()
{	
	vec2 offsetx = vec2(pixel_size.x, 0.0);
	vec2 offsety = vec2(0.0, pixel_size.y);
	
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	if (alpha == 0.0) {
		// adjacent edges
		alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetx).a);
		alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetx).a);
		alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsety).a);
		alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsety).a);
	
		// diagonal edges
		if (rough) {
			alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + vec2(offsetx.x, offsety.y)).a);
			alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + vec2(offsetx.x, -offsety.y)).a);
			alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + vec2(-offsetx.x, offsety.y)).a);
			alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - vec2(offsetx.x, offsety.y)).a);
		}
		
		gl_FragColor.rgba = vec4(color, alpha);
	}
}
