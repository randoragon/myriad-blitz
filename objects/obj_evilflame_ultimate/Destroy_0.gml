/// @description Cleanup

#region Cleanup

// Clear ultimate particles
part_type_wipe_lt(global.ultimate_part[0], PART_SYSTEM_ULTIMATE);
player_status_add(6, 600, 0);
player_status_add(5, 0, 0);

// Restore player full hp
player.hpmax *= 2;

#endregion