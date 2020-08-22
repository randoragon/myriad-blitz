/// @description wipe(object);
/// @param object
function wipe() {

	if (instance_exists(argument[0])) {
		with (argument[0]) { instance_destroy(); }
		return true;
	}

	return false;



}
