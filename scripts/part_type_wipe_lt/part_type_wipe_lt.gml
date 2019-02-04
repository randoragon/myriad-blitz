/// @description part_type_wipe_lt(part,system)
/// @param part
/// @param system

//removes all particles of a provided type from a system.
//Works on both lite and pro systems.

var grid=argument[1];
var part=argument[0];
var grid_width=ds_grid_width(grid);

for(var i=1; i<grid_width; i++) {
if grid[# i,0]==part {
if grid[# 0,3]<grid[# 0,2] {
grid[# i,0]=-1;
grid[# 0,3]++;
} else {
if i<grid_width-1 ds_grid_set_grid_region(grid,grid,i+1,0,grid_width-1,ds_grid_height(grid)-1,i,0);
ds_grid_resize(grid,--grid_width,ds_grid_height(grid));
i--;
}
}
}

