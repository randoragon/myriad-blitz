//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;
uniform vec2 size;
uniform vec2 suf_size;
uniform vec4 color_blend;
uniform vec4 whitelist_box;

vec4 blend_colors(vec4 val1, vec4 val2) {
	vec4 result = val1 * val2;
	result.a    = val1.a;
	return result;
}

void main()
{
    // fetch pixel position and color
    vec2 pixel_position = v_vTexcoord;
    vec4 pixel_data     = texture2D(gm_BaseTexture, pixel_position);
    vec4 tmp_color      = v_vColour * pixel_data;
    
    // apply shine effect
    if (tmp_color.rgb != vec3(0.0, 0.0, 0.0)) {
        float loop = mod((time / 30.0) * size.x, size.x);
        if (abs(mod((pixel_position.x * suf_size.x) + (pixel_position.y * suf_size.y), size.x) - loop) <= 15.0) {
            tmp_color.r = 1.0;
            tmp_color.g = 1.0;
            tmp_color.b = 1.0;
        } else if (!(pixel_position.x >= whitelist_box.r && pixel_position.y >= whitelist_box.g && pixel_position.x <= whitelist_box.b && pixel_position.y <= whitelist_box.a)) {
            // apply blending
            tmp_color = blend_colors(tmp_color, color_blend);
            
            // gradient shading
            float blend_factor = pixel_position.y + 0.5;
            tmp_color.rgb *= blend_factor;
        }
    }
    
    // final output
    gl_FragColor = tmp_color;
}
