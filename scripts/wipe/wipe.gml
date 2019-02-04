/// @description wipe(object);
/// @param object
if instance_exists(argument[0])
{
with(argument[0]) instance_destroy();
return 1;
}
return 0;
