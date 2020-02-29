/// @description part_type_edit_ult(part_id, trait, val1, ...)
/// @param part_id
/// @param trait
/// @param val1
/// @param ...

/* Available Traits:
 * "sprite"
 * "image_index"
 * 
 * "size" (min, max, incr)
 * "angle" (min, max, incr)
 * 
 * "blend_mode"
 * "color" (c)
 * "alpha" (a, incr)
 */

var part   = argument[0];
var source = global.part_type[part];
var a      = argument[2];

if (argument_count > 4) { var c = argument[4]; }
if (argument_count > 3) { var b = argument[3]; }

switch(argument[1]) {
    case "sprite"     : source[| 0]  = a; break;
    case "image_index": source[| 1]  = a; break;
    case "size"       : source[| 2]  = a; source[| 3]  = b; source[| 4] = c; break;
    case "angle"      : source[| 5]  = a; source[| 6]  = b; source[| 7] = c; break;
    case "blend_mode" : source[| 8]  = a; break;
    case "color"      : source[| 9]  = a; break;
    case "alpha"      : source[| 10] = a; source[| 11] = b; break;
}