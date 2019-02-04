/// @description spawn_bullet(x,y,obj,f,e,enemy,spawn);
/// @param x
/// @param y
/// @param obj
/// @param f
/// @param e
/// @param enemy
/// @param spawn

var newinstance=instance_create(argument[0],argument[1],argument[2]);

newinstance.f=argument[3];
newinstance.e=argument[4];
newinstance.enemy=argument[5];
newinstance.spawn=argument[6];

return newinstance;
