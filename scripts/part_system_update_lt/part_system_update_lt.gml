/// @description part_system_update_lt(system,step)
/// @param system
/// @param step
if argument[1]==0 exit;
var grid=argument[0];
var source=global.part_type_lt_grid[0];
var step=argument[1];
var grid_width=ds_grid_width(grid);
var busy_slots=grid[# 0,2]-grid[# 0,3];
var part;

for(var i=1; i<grid_width; i++) {

part=grid[# i,0];

if part!=-1 {
//reduce life and size
grid[# i,2]-=step;
grid[# i,4]+=step*source[# part,6]; //size
}

//life<=0 or size<=0 or ID=-1 or particle type doesn't exist
if grid[# i,2]<=0 or grid[# i,4]<=0 or part==-1 or source[# part,0]==-1 {
if busy_slots>0 {
if part==-1 continue;
grid[# i,0]=-1;
grid[# 0,3]++; busy_slots--;
} else if part!=-1 or busy_slots<0 {
if i<ds_grid_width(grid)-1 ds_grid_set_grid_region(grid,grid,i+1,0,grid_width-1,ds_grid_height(grid)-1,i,0);
ds_grid_resize(grid,--grid_width,ds_grid_height(grid));
if part==-1 {grid[# 0,3]--; busy_slots++;}
i--;
}
} else {
//update other data
grid[# i,8]+=step*lengthdir_x(grid[# i,7],grid[# i,6]); //x
grid[# i,9]+=step*lengthdir_y(grid[# i,7],grid[# i,6]); //y
grid[# i,5]+=step*source[# part,9]*grid[# i,10]; //angle
grid[# i,7]+=step*source[# part,15]; //speed
}

}

