/// @description home(input, goal, velocity, is_angle);
/// @param input
/// @param goal
/// @param velocity
/// @param is_angle
function home() {

	// Moves a variable's value closer to the desired outcome by a constant amount

	var input, goal, velocity, is_angle;
	input    = argument[0];
	goal     = argument[1];
	velocity = argument[2];
	is_angle = (argument_count > 3 && argument[3]);

	if (is_angle) {
		if (abs(goal - input - 360) < abs(goal - input)) { goal -= 360; }
		if (abs(goal - input + 360) < abs(goal - input)) { goal += 360; }
	}

	return clamp(goal, input - velocity, input + velocity);

}
