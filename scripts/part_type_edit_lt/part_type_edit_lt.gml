/// @description part_type_edit_lt(part, trait, val1, ...)
/// @param part
/// @param trait
/// @param val1
/// @param ...

/* Available Traits:
 * "sprite"
 * "image_index"
 * "life" (min, max)
 * 
 * "size" (min, max, incr)
 * "angle" (min, max, incr, rot_dir_random)
 * 
 * "direction" (min, max)
 * "speed" (min, max, incr)
 * 
 * "blend_mode"
 * "color" (c1, c2)
 * "alpha" (a1, a2)
 */

var source = global.part_type_lt_grid[0];
var part   = argument[0];
var a      = argument[2];

if (argument_count > 3) { var b = argument[3]; }
if (argument_count > 4) { var c = argument[4]; }
if (argument_count > 5) { var d = argument[5]; }

switch(argument[1]) {
    case "sprite"     : source[# part, 0]  = a; break;
    case "image_index": source[# part, 1]  = a; break;
    case "life"       : source[# part, 2]  = a; source[# part, 3]  = b; break;
    case "size"       : source[# part, 4]  = a; source[# part, 5]  = b; source[# part, 6]  = c; break;
    case "angle"      : source[# part, 7]  = a; source[# part, 8]  = b; source[# part, 9]  = c; source[# part, 10] = d; break;
    case "direction"  : source[# part, 11] = a; source[# part, 12] = b; break;
    case "speed"      : source[# part, 13] = a; source[# part, 14] = b; source[# part, 15] = c; break;
    case "blend_mode" : source[# part, 16] = a; break;
    case "color"      : source[# part, 17] = a; source[# part, 18] = b; break;
    case "alpha"      : source[# part, 19] = a; source[# part, 20] = b; break;
}