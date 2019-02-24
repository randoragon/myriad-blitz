/// @description spawn_bullet_ring(x, y, obj, f, e, enemy, spawn, count, random);
/// @param x
/// @param y
/// @param obj
/// @param f
/// @param e
/// @param enemy
/// @param spawn
/// @param count
/// @param random

var angle = irandom(359);

for (var b = 0; b < argument[7]; b++) {
    var newinstance = instance_create(argument[0], argument[1], argument[2]);
    newinstance.f     = argument[3];
    newinstance.e     = argument[4];
    newinstance.enemy = argument[5];
    newinstance.spawn = argument[6];
    if (argument[8]) {
        newinstance.direction = irandom(359);
    } else {
        newinstance.direction = angle + (b * (360 / argument[7]));
    }
}
