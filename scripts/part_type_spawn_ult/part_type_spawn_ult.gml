/// @description part_type_spawn_ult(system, part_id, spawn_slot, xmin, ymin, xmax, ymax, shape, distr, amount)
/// @param system
/// @param part_id
/// @param spawn_slot
/// @param xmin
/// @param ymin
/// @param xmax
/// @param ymax
/// @param shape
/// @param distr
/// @param amount

/* Spawn slot is basically a cell in a ds_list that counts how many particles should be spawned in a step.
 * For example if amount=0.5, then spawn slot cell will repeatedly add 0.5 to its value, and whenever it goes >=1, a value%1 number of particles will be spawned.
 * Different slots should be used for spawning fractions of particles per step. Spawn slots don't include integer amounts.
 * Example:
 * slot 0: amount=0.25; 0 -> 0.25 -> 0.5 -> 0.75 -> 0 -> ...
 * slot 1: amount=0.42; 0 -> 0.42 -> 0.84 -> 0.26 -> ...
 * 
 * Spawn_slot must be an integer value of at least 0.
 * 
 * THERE IS ONLY ONE SPAWN SLOT LIST FOR ALL **LITE** PARTICLES
 */

var grid = argument[0];
if (grid[# 0, 4] != -1 && grid[# 0, 4] <= part_system_count_ult(grid)) { exit; }
var slot_list = global.part_type_ult_slots;
var part      = argument[1];
var source	  = global.part_type[part];

var xmin = argument[3];
var ymin = argument[4];
var xmax = argument[5];
var ymax = argument[6];

if (argument[9] % 1 != 0) {
    // create or resize the current slot_list for further calculations
    if (!ds_exists(slot_list, ds_type_list)) {
        global.part_type_ult_slots = ds_list_create();
        slot_list                    = global.part_type_ult_slots;
        slot_list[| argument[2]]     = argument[9];
    } else if (ds_list_size(slot_list) < argument[2] + 1 || is_undefined(slot_list[| argument[2]])) {
        slot_list[| argument[2]] =  argument[9];
    } else {
        slot_list[| argument[2]] += argument[9];
    }

    // calculate how many particles should be spawned in this step (system limit taken into account)
    var part_count = floor(slot_list[| argument[2]]);
    slot_list[| argument[2]] -= part_count;
} else {
    var part_count = argument[9];
}
if (grid[# 0, 4] != -1) {
    part_count = min(part_count, grid[# 0, 4] - part_system_count_ult(grid));
}

// create each particle
var a, coords;
repeat (part_count) {

    // choose position on the system grid
    if (grid[# 0, 3] > 0 && ds_grid_value_exists(grid, 1, 0, ds_grid_width(grid)-1, 0, -1)) {
    a = ds_grid_value_x(grid, 1, 0, ds_grid_width(grid)-1, 0, -1);
    grid[# 0, 3]--;
    } else {
    a = ds_grid_width(grid);
    ds_grid_resize(grid, a + 1, ds_grid_height(grid));
    }
    
    // pick particle coordinates
    coords = random_coords(xmin, ymin, xmax, ymax, argument[7], argument[8]);
    
    grid[# a, 0] = part; // part_id
    grid[# a, 1] = random_range(source[| 2], source[| 3]); // size
    grid[# a, 2] = random_range(source[| 5], source[| 6]); // angle
    grid[# a, 3] = source[| 10]; // alpha
    grid[# a, 4] = coords[0]; // x
    grid[# a, 5] = coords[1]; // y
}