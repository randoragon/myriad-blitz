/// @description spawn_minion(x, y, minionID, e, spawn);
/// @param x
/// @param y
/// @param minionID
/// @param e
/// @param spawn
function spawn_minion() {

	var newinstance = instance_create(argument[0], argument[1], obj_minion);

	newinstance.f     = argument[2];
	newinstance.e     = argument[3];
	newinstance.spawn = argument[4];

	return newinstance;



}
