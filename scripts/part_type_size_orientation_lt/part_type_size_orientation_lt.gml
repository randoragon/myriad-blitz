/// @description part_type_size_orientation_lt(part,size_min,size_max,size_incr,ang_min,ang_max,ang_incr,random_rot_dir);
/// @param part
/// @param size_min
/// @param size_max
/// @param size_incr
/// @param ang_min
/// @param ang_max
/// @param ang_incr
/// @param random_rot_dir

//random_rot_dir is a boolean value that determines whether to randomize the direction of angle spin.

var grid=global.part_type_lt_grid[0];
var a=argument[0];
var b=4;

grid[# a,b++]=argument[1];
grid[# a,b++]=argument[2];
grid[# a,b++]=argument[3];
grid[# a,b++]=argument[4];
grid[# a,b++]=argument[5];
grid[# a,b++]=argument[6];
grid[# a,b]=argument[7];

