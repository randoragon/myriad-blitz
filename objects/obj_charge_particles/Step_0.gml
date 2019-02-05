/// @description Update System

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Update system

if (part_system_count_ult(global.part_system[3]) > 0)
	part_system_update_ult(global.part_system[3], gpspeed);

#endregion