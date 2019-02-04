/// @description part_system_update_ult(system,step)
/// @param system
/// @param step
if argument[1]==0 exit;
var grid=argument[0];
var source=global.part_type_ult_grid[0];
var step=argument[1];
var grid_width=ds_grid_width(grid);
var busy_slots=grid[# 0,2]-grid[# 0,3];
var part;

for(var i=1; i<grid_width; i++) {

part=grid[# i,0];
if part!=-1 grid[# i,1]+=step*source[# part,4];

//ID=-1 or particle type doesn't exist
if grid[# i,1]<=0 or part==-1 or source[# part,0]==-1 {
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
//update values
grid[# i,2]+=step*source[# part,7];
grid[# i,3]+=step*source[# part,11];
}

}

