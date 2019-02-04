/// @description part_system_update_pro(system,step)
/// @param system
/// @param step
if argument[1]==0 exit;
var grid=argument[0];
var source=global.part_type_pro_grid[0];
var step=argument[1];
var dist1,dist2,ang1,ang2,life_percentage,wiggle_factor;
var grid_width=ds_grid_width(grid);
var busy_slots=grid[# 0,2]-grid[# 0,3];
var part;

for(var i=1; i<grid_width; i++) {

part=grid[# i,0];

//reduce life
grid[# i,2]-=step;

//life<=0 or ID==-1 or particle type doesn't exist
if grid[# i,2]<=0 or part==-1 or source[# part,0]==-1 {
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
wiggle_factor=dsin(grid[# i,14]+((grid[# i,13]-grid[# i,2])*18))-((grid[# i,2]+step!=grid[# i,13])*dsin(grid[# i,14]+((grid[# i,13]-grid[# i,2]-step)*18))); //3 sine cycles per second
grid[# i,3]+=(step*source[# part,7])+(source[# part,8]*wiggle_factor); //size+=(step*size_incr)+(size_wiggle*wiggle_factor);
grid[# i,1]=(grid[# i,1]+(step*source[# part,2]))%sprite_get_number(source[# part,0]); //image_index=(image_index+(step*image_speed))%image_number;
grid[# i,4]+=(step*source[# part,11])+(source[# part,12]*wiggle_factor); //angle+=(step*angle_incr)+(angle_wiggle*wiggle_factor);
grid[# i,5]+=(step*source[# part,16])+(source[# part,17]*wiggle_factor); //direction+=(step*dir_incr)+(dir_wiggle*wiggle_factor);
grid[# i,6]+=(step*source[# part,20])+(source[# part,21]*wiggle_factor); //speed+=(step*speed_incr)+(speed_wiggle*wiggle_factor);
grid[# i,7]+=step*source[# part,23]; //grav_speed+=step*grav_speed_incr;
//grid[# i,8] - grav_dir doesn't change in any way
life_percentage=grid[# i,2]/grid[# i,13];
grid[# i,10]=source[# part,30]+((source[# part,29]-source[# part,30])*life_percentage); //alpha=alpha2+((alpha1-alpha2)*life/life_start);
dist1=step*grid[# i,6]; ang1=grid[# i,5];
dist2=step*grid[# i,7]; ang2=grid[# i,8];
grid[# i,11]+=lengthdir_x(dist1,ang1)+lengthdir_x(dist2,ang2); //x+=lengthdir_x(step*speed,direction)+lengthdir_x(step*grav_speed,grav_dir);
grid[# i,12]+=lengthdir_y(dist1,ang1)+lengthdir_y(dist2,ang2); //x+=lengthdir_y(step*speed,direction)+lengthdir_y(step*grav_speed,grav_dir);
//grid[# i,13] - life_start is constant
//color and alpha get updated during the draw
}
}

