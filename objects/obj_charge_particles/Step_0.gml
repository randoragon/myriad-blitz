/// @description skip if loading
if global.loading==1 exit;

///update system
if part_system_count_ult(global.part_system[3])>0
part_system_update_ult(global.part_system[3],gpspeed);

