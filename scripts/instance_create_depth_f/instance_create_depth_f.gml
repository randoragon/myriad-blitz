/// @description instance_create_depth_f(x, y, depth, object_index, value)
/// @param x
/// @param y
/// @param depth
/// @param object_index
/// @param value

var newinstance = instance_create_depth(argument[0], argument[1], argument[2], argument[3]);

with (newinstance) {
	f = argument[4];
}

return newinstance;

