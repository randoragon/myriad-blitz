/// @description Directional Screenshake
if image_angle!=360 {
    if time_clock%2>=1 {
        __view_set( e__VW.XView, 0, global.viewxstartpos+h_value );
        __view_set( e__VW.YView, 0, global.viewystartpos+v_value );
    } else {
        __view_set( e__VW.XView, 0, global.viewxstartpos-h_value );
        __view_set( e__VW.YView, 0, global.viewystartpos-v_value );
    }
}

///360* Screenshake
if image_angle==360 {
    if time_clock%8>=7 {
        __view_set( e__VW.XView, 0, global.viewxstartpos+h_value );
        __view_set( e__VW.YView, 0, global.viewystartpos );
    } else
    if time_clock%8>=6 {
        __view_set( e__VW.XView, 0, global.viewxstartpos+lengthdir_x(h_value,225) );
        __view_set( e__VW.YView, 0, global.viewystartpos+lengthdir_y(v_value,225) );
    } else
    if time_clock%8>=5 {
        __view_set( e__VW.XView, 0, global.viewxstartpos );
        __view_set( e__VW.YView, 0, global.viewystartpos-v_value );
    } else
    if time_clock%8>=4 {
        __view_set( e__VW.XView, 0, global.viewxstartpos+lengthdir_x(h_value,315) );
        __view_set( e__VW.YView, 0, global.viewystartpos+lengthdir_y(v_value,315) );
    } else
    if time_clock%8>=3 {
        __view_set( e__VW.XView, 0, global.viewxstartpos+lengthdir_x(h_value,135) );
        __view_set( e__VW.YView, 0, global.viewystartpos+lengthdir_y(v_value,135) );
    } else
    if time_clock%8>=2 {
        __view_set( e__VW.XView, 0, global.viewxstartpos );
        __view_set( e__VW.YView, 0, global.viewystartpos+v_value );
    } else
    if time_clock%8>=1 {
        __view_set( e__VW.XView, 0, global.viewxstartpos+lengthdir_x(h_value,45) );
        __view_set( e__VW.YView, 0, global.viewystartpos+lengthdir_y(v_value,45) );
    } else {
        __view_set( e__VW.XView, 0, global.viewxstartpos-h_value );
        __view_set( e__VW.YView, 0, global.viewystartpos );
    }
}

///Update Value & Time

if(decrease) {
    h_value=h_value0*time_clock/time;
    v_value=v_value0*time_clock/time;
}

if(time_clock<=0) {
    instance_destroy();
}

if(gpspeed!=0) {
    time_clock-=gpspeed/rate;
}

