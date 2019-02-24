/// @description part_type_edit_pro(part,  trait,  val1,  ...)
/// @param part
/// @param trait
/// @param val1
/// @param ...

/* Available Traits:
 * "sprite"
 * "image_index"
 * "image_speed"
 * "life" (min, max)
 * 
 * "size" (min, max, incr, wiggle)
 * "angle" (min, max, incr, wiggle, relative)
 * 
 * "direction" (min, max, incr, wiggle)
 * "speed" (min, max, incr, wiggle)
 * 
 * "gravity" (speed, speed_incr, ang_min, ang_max)
 * 
 * "blend_mode"
 * "color" (c1, c2)
 * "alpha" (a1, a2)
 */

var source = global.part_type_pro_grid[0];
var part   = argument[0];
var a      = argument[2];

if (argument_count > 3) { var b = argument[3]; }
if (argument_count > 4) { var c = argument[4]; }
if (argument_count > 5) { var d = argument[5]; }
if (argument_count > 6) { var e = argument[6]; }

switch (argument[1]) {
    case "sprite"     : source[# part, 0]  = a; break;
    case "image_index": source[# part, 1]  = a; break;
    case "image_speed": source[# part, 2]  = a; break;
    case "life"       : source[# part, 3]  = a; source[# part, 4]  = b; break;
    case "size"       : source[# part, 5]  = a; source[# part, 6]  = b; source[# part, 7]  = c; source[# part, 8]  = d; break;
    case "angle"      : source[# part, 9]  = a; source[# part, 10] = b; source[# part, 11] = c; source[# part, 12] = d; source[# part, 13] = e; break;
    case "direction"  : source[# part, 14] = a; source[# part, 15] = b; source[# part, 16] = c; source[# part, 17] = d; break;
    case "speed"      : source[# part, 18] = a; source[# part, 19] = b; source[# part, 20] = c; source[# part, 21] = d; break;
    case "gravity"    : source[# part, 22] = a; source[# part, 23] = b; source[# part, 24] = c; source[# part, 25] = d; break;
    case "blend_mode" : source[# part, 26] = a; break;
    case "color"      : source[# part, 27] = a; source[# part, 28] = b; break;
    case "alpha"      : source[# part, 29] = a; source[# part, 30] = b; break;
}