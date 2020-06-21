/// @description Startup Code

#region Startup

pdmg = spawn.pdmg;
ppen = spawn.ppen;
pkb  = spawn.pkb;
pspd = spawn.pspd;
sacc = spawn.sacc;
sspd = spawn.sspd;
fmin = spawn.fmin;
fmax = spawn.fmax;

switch(f) {
	case PLAYER_EVILFLAME:
		speed1 = pspd;
		image_speed = 0;
		switch (e) {
			case 0:
				sprite_index = spr_evilflame_bullet;
			    direction    = spawn.image_angle + random_range(-45 * clamp(1 - sacc, 0, 1), 45 * clamp(1 - sacc, 0, 1));
			    image_angle  = direction;
				lifespan     = 120;
			    image_scale(2, 2);
			break;
			case 1: // dual clone bullet
			    sprite_index = spr_evilflame_bullet;
			    direction    = -spawn.image_angle + random_range(-45 * clamp(1 - sacc, 0, 1), 45 * clamp(1 - sacc, 0, 1));
			    image_angle  = direction;
				lifespan     = 120;
			    image_scale(2, 2);	
			break;
			case 2: // twilight fury
			    sprite_index = part_star;
			    direction    = spawn.image_angle + random_range(-45 * clamp(1 - sacc, 0, 1),45 * clamp(1 - sacc, 0, 1));
			    rot          = random_range(-5, 5);
			    image_angle  = irandom(359);
			    image_alpha  = 0.7;
				lifespan     = 180;
			    image_scale(0.4, 0.4);
			break;
		}
	break;
	case PLAYER_DER_SCOOTOMIK:
		sprite_index = spr_scootomik_bullet;
		image_speed  = 0;
		speed1       = pspd;
		lifespan     = 120;
		image_scale(2, 2);	
		if (e == 0) {
			image_index  = 0;
			direction = spawn.image_angle + random_range(-45 * clamp(1 - sacc, 0, 1), 45 * clamp(1 - sacc, 0, 1));
		} else {
			image_index  = 1;
			direction = (spawn.image_angle + random_range(-45 * clamp(1 - sacc, 0, 1), 45 * clamp(1 - sacc, 0, 1)) + 180) % 360;		
		}
		image_angle  = direction;
	break;
	case PLAYER_BOBILEUSZ:
		if (e == 0) {
			sprite_index = spr_bobileusz_bullet;
			direction	 = spawn.image_angle + random_range(-45 * clamp(1 - sacc, 0, 1), 45 * clamp(1 - sacc, 0, 1));
			image_speed  = 0;
			image_blend  = rgb(255, 255, 128);
			speed1       = pspd;
			image_speed  = 0;
			lifespan     = 120;
			fadeout 	 = 10;
			suf1 = surface_map_capture(250);
			suf2 = surface_map_capture(250);
		} else {
			sprite_index = -1;
			direction	 = spawn.image_angle + point_direction(0, 0, 5, -6) + random_range(-10, 10);
			image_speed  = 0;
			speed1       = random_range(7, 9);
			vspeed1		 = 0;
			image_speed  = 0;
			lifespan     = irandom_range(90, 120);
		}
	break;
	default:
		sprite_index = spr_evilflame_bullet + global.chrsel;
		direction    = spawn.image_angle + random_range(-45 * clamp(1 - sacc, 0, 1), 45 * clamp(1 - sacc, 0, 1));
		speed1       = pspd;
		image_angle  = direction;
		image_speed  = 0;
		lifespan     = 120;
		image_scale(2, 2);
	break;
}

// Emerald's current crush
if (instance_exists(obj_emerald_ultimate)) {
	lifespan += irandom_range(-10, 10);
	speed1 /= 2;
}

// Remember fadeout's initial value for potential later calculations
fadeoutmax = fadeout;

#endregion