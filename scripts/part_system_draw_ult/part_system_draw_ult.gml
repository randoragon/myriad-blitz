/// @description part_system_draw_ult(system);
/// @param system

var grid=argument[0];
var source=global.part_type_ult_grid[0];
var oldtonew=grid[# 0,1];
var part;
var grid_width=ds_grid_width(grid);

if oldtonew==1
for(var i=1; i<grid_width; i++) {
    part=grid[# i,0];
    if part==-1 continue;
    draw_set_blend_mode(source[# part,8]);
    draw_sprite_ext(source[# part,0],source[# part,1],grid[# i,4],grid[# i,5],grid[# i,1],grid[# i,1],grid[# i,2],source[# part,9],grid[# i,3]);
} else
for(var i=grid_width-1; i>1; i--) {
    part=grid[# i,0];
    if part==-1 continue;
    draw_set_blend_mode(source[# part,8]);
    draw_sprite_ext(source[# part,0],source[# part,1],grid[# i,4],grid[# i,5],grid[# i,1],grid[# i,1],grid[# i,2],source[# part,9],grid[# i,3]);
}

draw_set_blend_mode(bm_normal);

