/// @description save_append(data, val)
/// @param data
/// @param val
function save_append() {

	var data = argument[0]
	data[@ 0] += string(argument[1]) + ";";


}
