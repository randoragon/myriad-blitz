/// @description version_ge(v1, v2);
/// @param v1
/// @param v2
function version_ge() {

	// Returns whether or not the first game version
	// is greater-than or equal-to the second game version.

	var v1, v2;
	v1 = argument[0];
	v2 = argument[1];

	return (v1 == v2 || version_gt(v1, v2));


}
