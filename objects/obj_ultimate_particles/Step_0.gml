/// @description skip if loading
if global.loading==1 exit;

///update system
if part_system_count_lt(global.part_system[6])>0
part_system_update_lt(global.part_system[6],gpspeed);

