/// @description Update System

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Update system

if (part_system_count_ult(PART_SYSTEM_MINION) > 0)
	part_system_update_ult(PART_SYSTEM_MINION, global.gpspeed);

#endregion