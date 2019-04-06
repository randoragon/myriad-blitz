/// @description Update System

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Update system

if (part_system_count_lt(PART_SYSTEM_ULTIMATE) > 0)
	part_system_update_lt(PART_SYSTEM_ULTIMATE, global.gpspeed);

#endregion