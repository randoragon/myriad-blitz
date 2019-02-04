/// @description random_coords(xmin,ymin,xmax,ymax,shape,distribution)
/// @param xmin
/// @param ymin
/// @param xmax
/// @param ymax
/// @param shape
/// @param distribution
/*
This function returns a 1 dimensional array containing xx and yy.

Available Shapes:
"square"
"ellipse"
"diamond"
"line"

Available Distributions:
"linear"
"gaussian"
"invgaussian"
*/

var xmin=argument[0];
var ymin=argument[1];
var xmax=argument[2];
var ymax=argument[3];
var xx,yy;

//POINT SHAPE
if xmin==xmax && ymin==ymax {
var val;
val[0]=xmin; val[1]=ymin;
return val;
}

switch(argument[4]) {
case "square": //SQUARE SHAPE
    switch(argument[5]) {
    case "linear":
    xx=irandom_range(xmin,xmax);
    yy=irandom_range(ymin,ymax);
    break;
    case "gaussian":
    xx=gaussian_random(mean(xmin,xmax),(xmax-xmin)/2);
    yy=gaussian_random(mean(ymin,ymax),(ymax-ymin)/2);
    break;
    case "invgaussian":
    xx=invgaussian_random(mean(xmin,xmax),(xmax-xmin)/2);
    yy=invgaussian_random(mean(ymin,ymax),(ymax-ymin)/2);
    break;
    }
break;
case "ellipse": //ELLIPSE SHAPE
    switch(argument[5]) {
    case "linear":
    var angle=random(360);
    var r1=(xmax-xmin)/2;
    var r2=(ymax-ymin)/2;
    var dist=random(1)*r1*r2/sqrt(sqr(r1*dsin(angle))+sqr(r2*dcos(angle)));
    xx=mean(xmin,xmax)+lengthdir_x(dist,angle);
    yy=mean(ymin,ymax)+lengthdir_y(dist,angle);
    break;
    case "gaussian":
    var angle=random(360);
    var r1=(xmax-xmin)/2;
    var r2=(ymax-ymin)/2;
    var dist=gaussian_random(0,r1*r2/sqrt(sqr(r1*dsin(angle))+sqr(r2*dcos(angle))));
    xx=mean(xmin,xmax)+lengthdir_x(dist,angle);
    yy=mean(ymin,ymax)+lengthdir_y(dist,angle);
    break;
    case "invgaussian":
    var angle=random(360);
    var r1=(xmax-xmin)/2;
    var r2=(ymax-ymin)/2;
    var dist=gaussian_random(0,r1*r2/sqrt(sqr(r1*dsin(angle))+sqr(r2*dcos(angle))));
    xx=mean(xmin,xmax)+lengthdir_x(dist,angle);
    yy=mean(ymin,ymax)+lengthdir_y(dist,angle);
    break;
    }
break;
case "diamond": //DIAMOND SHAPE
    switch(argument[5]) {
    case "linear":
    var side_length=sqrt(sqr((xmax-xmin)/2)+sqr((ymax-ymin)/2));
    xx=random(side_length);
    yy=random(side_length);
    var alpha=2*darctan((xmax-xmin)/(ymax-ymin));
    var perpendicular=sqrt(sqr(xx)+sqr(yy)-(2*xx*yy*cos(alpha)));
    var beta=darcsin(xx*sin(alpha)/perpendicular);
    var gamma=((180-alpha)/2)-(180-alpha-beta);
    xx=xmin+lengthdir_x(perpendicular,gamma);
    yy=ymin+lengthdir_y(perpendicular,gamma);
    break;
    case "gaussian":
    var side_length=sqrt(sqr((xmax-xmin)/2)+sqr((ymax-ymin)/2));
    xx=gaussian_random(side_length/2,side_length/2);
    yy=gaussian_random(side_length/2,side_length/2);
    var alpha=2*darctan((xmax-xmin)/(ymax-ymin));
    var perpendicular=sqrt(sqr(xx)+sqr(yy)-(2*xx*yy*cos(alpha)));
    var beta=darcsin(xx*sin(alpha)/perpendicular);
    var gamma=((180-alpha)/2)-(180-alpha-beta);
    xx=xmin+lengthdir_x(perpendicular,gamma);
    yy=ymin+lengthdir_y(perpendicular,gamma);
    break;
    case "invgaussian":
    var side_length=sqrt(sqr((xmax-xmin)/2)+sqr((ymax-ymin)/2));
    xx=invgaussian_random(side_length/2,side_length/2);
    yy=invgaussian_random(side_length/2,side_length/2);
    var alpha=2*darctan((xmax-xmin)/(ymax-ymin));
    var perpendicular=sqrt(sqr(xx)+sqr(yy)-(2*xx*yy*cos(alpha)));
    var beta=darcsin(xx*sin(alpha)/perpendicular);
    var gamma=((180-alpha)/2)-(180-alpha-beta);
    xx=xmin+lengthdir_x(perpendicular,gamma);
    yy=ymin+lengthdir_y(perpendicular,gamma);
    break;
    }
break;
case "line": //LINE SHAPE
    switch(argument[5]) {
    case "linear":
    var length=sqrt(sqr(xmax-xmin)+sqr(ymax-ymin));
    var position=random(length);
    xx=xmin+((xmax-xmin)*(position/length));
    yy=ymin+((ymax-ymin)*(position/length));
    break;
    case "gaussian":
    var length=sqrt(sqr(xmax-xmin)+sqr(ymax-ymin));
    var position=gaussian_random(length/2,length/2);
    xx=xmin+((xmax-xmin)*(position/length));
    yy=ymin+((ymax-ymin)*(position/length));
    break;
    case "invgaussian":
    var length=sqrt(sqr(xmax-xmin)+sqr(ymax-ymin));
    var position=invgaussian_random(length/2,length/2);
    xx=xmin+((xmax-xmin)*(position/length));
    yy=ymin+((ymax-ymin)*(position/length));
    break;
    }
break;
}

var val;
val[0]=xx; val[1]=yy;
return val;
