/// @description instance_create_layer_f(x, y, layer, object_index, value)
/// @param x
/// @param y
/// @param layer
/// @param object_index
/// @param value

var newinstance = instance_create_layer(argument[0], argument[1], argument[2], argument[3]);

with (newinstance) {
	f = argument[4];
}

return newinstance;

