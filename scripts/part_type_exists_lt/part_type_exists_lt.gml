/// @description part_type_exists_lt(part)
/// @param part

var grid=global.part_type_lt_grid[0];
if argument[0]!=-1
return (ds_grid_width(grid)>argument[0] && grid[# argument[0],0]!=-1);

