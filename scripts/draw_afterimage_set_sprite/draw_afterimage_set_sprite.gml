/// @description draw_afterimage_set_sprite(newsprite,subimg)
/// @param newsprite
/// @param subimg
if ds_exists(afterimage_ds_grid,ds_type_grid) {
ds_grid_set_region(afterimage_ds_grid,1,0,ds_grid_width(afterimage_ds_grid)-1,0,argument[0]);
ds_grid_set_region(afterimage_ds_grid,1,1,ds_grid_width(afterimage_ds_grid)-1,1,argument[1]);
}
