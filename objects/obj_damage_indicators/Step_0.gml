/// @description skip if loading
if global.loading==1 exit;

///update system
if part_system_count_pro(global.part_system[1])>0
part_system_update_pro(global.part_system[1],gpspeed);

