/// @description part_type_setup_ult(sprite,subimg);
/// @param sprite
/// @param subimg
/*
The height in the 2d array is the unique ID of each part type.
*/
var grid,a;
if !ds_exists(global.part_type_ult_grid[0],ds_type_grid) {
global.part_type_ult_grid[0]=ds_grid_create(1,12);
grid=global.part_type_ult_grid[0];
a=0;
} else {
grid=global.part_type_ult_grid[0];
if ds_grid_value_exists(grid,0,0,ds_grid_width(grid)-1,0,-1) {
a=ds_grid_value_x(grid,0,0,ds_grid_width(grid)-1,0,-1);
} else {
ds_grid_resize(grid,ds_grid_width(grid)+1,12);
a=ds_grid_width(grid)-1;
}
}
var b=0;

grid[# a,b++]=argument[0]; //0. sprite_index
grid[# a,b++]=argument[1]; //1. image_index

grid[# a,b++]=1; //2. size_min
grid[# a,b++]=1; //3. size_max
grid[# a,b++]=0; //4. size_incr
grid[# a,b++]=0; //5. angle_min
grid[# a,b++]=0; //6. angle_max
grid[# a,b++]=0; //7. angle_incr

grid[# a,b++]=bm_normal; //8. blend_mode
grid[# a,b++]=c_white; //9. color
grid[# a,b++]=1; //10. alpha
grid[# a,b]=0; //11. alpha_incr

return a;

