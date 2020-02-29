/// @description part_type_edit_lt(part_id, trait, val1, ...)
/// @param part_id
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

var part   = argument[0];
var source = global.part_type[part];
var a      = argument[2];

if (argument_count > 3) { var b = argument[3]; }
if (argument_count > 4) { var c = argument[4]; }
if (argument_count > 5) { var d = argument[5]; }

switch(argument[1]) {
    case "sprite"     : source[| 0]  = a; break;
    case "image_index": source[| 1]  = a; break;
    case "life"       : source[| 2]  = a; source[| 3]  = b; break;
    case "size"       : source[| 4]  = a; source[| 5]  = b; source[| 6]  = c; break;
    case "angle"      : source[| 7]  = a; source[| 8]  = b; source[| 9]  = c; source[| 10] = d; break;
    case "direction"  : source[| 11] = a; source[| 12] = b; break;
    case "speed"      : source[| 13] = a; source[| 14] = b; source[| 15] = c; break;
    case "blend_mode" : source[| 16] = a; break;
    case "color"      : source[| 17] = a; source[| 18] = b; break;
    case "alpha"      : source[| 19] = a; source[| 20] = b; break;
}