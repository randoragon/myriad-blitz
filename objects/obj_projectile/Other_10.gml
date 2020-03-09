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
			    direction    = spawn.image_angle + random_range(-45 * (1 - sacc), 45 * (1 - sacc));
			    image_angle  = direction;
				lifespan     = 120;
			    image_scale(2, 2);
			break;
			case 1: // dual clone bullet
			    sprite_index = spr_evilflame_bullet;
			    direction    = -spawn.image_angle + random_range(-45 * (1 - sacc), 45 * (1 - sacc));
			    image_angle  = direction;
				lifespan     = 120;
			    image_scale(2, 2);	
			break;
			case 2: // twilight fury
			    sprite_index = part_star;
			    direction    = spawn.image_angle + random_range(-45 * (1 - sacc),45 * (1 - sacc));
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
		image_angle  = direction;
		lifespan     = 120;
		image_scale(2, 2);	
		if (e == 0) {
			image_index  = 0;
			direction = spawn.image_angle + random_range(-45 * (1 - sacc), 45 * (1 - sacc));
		} else {
			image_index  = 1;
			direction = (spawn.image_angle + random_range(-45 * (1 - sacc), 45 * (1 - sacc)) + 180) % 360;		
		}
	break;
	case PLAYER_BOBILEUSZ:
		sprite_index = spr_bobileusz_bullet;
		direction = spawn.image_angle + random_range(-45 * (1 - sacc), 45 * (1 - sacc));
		image_speed  = 0;
		image_blend  = rgb(255, 255, 128);
		speed1       = pspd;
		image_speed  = 0;
		lifespan     = 120;
		fadeout 	 = 10;
		image_scale(1, 1);
	break;
	default:
		sprite_index = spr_evilflame_bullet + global.chrsel;
		direction    = spawn.image_angle + random_range(-45 * (1 - sacc), 45 * (1 - sacc));
		speed1       = pspd;
		image_angle  = direction;
		image_speed  = 0;
		lifespan     = 120;
		image_scale(2, 2);
	break;
}

// emerald's current crush
if (instance_exists(obj_emerald_ultimate)) {
	lifespan += irandom_range(-10, 10);
	speed1 /= 2;
}

// Remember fadeout's initial value for potential later calculations
fadeoutmax = fadeout;

#endregion