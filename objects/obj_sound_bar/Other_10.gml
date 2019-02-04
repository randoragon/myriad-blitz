/// @description startup code

sprite_index=spr_slider_bar;
switch(f)
{
case 0:
image_index=0;
val=global.muspercentage;
xdot=x-169+(val*338/100);
ydot=y+11-(13*abs((val*338/100)-169)/169);
image_blend=rgb(0,255,0);
break;
case 1:
image_index=1;
val=global.sfxpercentage;
xdot=x-169+(val*338/100);
ydot=y+11-(13*abs((val*338/100)-169)/169);
image_blend=rgb(255,180,0);
break;
}

