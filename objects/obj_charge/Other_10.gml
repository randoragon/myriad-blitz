/// @description startup code

#region Startup code

cdmg = spawn.cdmg;
cpen = spawn.cpen;
ckb  = spawn.ckb;

switch(f) {
	case 0:
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
			    image_speed = 0.6 * global.gpspeed;
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
			    image_speed = 0.6 * global.gpspeed;
			    charge      = 100;
		    break;
		    case 2: //evilflame twilight fury charge
			    sprite_index  =part_star;
			    image_scale(0.3, 0.3);
			    direction = point_direction(x, y, CANVAS_XMID, CANVAS_YMID);
				speed1 = 10;
			    mask_index = spr_evilflame_fury_charge_hitbox;
		    break;
	    }
	break;
	case 1:
	    sprite_index       = spr_emerald_charge;
	    spawn.sprite_index = spr_emerald_active_charge;
	    image_speed        = 0.5 * global.gpspeed;
		charge             = 180;
	    image_scale(1, 1);
	break;
	case 2:
	    sprite_index       = -1;
	    spawn.sprite_index = spr_scootomik_active_charge;
	    visible            = 0;
	    rot                = spawn.image_angle;
	    charge             = 120;
	break;
}

#endregion