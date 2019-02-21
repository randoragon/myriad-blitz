/// @description instance_create_f(x, y, object_index, value)
/// @param x
/// @param y
/// @param object_index
/// @param value

var newinstance = instance_create(argument[0], argument[1], argument[2]);

with (newinstance) {
	f = argument[3];
}

return newinstance;

