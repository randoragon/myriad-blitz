/// @description array_setup(value, width, 'height)
/// @param value
/// @param width
/// @param 'height

var array;
var val = argument[0];

switch (argument_count) {
	case 2:
		for (var a = argument[1] - 1; a >= 0; a--) {
			array[a] = val;
		}
	break;
	case 3:
		for (var a = argument[1] - 1; a >= 0; a--) {
			for (var b = argument[2] - 1; b >= 0; b--) {
				array[a, b] = val;
			}
		}
	break;
}

return array;