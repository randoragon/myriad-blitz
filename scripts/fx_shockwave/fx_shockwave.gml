/// @description /fx_shockwave(x,y,maxradius,thickness,time,color,depth,alpha);
/// @param x
/// @param y
/// @param maxradius
/// @param thickness
/// @param time
/// @param color
/// @param depth
/// @param alpha
var finstance=instance_create(x,y,obj_shockwave);
finstance.x=argument[0];
finstance.y=argument[1];
finstance.maxradius=argument[2];
finstance.image_xscale=argument[3];
finstance.time=argument[4];
finstance.image_blend=argument[5];
finstance.depth=argument[6];
finstance.image_alpha=argument[7];
finstance.maxalpha=argument[7];
