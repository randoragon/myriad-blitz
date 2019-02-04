varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vWorldPos;

uniform vec2 u_vCenter;
uniform float u_fTime;

void main()
{
    vec4 sample=texture2D(gm_BaseTexture,v_vTexcoord);

    float dir=degrees(atan(v_vWorldPos.y-u_vCenter.y,v_vWorldPos.x-u_vCenter.x));
    float dir_proportion=mod(-(dir+90.)/360.,1.);
    if (dir_proportion<u_fTime) {
    float brightness=(sample.r+sample.g+sample.b)/3.;
    float fin_color=(1.-((1.-brightness)*(1.-brightness)));
    sample.rgb=vec3(fin_color,fin_color,fin_color);
    }
    
    gl_FragColor=v_vColour*sample;
}
