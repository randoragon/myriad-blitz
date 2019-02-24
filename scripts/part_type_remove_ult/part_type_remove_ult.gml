/// @description part_type_remove_ult(part)
/// @param part

/* IMPORTANT!
 * Directly after using this function you MUST manually erase all traces of the removed particle from all systems.
 * You can do that by using part_type_wipe_ult();
 */

var grid = global.part_type_ult_grid[0];
grid[# argument[0], 0] = -1;