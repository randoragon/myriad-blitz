/// @description Dual Clone Behavior

#region Skip if loading

if (global.loading) { exit; }

#endregion

if (global.gpspeed != 0) {
	#region General behavior & particles
	
    x =  player.x;
    y = -player.y + room_height;
    image_angle = -player.image_angle;
    image_index =  player.image_index;
    inv -= (inv > 0);
	
    if (global.state != 2 && real_step()) {
        var xoffset = -22; var yoffset = -1;											// this is the distance from the center of the sprite to the point from which the particles are supposed to pour out
        var dis     = sqrt(sqr(xoffset * image_xscale) + sqr(yoffset * image_yscale));  // this is to calculate distance from the center of the sprite to the point from which the particles are supposed to pour out
        var ang     = point_direction(0, 0, xoffset, yoffset) + image_angle;			// this is the angle between the center of the sprite and the particle point, player tilt included
        part_type_edit_lt(PART_TYPE_P_EVILFLAME_DUAL_CLONE_THRUSTER_LT, "direction", -image_angle - 10, -image_angle + 10);
        part_type_edit_lt(PART_TYPE_P_EVILFLAME_DUAL_CLONE_THRUSTER_LT, "size", abs(0.15 * image_yscale), abs(0.25 * image_yscale), -0.008 * image_xscale);
        part_type_edit_lt(PART_TYPE_P_EVILFLAME_DUAL_CLONE_THRUSTER_LT, "speed", 7 * image_yscale, 11 * image_yscale, 0);
        part_type_spawn_lt(PART_SYSTEM_PLAYERBOT_LT, PART_TYPE_P_EVILFLAME_DUAL_CLONE_THRUSTER_LT, 4, x + lengthdir_x(dis, ang), y + lengthdir_y(dis, ang), x + lengthdir_x(dis, ang), y + lengthdir_y(dis, ang), "line", "linear", 1.5);
    }

	if (hpmark != hp) { hpmark = home(hpmark, hp, hpmark_v * global.gpspeed, 0); } //this is for both Gameplay bars and GUI bars

	#endregion

	#region Shooting & charge

	var can_shoot = discharge > 0 || !mouse_check_button(mb_right);
	if (can_shoot) {
		// is shooting event:
		var is_shooting = keyboard_check(KEYBIND_SHOOT) || (mouse_check_button(mb_left) && (!place_meeting(boss.x, boss.y, obj_button) || instance_place(boss.x, boss.y, obj_button).image_alpha == 0));
		if (is_shooting) {
			if (player.evilflame_sprite_swap) {
				sprite_index = spr_evilflame_shooting;
			} else {
				sprite_index = spr_evilflame_ultimate_shooting;
			}
			if (shot <= 0) {
				play_sfx(sfx_evilflame_shoot, 0, global.sound_gpspeed * 100);
				var xoffset = 32 * image_xscale;
				var yoffset = -7 * image_yscale;
				var angle   = image_angle + point_direction(0, 0, xoffset, yoffset);
				angle      %= 360;
				var l       = sqrt(sqr(xoffset) + sqr(yoffset));
				spawn_bullet(x + lengthdir_x(l, angle), y + lengthdir_y(l, angle), obj_projectile, 0, 1, -1, player);
				shot += 60 / player.sspd;
			} else {
				shot -= global.gpspeed;
			}
		} else { //can shoot but doesn't shoot:
			if (!player.evilflame_sprite_swap) {
				if (sprite_index == spr_evilflame_ultimate_shooting) { sprite_index = spr_evilflame_ultimate; }
			} else {
				if (sprite_index == spr_evilflame_shooting) { sprite_index = spr_evilflame; }
			}
			shot = home(shot, 0, global.gpspeed);
		}
	} else { // can't shoot:
		shot = home(shot, 0, 1, global.gpspeed);
	}

	//charge
	if (global.state == 1 && global.gpspeed != 0) {
		if (mouse_check_button(mb_right) && global.state == 1) {
			bar_opacity[2] = 5;
			if (discharge == 0) {
				if (player.evilflame_sprite_swap) {
					if (sprite_index != spr_evilflame_charging) { sprite_index = spr_evilflame_charging; }
				} else {
					if (sprite_index != spr_evilflame_ultimate_charging) { sprite_index = spr_evilflame_ultimate_charging; }
				}
				charge = min(charge + global.gpspeed, ctime);
				if (!audio_is_playing(sfx_charging)) {
					play_sfx(sfx_charging, 0, global.sound_gpspeed * 100);
				}
			}
		}
    
		if (mouse_check_button(mb_right) && charge > 0) {
			if (charge >= ctime) {
				cb = 1;
				play_sfx(sfx_evilflame_charge_shot, 0, global.sound_gpspeed * 100);
				charge = 0;
				if (artcharge == 0) {
					discharge = ccooldown;
				} else {
					artcharge = 0;
					mouse_clear(mb_right);
				}
			}
		}
    
		if (!mouse_check_button(mb_right) && charge>0 && charge<ctime) {
			charge = 0;
			bar_opacity[2] = 0;
			if (!player.evilflame_sprite_swap) {
				sprite_index = spr_evilflame_ultimate;
			} else {
				sprite_index = spr_evilflame;
			}
		}
    
		//spawning the charge
		if (cb == 1) {
			cb = 0;
			with (player) { knockback(10, 180 + image_angle, 1); }
			spawn_bullet(x + 20, y, obj_charge, 0, 1, -1, player);
		}
		discharge = max(0, discharge - global.gpspeed);
	}

	#endregion

	#region Presents & taking damage

	if (global.state == 1) {
		if (place_meeting(x, y, obj_present) && instance_place(x, y, obj_present).picked == 0) {
			with (instance_place(x,y,obj_present)) {
				switch(f) {
					case 0:
						player_hp(number,other.id);
						picked = 1;
					break;
					case 1:
						other.charge = other.ctime;
						other.artcharge = 1;
						picked = 1;
						other.bar_opacity[2] = 5;
					break;
				}
				play_sfx(sfx_button4, 0);
			}
		}
	    //TAKING DAMAGE
	    inv -= (inv > 0);
	    if ((place_meeting(x, y, obj_enemy) || place_meeting(x, y, obj_eprojectile)) && hp > 0 && inv == 0) {
			
		    inv = round(invtime / global.gpspeed);
			play_sfx(sfx_player_hurt, 0, global.sound_gpspeed * 100);
    
		    //contact damage
		    if (place_meeting(x, y, obj_enemy) && (!place_meeting(x, y, obj_eprojectile) || (distance_to_object(instance_place(x, y, obj_eprojectile)) > distance_to_object(instance_place(x, y, obj_enemy)))) && instance_place(x, y, obj_enemy).touchable == 1) {
			    var enemy  = instance_place(x, y, obj_enemy);
			    var damage = calculate_damage(enemy.bdmg, enemy.bpen, player.bdef);
			    var display_damage = ceil(hp) - ceil(hp - damage);
			    player_hp(-damage, id);
			    with(player) { knockback((100 - bkbres) * enemy.bkb / 1000, -point_direction(enemy.x, enemy.y, other.x, other.y), counteracc); }
			    indicate(x, y, display_damage, 2, rgb(255, 170, 0), c_red);
			    with(enemy) {
				    var damage         = calculate_damage(other.player.bdmg, other.player.bpen, bdef);
				    var display_damage = ceil(hp) - ceil(hp - damage);
				    hp                 = clamp(hp - damage, 0, hpmax);
				    knockback((100 - bkbres) * other.player.bkb / 1000, point_direction(other.x, other.y, x, y), 1);
				    indicate(x, y, display_damage, 1, rgb(255, 85, 0), c_red);
			    }
		    }
    
		    //eprojectile damage
		    if (place_meeting(x, y, obj_eprojectile) && (!place_meeting(x, y, obj_enemy) || distance_to_object(instance_place(x, y, obj_enemy)) > distance_to_object(instance_place(x, y, obj_eprojectile)) || instance_place(x, y, obj_enemy).touchable == 0)) {
			    var projectile     = instance_place(x, y, obj_eprojectile);
			    var damage         = calculate_damage(projectile.pdmg, projectile.ppen, player.pdef);
			    var display_damage = ceil(hp) - ceil(hp - damage);
			    player_hp(-damage, id);
			    with(player) { knockback((100 - pkbres) * projectile.pkb / 1000, -point_direction(projectile.x, projectile.y, other.x, other.y), counteracc); }
			    indicate(projectile.x, projectile.y, display_damage, 2, rgb(255, 170, 0), c_red);
			    with (projectile) { instance_destroy(); }
		    }
	    }
	}

	#endregion

	#region Cancellation Clock
	
	if (cancellation_clock > 0 && global.gpspeed != 0 && real_step()) {
		if (cancellation_clock-- % 15 == 0) {
			with (player) { knockback(7, 180 + image_angle, 1); }
			spawn_bullet(x + 20, y, obj_charge, 0, 4, -1, player);
			play_sfx(sfx_evilflame_charge_shot, 0, global.sound_gpspeed * 100);
		}
		if (cancellation_clock == 0) {
			fx_shockwave(x, y, 600, 3, 20, c_aqua, depth, 0.8);
			instance_create_layer(x, y, "Explosions", obj_explosion);
			instance_destroy();
		}
	}
	
	#endregion

	#region Death

	if (hp <= 0 && image_alpha == 1) {
		instance_create_layer(x, y, "Explosions", obj_explosion);
		instance_destroy();
	}
	
	#endregion
}

#region Inherit parent event

event_inherited();

#endregion