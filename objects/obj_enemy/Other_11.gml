/// @description Points & KillCount

#region Increment points and global.kill_count

global.points += round(random_range(0.8, 1.2) * ((2 * hpmax) + 50));
global.kill_count++;

#endregion

#region Drop loot

if (ds_map_exists(loot, "ultimate")) {
	repeat (loot[? "ultimate"]) {
		instance_create(x, y, obj_ultimate_pickup);
		obj_player.ultcount++;
		obj_player.ultblink = 45;
	}
}
		
#endregion