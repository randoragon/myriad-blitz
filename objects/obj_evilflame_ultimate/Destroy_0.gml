/// @description Cleanup

#region Cleanup

// Clear ultimate particles
part_type_wipe_lt(PART_TYPE_P_EVILFLAME_DUAL_CLONE_THRUSTER, PART_SYSTEM_ULTIMATE);
player_status_add(6, 600, 0);
player_status_add(5, 0, 0);

// Restore player full hp
player.hpmax *= 2;
global.hp    *= 2;

#endregion