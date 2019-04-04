/// @description instance_create(x, y, obj)
/// @param x The x position the object will be created at.
/// @param y The y position the object will be created at.
/// @param obj The object to create an instance of.

return instance_create_layer(argument[0], argument[1], global.object_layer[? argument[2]], argument[2]);