varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_gptime, u_contrastIntensity, u_desaturationIntensity, u_blendIntensity, u_brightnessIntensity;
uniform vec3 u_colorBlend;

float Pi = 3.14159;

void main()
{    
    vec4 tmp_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    // contrast shader
    if (u_contrastIntensity > 0.0) {
        float intensity1 = (u_contrastIntensity * 0.6) + (sin(mod(((u_gptime * 60.0) - 60.0) * Pi / 180.0, 360.0)) * 0.4 * u_contrastIntensity);
        tmp_color.r      = clamp(pow(abs(tmp_color.r + 0.5), 1.0 + (intensity1)) - 0.5, 0.0, 1.0);
        tmp_color.g      = clamp(pow(abs(tmp_color.g + 0.5), 1.0 + (intensity1)) - 0.5, 0.0, 1.0);
        tmp_color.b      = clamp(pow(abs(tmp_color.b + 0.5), 1.0 + (intensity1)) - 0.5, 0.0, 1.0);
    }
    
    // black & white shader
    if (u_desaturationIntensity > 0.0) {
        vec3 init_color  = tmp_color.rgb;
        float luminosity = (tmp_color.r * 0.3) + (tmp_color.g * 0.5) + (tmp_color.b * 0.2);
        tmp_color.r      = clamp(luminosity + ((init_color.r - luminosity) * (1.0 - u_desaturationIntensity)), 0.0, 1.0);
        tmp_color.g      = clamp(luminosity + ((init_color.g - luminosity) * (1.0 - u_desaturationIntensity)), 0.0, 1.0);
        tmp_color.b      = clamp(luminosity + ((init_color.b - luminosity) * (1.0 - u_desaturationIntensity)), 0.0, 1.0);
    }
    
    // color blend
    if (u_blendIntensity > 0.0) {
        tmp_color.rgb = clamp(tmp_color.rgb + (u_blendIntensity * (((tmp_color.rgb + u_colorBlend) / 2.0) - tmp_color.rgb)), 0.0, 1.0);
    }
    
    // brightness
    tmp_color.rgb = clamp(tmp_color.rgb + u_brightnessIntensity, 0.0, 1.0);
    
    gl_FragColor = tmp_color;
}
