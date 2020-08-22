/// @description part_type_edit_pro(part_id,  trait,  val1,  ...)
/// @param part_id
/// @param trait
/// @param val1
/// @param ...
function part_type_edit_pro() {

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

	var part   = argument[0];
	var source = global.part_type[part];
	var a      = argument[2];

	if (argument_count > 3) { var b = argument[3]; }
	if (argument_count > 4) { var c = argument[4]; }
	if (argument_count > 5) { var d = argument[5]; }
	if (argument_count > 6) { var e = argument[6]; }

	switch (argument[1]) {
	    case "sprite"     : source[| 0]  = a; break;
	    case "image_index": source[| 1]  = a; break;
	    case "image_speed": source[| 2]  = a; break;
	    case "life"       : source[| 3]  = a; source[| 4]  = b; break;
	    case "size"       : source[| 5]  = a; source[| 6]  = b; source[| 7]  = c; source[| 8]  = d; break;
	    case "angle"      : source[| 9]  = a; source[| 10] = b; source[| 11] = c; source[| 12] = d; source[| 13] = e; break;
	    case "direction"  : source[| 14] = a; source[| 15] = b; source[| 16] = c; source[| 17] = d; break;
	    case "speed"      : source[| 18] = a; source[| 19] = b; source[| 20] = c; source[| 21] = d; break;
	    case "gravity"    : source[| 22] = a; source[| 23] = b; source[| 24] = c; source[| 25] = d; break;
	    case "blend_mode" : source[| 26] = a; break;
	    case "color"      : source[| 27] = a; source[| 28] = b; break;
	    case "alpha"      : source[| 29] = a; source[| 30] = b; break;
	}


}
