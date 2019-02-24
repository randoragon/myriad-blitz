/// @description part_type_remove_lt(part)
/// @param part

/* IMPORTANT!
 * Directly after using this function you MUST manually erase all traces of the removed particle from all systems.
 * You can do that by using part_type_wipe_lt();
 */

var grid = global.part_type_lt_grid[0];
grid[# argument[0], 0] = -1;