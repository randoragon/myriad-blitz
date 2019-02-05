/// @description Update System

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Update system

if (part_system_count_lt(global.part_system[5]) > 0)
	part_system_update_lt(global.part_system[5], gpspeed);

#endregion