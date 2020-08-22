/// @description invgaussian_random(mean, acceptable_range,'total_range)
/// @param mean
/// @param acceptable_range
/// @param 'total_range
function invgaussian_random() {

	// These are the same exact calculations as in gaussian_random(), but the result is inverted.

	var u1 = random(1);
	var u2 = random(1);
	var total_range;

	if (argument_count < 3) {
		total_range = 4;
	} else {
		total_range = argument[2];
	}

	var result; var tries = 0;
	do {
		result = sqrt(-2 * ln(u1)) * cos(2 * pi * u2);
		tries++;
	} until ((result >= -total_range && result <= total_range) || tries > 10);

	if (tries > 10) { return argument[0]; }

	result = (result + total_range) / (2 * total_range); // elevate the result to a range of <0;1>
	result = 1 - result;								 // invert
	result *= 2 * argument[1];							 // rescale the result to a range of <0;2*acceptable_range>
	result += argument[0];								 // shift the result to <mean-acceptable_range;mean+acceptable_range>
	return result;



}
