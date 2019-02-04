/// @description ds_grid_import(grid,data,'separator)
/// @param grid
/// @param data
/// @param 'separator
/*
Converts a string into a grid.
Separator must be a single character.
*/
var grid=argument[0];
var data; data[0]=argument[1];
if argument_count<3 var separator=";" else var separator=argument[2];
var width=string_readln_real(data,separator);
var height=string_readln_real(data,separator);
if ds_exists(grid,ds_type_grid) ds_grid_destroy(grid);
grid=ds_grid_create(width,height);

if width!=0 && height!=0 {
    var line,data_type;
    for(var i=0; i<height; i+=1) {
        for(var j=0; j<width; j+=1) {
        line=string_readln(data,separator);
        data_type=real(string_char_at(line,1));
        if data_type==0
        grid[# j,i]=real(string_delete(line,1,1));
        else if data_type==1 grid[# j,i]=string_delete(line,1,1);
        }
    }
}

return grid;
