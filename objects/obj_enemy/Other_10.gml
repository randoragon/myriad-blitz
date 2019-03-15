/// @description Startup Code

#region Startup code

if (global.kill_count >= boss.last_ult + 100 || (global.kill_count > boss.last_ult && irandom(99) == 0)) {
	loot[? "ultimate"] = 1;
	boss.last_ult     += 100;
}

switch(f) {
	case 0:
		enemy_setup(spr_rocket_elf, 1, 0, 4, 1);
		stats_main(100, 0, 30, 40, 1, 1, 135, 33, 150, 80, 80, 95, 70, 50);
		stats_projectile("p", -1, -1, -1);
		instance_setup(irandom(image_number), 0.4 * global.gpspeed);
	break;
	case 1:
		enemy_setup(spr_crow, 1, 1, 1, 1);
		stats_main(90, 27, 56, 24, 45, 50, 74, 0, 50, 10, 5, 0, 15, 20);
		stats_projectile("p", -1, -1, -1);
		instance_setup(irandom(image_number), 0.5 * global.gpspeed);
	break;
	case 2:
		enemy_setup(spr_snowman, 1, 0, 8, 1);
		stats_main(145, 42, 15, 25, 45, 10, 72, 10, 80, 40, 40, 40, 40, 40);
		stats_projectile("p", 98, 0, 120);
		instance_setup(irandom(image_number), 0.4 * global.gpspeed);
	break;
	case 3:
		enemy_setup(spr_gingerbread_man, 1, 1, 1, 1);
		stats_main(110, 15, 34, 29, 15, 0, 40, 0, 30, 10, 10, 10, 10, 10);
		stats_projectile("p", 75, 65, 40);
		instance_setup(irandom(image_number), 0.2 * global.gpspeed);
	break;
	case 4:
		enemy_setup(spr_reindeer, 1, 1, 1, 0);
		stats_main(80, 42, 58, 45, 65, 80, 95, 0, 125, 43, 90, 95, 55, 30);
		stats_projectile("p", 115, 35, 70);
		instance_setup(irandom(image_number), random_range(0.15, 0.2) * global.gpspeed);
		y = clamp(y, 100, 556);
		if (global.gpspeed != 0) {
		    hspeed1 = -25 * image_speed / global.gpspeed;
		} else {
		    if (global.prev_gpspeed != 0) {
		        hspeed1 = -25 * image_speed / global.prev_gpspeed;
		    } else {
		        hspeed1 = -25 * image_speed;
		    }
		}
	break;
}

#endregion