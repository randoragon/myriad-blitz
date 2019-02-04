/// @description event_inherited
event_inherited();

///growth
image_xscale+=spd;
spd-=acc;
image_yscale=image_xscale;
if spd<0 && image_xscale+spd<=1 {image_scale(1,1); spd=0; acc=0;}

///button clicking

if place_meeting(x,y,boss)
{
if mouse_check_button_pressed(mb_left) grabbed=1;
if mouse_check_button_released(mb_left) && grabbed==1 {script_execute(script);}
}

if !mouse_check_button(mb_left) grabbed=0;
image_index=grabbed;

