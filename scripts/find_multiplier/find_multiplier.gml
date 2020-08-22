/// @description find_multiplier(value, target, amount_closer)
/// @param value
/// @param target
/// @param amount_closer
function find_multiplier() {

	// Given a value and a target value, returns a number
	// which, if the value were to be multiplied by,
	// would return a number that's amount_closer to target.
	// Example:
	// find_multiplier(0.5, 1, 0.2) returns 1.2,
	// because (0.5 * 1.2 = 0.6), and 0.6 is 20% closer to 1.

	return lerp(argument[0], argument[1], argument[2]) / argument[0];


}
