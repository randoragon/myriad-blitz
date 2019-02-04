/// @description part_type_direction_speed_lt(part,dir_min,dir_max,speed_min,speed_max,speed_incr);
/// @param part
/// @param dir_min
/// @param dir_max
/// @param speed_min
/// @param speed_max
/// @param speed_incr

var grid=global.part_type_lt_grid[0];
var a=argument[0];
var b=11;

grid[# a,b++]=argument[1];
grid[# a,b++]=argument[2];
grid[# a,b++]=argument[3];
grid[# a,b++]=argument[4];
grid[# a,b]=argument[5];

