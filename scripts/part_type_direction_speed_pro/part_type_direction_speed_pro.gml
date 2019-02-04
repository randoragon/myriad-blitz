/// @description part_type_direction_speed_pro(part,dir_min,dir_max,dir_incr,dir_wiggle,speed_min,speed_max,speed_incr,speed_wiggle);
/// @param part
/// @param dir_min
/// @param dir_max
/// @param dir_incr
/// @param dir_wiggle
/// @param speed_min
/// @param speed_max
/// @param speed_incr
/// @param speed_wiggle

var grid=global.part_type_pro_grid[0];
var a=argument[0];
var b=14;

grid[# a,b++]=argument[1];
grid[# a,b++]=argument[2];
grid[# a,b++]=argument[3];
grid[# a,b++]=argument[4];
grid[# a,b++]=argument[5];
grid[# a,b++]=argument[6];
grid[# a,b++]=argument[7];
grid[# a,b]=argument[8];

