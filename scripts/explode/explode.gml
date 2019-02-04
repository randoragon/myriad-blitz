/// @description explode(x,y,size,sfx?)
/// @param x
/// @param y
/// @param size
/// @param sfx?
with(instance_create(argument[0],argument[1],obj_explosion))
{
image_scale(argument[2],argument[2]);
if argument[3] play_sfx(choose(sfx_explosion1,sfx_explosion2,sfx_explosion3),sound_priority.explosion,0,sound_gpspeed*100);
}
