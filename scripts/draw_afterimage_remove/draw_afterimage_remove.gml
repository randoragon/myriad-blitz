/// @description draw_afterimage_remove();
if ds_exists(afterimage_ds_grid,ds_type_grid) {
ds_grid_destroy(afterimage_ds_grid);
afterimage_ds_grid=-1;
}
