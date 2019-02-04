/// @description draw_afterimage(count,alpha,fadeout,frameskip,rate);
/// @param count
/// @param alpha
/// @param fadeout
/// @param frameskip
/// @param rate

//This script uses the "afterimage_ds_grid" grid pointer as storage for seperate frames
//of the afterimage effect. For it to work the mentioned variable must be declared in
//the running instance's create event as -1.                                                           <- IMPORTANT!
//The grid splits each frame's data into seperate columns. Rows contain different type of data
//per frame. Therefore, the more seperate images there are supposed to be, the wider the
//grid will grow.

//COUNT - how many last frames are kept in memory at once
//ALPHA - the alpha of the first frame (closest to the instance)
//FADEOUT - boolean, whether or not to fade out alpha when drawing further frames
//FRAMESKIP - how many frames to skip when drawing <count> number of frames [integer] (if you have 10 frames and frameskip==1, then 5 frames are gonna be visible on the screen)
//RATE - how often count gets updated (works like alarms, min 1)

var grid=afterimage_ds_grid;

//create grid if it hasn't been created yet
if !ds_exists(grid,ds_type_grid) {
afterimage_ds_grid=ds_grid_create(1,8);
grid=afterimage_ds_grid;
grid[# 0,0]=0;
}

//add current frame to the grid
if grid[# 0,0]<=0 {
if ds_grid_width(grid)<argument[0]+1 {
ds_grid_resize(grid,ds_grid_width(grid)+1,8);
}
else {
var _rateCount=grid[# 0,0];
ds_grid_set_grid_region(grid,grid,1,0,ds_grid_width(grid)-1,7,0,0);
ds_grid_set_region(grid,0,1,0,7,0);
grid[# 0,0]=_rateCount;
}
var new_column=ds_grid_width(grid)-1;
grid[# new_column,0]=sprite_index;
grid[# new_column,1]=image_index;
grid[# new_column,2]=x;
grid[# new_column,3]=y;
grid[# new_column,4]=image_xscale;
grid[# new_column,5]=image_yscale;
grid[# new_column,6]=image_angle;
grid[# new_column,7]=argument[1];
grid[# 0,0]=argument[4]-1;
}
else {
grid[# 0,0]--;
}

//draw the afterimage
draw_set_alpha_test_ref_value(floor(ds_grid_get_min(grid,1,7,ds_grid_width(grid)-1,7)*draw_get_alpha()*255));
for(var i=1; i<ds_grid_width(grid); i+=argument[3]+1) {
if grid[# i,7]>0
draw_sprite_ext(grid[# i,0],grid[# i,1],grid[# i,2],grid[# i,3],grid[# i,4],grid[# i,5],grid[# i,6],image_blend,grid[# i,7]*draw_get_alpha());
grid[# i,7]-=argument[1]/(argument[0]*argument[4]);
}
draw_set_alpha_test_ref_value(254);

