varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_gpspeed, u_gptime, u_contrastIntensity, u_minColorAvg, u_maxColorAvg, u_desaturationIntensity, u_brightnessIntensity, u_flickerInterval;
float Pi=3.14159;


void main()
{    
    //fetch pixel data
    vec4 tmp_color=v_vColour*texture2D(gm_BaseTexture,v_vTexcoord);
    
    //flicker interval
    if(mod(u_gptime-mod(u_gptime,u_gpspeed),u_flickerInterval*u_gpspeed)<.001 && u_flickerInterval!=0.) {
    tmp_color.a=0.;
    } else {
    
    //contrast shader
    if(u_contrastIntensity>0.) {
    float intensity1=(u_contrastIntensity*.6)+(sin(mod(((u_gptime*60.)-60.)*Pi/180.,360.))*.4*u_contrastIntensity);
    tmp_color.r=clamp(pow(abs(tmp_color.r+.5),1.+(intensity1))-.5,0.,1.);
    tmp_color.g=clamp(pow(abs(tmp_color.g+.5),1.+(intensity1))-.5,0.,1.);
    tmp_color.b=clamp(pow(abs(tmp_color.b+.5),1.+(intensity1))-.5,0.,1.);
    }
    
    //color average filter
    float color_avg=(tmp_color.r+tmp_color.g+tmp_color.b)/3.;
    if(color_avg<u_minColorAvg || (color_avg>u_maxColorAvg && u_maxColorAvg<1.)) {
    tmp_color.a=0.;
    } else {
    
    //black & white shader
    if(u_desaturationIntensity>0.) {
    vec4 init_color=tmp_color;
    float luminosity=(tmp_color.r*.3)+(tmp_color.g*.5)+(tmp_color.b*.2);
    tmp_color.r=clamp(luminosity+((init_color.r-luminosity)*(1.-u_desaturationIntensity)),0.,1.);
    tmp_color.g=clamp(luminosity+((init_color.g-luminosity)*(1.-u_desaturationIntensity)),0.,1.);
    tmp_color.b=clamp(luminosity+((init_color.b-luminosity)*(1.-u_desaturationIntensity)),0.,1.);
    }
    
    //brightness
    tmp_color.rgb+=u_brightnessIntensity;
    
    }
    }
    
    //return the final color
    gl_FragColor=tmp_color;
}

