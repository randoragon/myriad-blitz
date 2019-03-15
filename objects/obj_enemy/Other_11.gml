/// @description Points & KillCount

#region Increment points and global.kill_count

global.points += round(random_range(0.8, 1.2) * ((2 * hpmax) + 50));
global.kill_count++;

#endregion