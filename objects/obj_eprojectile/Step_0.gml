/// @description skip if loading
if global.loading==1 exit;

///projectile behavior
lifespan-=gpspeed;
if lifespan<=0 or y>CANVAS_YEND+sprite_yoffset or y<-sprite_height+sprite_yoffset or x<-sprite_width+sprite_xoffset instance_destroy();

switch(f)
{
case 0:
if !instance_exists(obj_emerald_ultimate) vspeed1+=acc*sqr(gpspeed);
image_angle+=rot*gpspeed;
break;
}

///emerald's current crush
if instance_exists(obj_emerald_ultimate)
if f!=2 {
if hspeed1!=0 or vspeed1!=0 {
speed1+=sqrt(sqr(hspeed1)+sqr(vspeed1));
hspeed1=0; vspeed1=0;
}
direction=home(direction,point_direction(x,y,obj_emerald_ultimate.x,obj_emerald_ultimate.y),clamp((400-distance_to_point(obj_emerald_ultimate.x,obj_emerald_ultimate.y))*.25,1,10)*gpspeed,1);
image_angle=direction;
}

///event_inherited();
event_inherited();

