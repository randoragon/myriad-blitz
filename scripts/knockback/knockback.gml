/// @description knockback(force,direction,Hacceleration,Vacceleration);
/// @param force
/// @param direction
/// @param Hacceleration
/// @param Vacceleration
var gpspd=gpspeed;
if(gpspeed==0) {
    if(prev_gpspeed!=0) {
        gpspd=prev_gpspeed;
    } else {
        gpspd=1;
    }
}
var kbangle=argument[1]%360;
if kbangle<0 kbangle+=360*(-floor(kbangle/360)+1);
fkb=argument[0];

if kbangle%90!=0
{
var hval=fkb*cos((kbangle%90)*pi/180);
var vval=fkb*sin((kbangle%90)*pi/180);
}

if kbangle>0 && kbangle<90 {hkb=hval; vkb=-vval;}
if kbangle>90 && kbangle<180 {hkb=-vval; vkb=-hval;}
if kbangle>180 && kbangle<270 {hkb=-hval; vkb=vval;}
if kbangle>270 && kbangle<360 && kbangle!=0 {hkb=vval; vkb=hval;}

if kbangle==0 {hkb=fkb; vkb=0;}
if kbangle==90 {hkb=0; vkb=-fkb;}
if kbangle==180 {hkb=-fkb; vkb=0;}
if kbangle==270 {hkb=0; vkb=fkb;}


//gpspeed correction
if hkb!=0
{
var ahkb0=argument[2];
var hkb0=hkb;
var th0=abs(hkb0/ahkb0);
ahkb=abs((hkb0*(th0+1))/(sqr(th0/gpspd)+(th0/gpspd)));
hkb=abs(ahkb*(th0/gpspd))*sign(hkb0);
}
if vkb!=0
{
if argument_count>=4 var avkb0=argument[3]; else var avkb0=argument[2];
var vkb0=vkb;
var tv0=abs(vkb0/avkb0);
avkb=abs((vkb0*(tv0+1))/(sqr(tv0/gpspd)+(tv0/gpspd)));
vkb=abs(avkb*(tv0/gpspd))*sign(vkb0);
}
/*show_message(
object_get_name(object_index)+':#'+
'x='+string(x)+
';# y='+string(y)+
';#self.dirkb='+string(dirkb)+
';#other.dirkb='+string(argument[1])+
';# fkb='+string(fkb)+
';# hkb='+string(hkb)+
';# vkb='+string(vkb)+';'
);
