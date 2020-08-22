/// @description home(input, goal, velocity, angle);
/// @param input
/// @param goal
/// @param velocity
/// @param angle
function home() {

	// Moves a variable's value closer to the desired outcome by a constant amount

	if (argument_count > 3 && argument[3]) {
		if (abs(argument[1] - argument[0] - 360) < abs(argument[1] - argument[0])) { argument[1] -= 360; }
		if (abs(argument[1] - argument[0] + 360) < abs(argument[1] - argument[0])) { argument[1] += 360; }
	}

	return clamp(argument[1], argument[0] - argument[2], argument[0] + argument[2]);



}
