/// @description scr_SpriteSplit(sprite,subimg,xscale,yscale,color,alpha,direction);
/// @param sprite
/// @param subimg
/// @param xscale
/// @param yscale
/// @param color
/// @param alpha
/// @param direction
/*
This function was created for recreating split enemies in save slot loading. It creates a 1D array with 2 values: top and bottom half of the cut sprite.
*/
var angle=((-argument[6])%360)+(360*(argument[6]>0));

var picture_xoffset=sprite_get_xoffset(argument[0])*argument[2];
var picture_yoffset=sprite_get_yoffset(argument[0])*argument[3];
var picture_width=sprite_get_width(argument[0])*argument[2];
var picture_height=sprite_get_height(argument[0])*argument[3];

var xlen,ylen,xoffset,yoffset,tiltwidth,tiltheight;
if angle>0 && angle<90 {
    xlen=picture_xoffset; ylen=picture_yoffset;
    xoffset=sqrt(sqr(xlen)+sqr(ylen))*dcos(darctan(ylen/xlen)-(angle%90));
xlen=picture_width-picture_xoffset; ylen=picture_yoffset;
yoffset=sqrt(sqr(xlen)+sqr(ylen))*dsin(darctan(ylen/xlen)+(angle%90));
} else if angle>90 && angle<180 {
    xlen=picture_width-picture_xoffset; ylen=picture_yoffset;
    xoffset=sqrt(sqr(xlen)+sqr(ylen))*dcos(darctan(ylen/xlen)-(angle%90));
xlen=picture_width-picture_xoffset; ylen=picture_height-picture_yoffset;
yoffset=sqrt(sqr(xlen)+sqr(ylen))*dsin(darctan(xlen/ylen)+(angle%90));
} else if angle>180 && angle<270 {
    xlen=picture_width-picture_xoffset; ylen=picture_height-picture_yoffset;
    xoffset=sqrt(sqr(xlen)+sqr(ylen))*dcos(darctan(ylen/xlen)-(angle%90));
xlen=picture_xoffset; ylen=picture_height-picture_yoffset;
yoffset=sqrt(sqr(xlen)+sqr(ylen))*dsin(darctan(xlen/ylen)+(angle%90));
} else if angle>270 && angle<360 {
    xlen=picture_xoffset; ylen=picture_height-picture_yoffset;
    xoffset=sqrt(sqr(xlen)+sqr(ylen))*dcos(darctan(xlen/ylen)-(angle%90));
xlen=picture_xoffset; ylen=picture_yoffset;
yoffset=sqrt(sqr(xlen)+sqr(ylen))*dsin(darctan(xlen/ylen)+(angle%90));
} else if angle==0 or angle==360 {
xoffset=picture_xoffset;
yoffset=picture_yoffset;
} else if angle==90 {
xoffset=picture_yoffset;
yoffset=picture_width-picture_xoffset;
} else if angle==180 {
xoffset=picture_width-picture_xoffset;
yoffset=picture_height-picture_yoffset;
} else if angle==270 {
xoffset=picture_height-picture_yoffset;
yoffset=picture_xoffset;
}

if (angle>=0 && angle<90) or angle==360 {
tiltwidth=lengthdir_x(sqrt(sqr(picture_width-picture_xoffset)+sqr(picture_height-picture_yoffset)),270+darctan((picture_width-picture_xoffset)/(picture_height-picture_yoffset))+angle)-lengthdir_x(sqrt(sqr(picture_xoffset)+sqr(picture_yoffset)),90+darctan(picture_xoffset/picture_yoffset)+angle);
tiltheight=lengthdir_y(sqrt(sqr(picture_xoffset)+sqr(picture_height-picture_yoffset)),180+darctan((picture_height-picture_yoffset)/picture_xoffset)+angle)-lengthdir_y(sqrt(sqr(picture_width-picture_xoffset)+sqr(picture_yoffset)),darctan(picture_yoffset/(picture_width-picture_xoffset))+angle);
} else if angle>=90 && angle<180 {
tiltwidth=lengthdir_x(sqrt(sqr(picture_xoffset)+sqr(picture_height-picture_yoffset)),180+darctan((picture_height-picture_yoffset)/picture_xoffset)+angle)-lengthdir_x(sqrt(sqr(picture_width-picture_xoffset)+sqr(picture_yoffset)),darctan(picture_yoffset/(picture_width-picture_xoffset))+angle);
tiltheight=lengthdir_y(sqrt(sqr(picture_xoffset)+sqr(picture_yoffset)),90+darctan(picture_xoffset/picture_yoffset)+angle)-lengthdir_y(sqrt(sqr(picture_width-picture_xoffset)+sqr(picture_height-picture_yoffset)),270+darctan((picture_width-picture_xoffset)/(picture_height-picture_yoffset))+angle);
} else if angle>=180 && angle<270 {
tiltwidth=lengthdir_x(sqrt(sqr(picture_xoffset)+sqr(picture_yoffset)),90+darctan(picture_xoffset/picture_yoffset)+angle)-lengthdir_x(sqrt(sqr(picture_width-picture_xoffset)+sqr(picture_height-picture_yoffset)),270+darctan((picture_width-picture_xoffset)/(picture_height-picture_yoffset))+angle);
tiltheight=lengthdir_y(sqrt(sqr(picture_width-picture_xoffset)+sqr(picture_yoffset)),darctan(picture_yoffset/(picture_width-picture_xoffset))+angle)-lengthdir_y(sqrt(sqr(picture_xoffset)+sqr(picture_height-picture_yoffset)),180+darctan((picture_height-picture_yoffset)/picture_xoffset)+angle);
} else if angle>=170 && angle<360 {
tiltwidth=lengthdir_x(sqrt(sqr(picture_width-picture_xoffset)+sqr(picture_yoffset)),darctan(picture_yoffset/(picture_width-picture_xoffset))+angle)-lengthdir_x(sqrt(sqr(picture_xoffset)+sqr(picture_height-picture_yoffset)),180+darctan((picture_height-picture_yoffset)/picture_xoffset)+angle);
tiltheight=lengthdir_y(sqrt(sqr(picture_width-picture_xoffset)+sqr(picture_height-picture_yoffset)),270+darctan((picture_width-picture_xoffset)/(picture_height-picture_yoffset))+angle)-lengthdir_y(sqrt(sqr(picture_xoffset)+sqr(picture_yoffset)),90+darctan(picture_xoffset/picture_yoffset)+angle);
}

var temp_suf=surface_create(tiltwidth,tiltheight);
surface_set_target(temp_suf);
draw_clear_alpha(0,0);
draw_set_alpha_test_ref_value(0);
draw_sprite_ext(argument[0],argument[1],xoffset,yoffset,argument[2],argument[3],angle,argument[4],argument[5]);
draw_set_alpha_test_ref_value(254);

var sprite;
sprite[0]=sprite_create_from_surface(temp_suf,0,0,tiltwidth,round(tiltheight/2),0,0,xoffset,yoffset);
sprite[1]=sprite_create_from_surface(temp_suf,0,round(tiltheight/2),tiltwidth,tiltheight-round(tiltheight/2),0,0,xoffset,yoffset-round(tiltheight/2));
surface_reset_target();
surface_free(temp_suf);
return sprite;
