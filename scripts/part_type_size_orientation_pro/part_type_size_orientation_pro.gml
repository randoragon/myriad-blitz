/// @description part_type_size_orientation_pro(part,size_min,size_max,size_incr,size_wiggle,ang_min,ang_max,ang_incr,ang_wiggle,ang_relative);
/// @param part
/// @param size_min
/// @param size_max
/// @param size_incr
/// @param size_wiggle
/// @param ang_min
/// @param ang_max
/// @param ang_incr
/// @param ang_wiggle
/// @param ang_relative

var grid=global.part_type_pro_grid[0];
var a=argument[0];
var b=5;

grid[# a,b++]=argument[1];
grid[# a,b++]=argument[2];
grid[# a,b++]=argument[3];
grid[# a,b++]=argument[4];
grid[# a,b++]=argument[5];
grid[# a,b++]=argument[6];
grid[# a,b++]=argument[7];
grid[# a,b++]=argument[8];
grid[# a,b]=argument[9];

