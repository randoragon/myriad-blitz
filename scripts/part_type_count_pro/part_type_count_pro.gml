/// @description part_type_count_pro(part,system)
/// @param part
/// @param system

//Returns how many of one particle type are in a system.
//Works on both lite and pro systems.

var grid=argument[1];
var part=argument[0];
var count=0;
for(var i=1; i<ds_grid_width(grid); i++) {
if grid[# i,0]==part count++;
}
return count;

