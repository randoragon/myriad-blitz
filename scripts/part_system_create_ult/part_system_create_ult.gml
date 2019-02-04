/// @description part_system_create_ult(draw_oldtonew,base_slots,'limit)
/// @param draw_oldtonew
/// @param base_slots
/// @param 'limit

//base_slots is the number of particle slots the system will never go below. Base slots are slightly faster than "extra slots".
//Each particle system needs to be drawn by an object that has the same depth as the system.

var system=ds_grid_create(1+argument[1],6);
if argument[1]>0 ds_grid_set_region(system,1,0,argument[1],0,-1);
system[# 0,0]="part_system_ult";
system[# 0,1]=argument[0];
system[# 0,2]=argument[1];
system[# 0,3]=argument[1];
if argument_count==3 system[# 0,4]=argument[2]; else system[# 0,4]=-1;
return system;

