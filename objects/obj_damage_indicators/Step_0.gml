/// @description Update System

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Update system

if (part_system_count_pro(global.part_system[1]) > 0)
	part_system_update_pro(global.part_system[1], global.gpspeed);
	
#endregion