/// @description version_gt(v1, v2);
/// @param v1
/// @param v2
function version_gt() {

	// Returns whether or not the first game version
	// is greater-than the second game version.

	var v1, v2, a, b;
	v1 = argument[0];
	v2 = argument[1];

	a = -1;
	b = -1;
	for (var i = 0; i < array_length_1d(global.versions); i++) {
		if (global.versions[i] == v1) { a = i; }
		if (global.versions[i] == v2) { b = i; }
		if (a != -1 && b != -1) { break; }
	}

	if (a != -1 && b == -1) { return FALSE; }
	if (a == -1 && b != -1) { return TRUE;  }
	if (a == -1 && b == -1) { return undefined; }

	return a > b;


}
