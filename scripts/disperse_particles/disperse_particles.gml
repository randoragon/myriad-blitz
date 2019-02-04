/// @description disperse_particles(system,xmin,xmax,ymin,ymax,count,color);
/// @param system
/// @param xmin
/// @param xmax
/// @param ymin
/// @param ymax
/// @param count
/// @param color
part_type_edit_lt(global.disperse_part,"color",argument[6],argument[6]);
part_type_spawn_lt(argument[0],global.disperse_part,0,argument[1],argument[3],argument[2],argument[4],"ellipse","gaussian",argument[5]);
