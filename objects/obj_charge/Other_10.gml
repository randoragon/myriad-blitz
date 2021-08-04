/// @description startup code

#region Startup code

cdmg = spawn.cdmg;
cpen = spawn.cpen;
ckb  = spawn.ckb;

switch(f) {
	case PLAYER_EVILFLAME:
	    switch(e) {
		    case 0:
			    sprite_index = spr_evilflame_charge;
			    if (spawn.evilflame_sprite_swap) {
					spawn.sprite_index = spr_evilflame_ultimate;
				} else {
					spawn.sprite_index = spr_evilflame;
				}
			    direction   = spawn.image_angle;
				speed1      = 5;
			    image_speed = global.gpspeed;
			    charge      = 100;
		    break;
		    case 1: //evilflame's dual clone charge
			    sprite_index = spr_evilflame_charge;
			    if (spawn.evilflame_sprite_swap) {
					obj_evilflame_ultimate.sprite_index = spr_evilflame;
				} else {
					obj_evilflame_ultimate.sprite_index = spr_evilflame_ultimate;
				}
			    direction   = -spawn.image_angle;
				speed1      = 5;
			    image_speed = global.gpspeed;
			    charge      = 100;
		    break;
		    case 2: //evilflame twilight fury charge
			    sprite_index = part_star;
			    image_scale(0.3, 0.3);
			    direction = point_direction(x, y, CANVAS_XMID, CANVAS_YMID);
				speed1 = 10;
			    mask_index = spr_evilflame_fury_charge_hitbox;
		    break;
			case 3: // evilflame cancellation charge
				sprite_index = spr_evilflame_charge;
				direction   = spawn.image_angle + random_range(-10, 10);
				speed1      = 8;
			    image_speed = global.gpspeed;
			    charge      = 40;
				var scale   = random_range(0.65, 0.8);
				image_scale(scale, scale);
			break;
			case 4: // evilflame dual clone cancellation charge
				sprite_index = spr_evilflame_charge;
				direction   = spawn.image_angle + random_range(-10, 10);
				speed1      = 8;
			    image_speed = global.gpspeed;
			    charge      = 40;
				var scale   = random_range(0.65, 0.8);
				image_scale(scale, scale);
			break;
	    }
	break;
	case PLAYER_EMERALD:
	    sprite_index       = spr_emerald_charge;
	    spawn.sprite_index = spr_emerald_active_charge;
	    image_speed        = global.gpspeed;
		charge             = 180;
	    image_scale(1, 1);
	break;
	case PLAYER_DER_SCOOTOMIK:
	    sprite_index       = -1;
	    spawn.sprite_index = spr_scootomik_active_charge;
	    visible            = 0;
	    rot                = spawn.image_angle;
	    charge             = 120;
	break;
}

#endregion