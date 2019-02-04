/// @description part_system_draw_lt(system);
/// @param system

var grid=argument[0];
var source=global.part_type_lt_grid[0];
var oldtonew=grid[# 0,1];
var part,sprite,percentage;
var grid_width=ds_grid_width(grid);

if oldtonew==1
for(var i=1; i<grid_width; i++) {
part=grid[# i,0];
if part==-1 continue;
percentage=1-(grid[# i,2]/grid[# i,3]);
draw_set_blend_mode(source[# part,16]);
draw_sprite_ext(source[# part,0],grid[# i,1],grid[# i,8],grid[# i,9],grid[# i,4],grid[# i,4],grid[# i,5],merge_color(source[# part,17],source[# part,18],percentage),lerp(source[# part,19],source[# part,20],percentage));
} else for(var i=grid_width-1; i>1; i--) {
part=grid[# i,0];
if part==-1 continue;
percentage=1-(grid[# i,2]/grid[# i,3]);
draw_set_blend_mode(source[# part,16]);
draw_sprite_ext(source[# part,0],grid[# i,1],grid[# i,8],grid[# i,9],grid[# i,4],grid[# i,4],grid[# i,5],merge_color(source[# part,17],source[# part,18],percentage),lerp(source[# part,19],source[# part,20],percentage));
}

draw_set_blend_mode(bm_normal);

