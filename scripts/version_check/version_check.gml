/// @description version_check(v1, v2);
/// @param version
function version_check() {

	// Returns whether or not the first game version
	// can load slots saved by the second game version.

	var v1, v2, compat;
	v1 = argument[0];
	v2 = argument[1];

	if (v1 == v2) { return TRUE; }

	switch(v1) {
		case "1.1.0":
			compat = [];
		break;
		case "1.1.1":
			compat = ["1.1.0"];
		break;
		case "1.2.0 beta":
			compat = ["1.1.0", "1.1.1"];
		break;
	}

	for (var i = 0; i < array_length_1d(compat); i++) {
		if (v2 == compat[i]) { return TRUE; }
	}

	return FALSE;


}
