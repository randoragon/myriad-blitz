/// @description Startup Code

#region Startup code

switch(f) {
	case 0:
		image_scale(size, size);
		instance_setup(0, 0, irandom(360), 1);
		sprite_index = spr_snowball;
		var size     = random_range(1, 1.1);
		acc          = random_range(0.05, 0.2);
		hspeed1      = random_range(-6, -10);
		vspeed1      = random_range(0, -0.2);
		rot          = random_range(-5, 5);
		lifespan     = 600;
	break;
	case 1:
		sprite_index = spr_bolt;
		instance_setup(irandom(image_number - 1), 0.25 * gpspeed, irandom(360), 1);
		direction = clamp(point_direction(x, y, obj_player.x, obj_player.y) + irandom_range(-45, 45), 120, 240);
		speed1    = random_range(1, 2);
		lifespan  = 1800;
	break;
	case 2:
		image_scale(2, 2);
		instance_setup(0, 1 * gpspeed, 0, 1);
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