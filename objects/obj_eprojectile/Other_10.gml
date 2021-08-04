/// @description Startup Code

#region Startup code

switch(f) {
	case 0:
		var size, tx, ty, lastd;
	    size = random_range(1, 1.1);
		image_scale(size, size);
		instance_setup(0, 0, irandom(360), 1);
		sprite_index = spr_snowball;
		tx			 = obj_player.x;
		ty			 = obj_player.y;
		acc          = GRAVITY;
		speed1		 = 15;
		/* Calculating the exact angle is VERY cumbersome, approximate instead.
		 * Keep track of the closest solution to the distance equation.
		 */
		lastd = 0xFFFFFFFF;
		for (var dx, sy, t, a = 180 - 45; a < 180 + 20; a += 2) {
			dx = abs(x - tx);
			t  = abs(dx / speed1 / dcos(a));
			sy = y - (speed1 * dsin(a) * t) + (acc * t * (t + 1) / 2);
			if (abs(ty - sy) < lastd) {
				direction = a;
				lastd = abs(ty - sy);
			}
		}
		// Prevent aim-bot abuse
		direction += irandom_range(-8, 8);
		rot        = random_range(-5, 5);
		lifespan   = 600;
	break;
	case 1:
		if (e == 0) {
			sprite_index = spr_bolt;
			instance_setup(irandom(image_number - 1), 0.25 * global.gpspeed, irandom(360), 1);
			lifespan = irandom_range(300, 1000);	
		} else {
			sprite_index = spr_bolt2;
			instance_setup(irandom(image_number - 1), 0.33 * global.gpspeed, irandom(360), 1);
			lifespan = 1800;
		}
	break;
	case 2:
		image_scale(2, 2);
		instance_setup(0, global.gpspeed, 0, 1);
		sprite_index = spr_laser;
		hspeed1      = -10;
		lifespan     = 300;
	break;
}

if (instance_exists(spawn)) {
	pdmg = spawn.pdmg;
	ppen = spawn.ppen;
	pkb  = spawn.pkb;
} else {
	instance_destroy();
}

#endregion