/// @description fx_emphasize(1/4xwave,2/4xwave,3/4xwave,4/4xwave,1/4ywave,2/4ywave,3/4ywave,4/4ywave,xradius,yradius,xcycle,ycycle,xoffset,yoffset,xduration,yduration)
/// @param 1/4xwave
/// @param 2/4xwave
/// @param 3/4xwave
/// @param 4/4xwave
/// @param 1/4ywave
/// @param 2/4ywave
/// @param 3/4ywave
/// @param 4/4ywave
/// @param xradius
/// @param yradius
/// @param xcycle
/// @param ycycle
/// @param xoffset
/// @param yoffset
/// @param xduration
/// @param yduration

    /* 
    Cycles SHOULD be dividable by 4
    
    Waveforms:
           1) straight line  /
           2) straight line  \
           2) smooth fast>>slow  /
           3) smooth slow>>fast  \
           
           negative numbers for downward movement
           EXAMPLE: 3,4,-3,-4 (default waveform)
           
           [1,2,-1,-2]  =  /\
                             \/
                                
       Duration is the number of 1/4 bits of cyclespans before the oscillator destroys itself.
       min. 1, -1 for infinity
       Must be an integer number.
   */

var a=instance_create(0,0,obj_oscillator);
a.waveform[0,0]=argument[0];
a.waveform[1,0]=argument[1];
a.waveform[2,0]=argument[2];
a.waveform[3,0]=argument[3];
a.waveform[0,1]=argument[4];
a.waveform[1,1]=argument[5];
a.waveform[2,1]=argument[6];
a.waveform[3,1]=argument[7];

var offset0=argument[12];
var offset1=argument[13];

a.radius[0]=argument[8];
a.radius[1]=argument[9];
a.cycle[0]=argument[10];
a.cycle[1]=argument[11];
a.duration[0]=argument[14];
a.duration[1]=argument[15];

a.acceleration[0]=(2*a.radius[0])/(power(a.cycle[0]/4,2)+(a.cycle[0]/4));
a.acceleration[1]=(2*a.radius[1])/(power(a.cycle[1]/4,2)+(a.cycle[1]/4));
a.time[0]=a.cycle[0]*offset0;
a.time[1]=a.cycle[1]*offset1;

return a;

