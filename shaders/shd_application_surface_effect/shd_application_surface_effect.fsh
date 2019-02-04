varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vWorldPos;

uniform vec2 u_waveAmplitude,u_waveClock,u_wavingSpeed,u_waveLength;
uniform float u_gptime,u_contrastIntensity,u_desaturationIntensity,u_blendIntensity,u_brightnessIntensity;
uniform int u_velocityLines;
uniform vec3 u_colorBlend;

float Pi=3.14159;

float random_float(vec2 seed) {
return abs(fract(sin(mod(dot(seed.xy,vec2(12.9898,78.233)),2.*Pi)) * 43758.5453));
}

float get_lum(vec3 input_rgb) {
return (input_rgb.r*.3)+(input_rgb.g*.5)+(input_rgb.b*.2);
}

void main()
{
    //horizontal wave motion
    vec2 pos=v_vTexcoord;
    if(u_waveAmplitude.x!=0.) {
    pos.x+=sin(mod(((pos.y*808.*360./u_waveLength.x)+(u_waveClock.x*u_wavingSpeed.x)-u_wavingSpeed.x)*Pi/180.,360.))*u_waveAmplitude.x/1406.;
    }
    //vertical wave motion
    if(u_waveAmplitude.y!=0.) {
    pos.y+=sin(mod(((pos.x*1406.*360./u_waveLength.y)+(u_waveClock.y*u_wavingSpeed.y)-u_wavingSpeed.y)*Pi/180.,360.))*u_waveAmplitude.y/808.;
    }
    
    vec4 tmp_color=v_vColour*texture2D(gm_BaseTexture,pos);
    
    //contrast shader
    if(u_contrastIntensity>0.) {
    float intensity1=(u_contrastIntensity*.6)+(sin(mod(((u_gptime*60.)-60.)*Pi/180.,360.))*.4*u_contrastIntensity);
    tmp_color.r=clamp(pow(abs(tmp_color.r+.5),1.+(intensity1))-.5,0.,1.);
    tmp_color.g=clamp(pow(abs(tmp_color.g+.5),1.+(intensity1))-.5,0.,1.);
    tmp_color.b=clamp(pow(abs(tmp_color.b+.5),1.+(intensity1))-.5,0.,1.);
    }
    
    //black & white shader
    if(u_desaturationIntensity>0.) {
    vec4 init_color=tmp_color;
    float lum=get_lum(tmp_color.rgb);
    tmp_color.r=clamp(lum+((init_color.r-lum)*(1.-u_desaturationIntensity)),0.,1.);
    tmp_color.g=clamp(lum+((init_color.g-lum)*(1.-u_desaturationIntensity)),0.,1.);
    tmp_color.b=clamp(lum+((init_color.b-lum)*(1.-u_desaturationIntensity)),0.,1.);
    }
    
    //color blend
    if(u_blendIntensity>0.) {
    float lum_dif=get_lum(tmp_color.rgb)-get_lum(u_colorBlend);
    vec3 color_mix=u_colorBlend+lum_dif;
    
    tmp_color.r=clamp(color_mix.r+((tmp_color.r-color_mix.r)*(1.-u_blendIntensity)),0.,1.);
    tmp_color.g=clamp(color_mix.g+((tmp_color.g-color_mix.g)*(1.-u_blendIntensity)),0.,1.);
    tmp_color.b=clamp(color_mix.b+((tmp_color.b-color_mix.b)*(1.-u_blendIntensity)),0.,1.);
    }
    
    //brightness
    tmp_color.rgb+=u_brightnessIntensity;
    
    //velocity lines
    if(u_velocityLines==1) {
    float rand=random_float(vec2(150.*fract(acos(mod((u_gptime+600.)/60.,2.*Pi))),v_vTexcoord.y));
    if(mod(rand,.02)<.005)
    tmp_color.rgb+=(rand*.2)-.1;
    }

    gl_FragColor=tmp_color;
}
