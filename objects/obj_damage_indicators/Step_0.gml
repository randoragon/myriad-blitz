/// @description Update System

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Update system

if (part_system_count_pro(PART_SYSTEM_DAMAGE_INDICATORS_PRO) > 0)
	part_system_update_pro(PART_SYSTEM_DAMAGE_INDICATORS_PRO, global.gpspeed);
	
#endregion