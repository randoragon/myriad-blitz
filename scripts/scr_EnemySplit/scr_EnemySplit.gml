/// @description scr_EnemySplit(enemyid, direction);
/// @param enemyid
/// @param direction
function scr_EnemySplit() {

	var enemy         = argument[0];
	var angle         = ((-argument[1]) % 360) + (360 * (argument[1] > 0));

	var enemy_xoffset = enemy.sprite_xoffset;
	var enemy_yoffset = enemy.sprite_yoffset;
	var enemy_width   = enemy.sprite_width;
	var enemy_height  = enemy.sprite_height;

	var xlen, ylen, xoffset, yoffset, tiltwidth, tiltheight;
	if (angle > 0 && angle < 90) {
	    xlen    = enemy_xoffset;
	    ylen    = enemy_yoffset;
	    xoffset = sqrt(sqr(xlen) + sqr(ylen)) * dcos(darctan(ylen / xlen) - (angle % 90));
	    xlen    = enemy_width - enemy_xoffset;
		ylen    = enemy_yoffset;
	    yoffset = sqrt(sqr(xlen) + sqr(ylen)) * dsin(darctan(ylen / xlen) + (angle % 90));
	} else if (angle > 90 && angle < 180) {
	    xlen    = enemy_width - enemy_xoffset;
	    ylen    = enemy_yoffset;
	    xoffset = sqrt(sqr(xlen) + sqr(ylen)) * dcos(darctan(ylen / xlen) - (angle % 90));
	    xlen    = enemy_width - enemy_xoffset;
	    ylen    = enemy_height - enemy_yoffset;
	    yoffset = sqrt(sqr(xlen) + sqr(ylen)) * dsin(darctan(xlen / ylen) + (angle % 90));
	} else if (angle > 180 && angle < 270) {
	    xlen    = enemy_width - enemy_xoffset;
	    ylen    = enemy_height - enemy_yoffset;
	    xoffset = sqrt(sqr(xlen) + sqr(ylen)) * dcos(darctan(ylen / xlen) - (angle % 90));
	    xlen    = enemy_xoffset;
	    ylen    = enemy_height - enemy_yoffset;
	    yoffset = sqrt(sqr(xlen) + sqr(ylen)) * dsin(darctan(xlen / ylen) + (angle % 90));
	} else if (angle > 270 && angle < 360) {
	    xlen    = enemy_xoffset;
	    ylen    = enemy_height - enemy_yoffset;
	    xoffset = sqrt(sqr(xlen) + sqr(ylen)) * dcos(darctan(xlen / ylen) - (angle % 90));
	    xlen    = enemy_xoffset;
		ylen    = enemy_yoffset;
	    yoffset = sqrt(sqr(xlen) + sqr(ylen)) * dsin(darctan(xlen / ylen) + (angle % 90));
	} else if (angle == 0 || angle == 360) {
	    xoffset = enemy_xoffset;
	    yoffset = enemy_yoffset;
	} else if (angle == 90) {
	    xoffset = enemy_yoffset;
	    yoffset = enemy_width - enemy_xoffset;
	} else if (angle == 180) {
	    xoffset = enemy_width - enemy_xoffset;
	    yoffset = enemy_height - enemy_yoffset;
	} else if (angle == 270) {
	    xoffset = enemy_height - enemy_yoffset;
	    yoffset = enemy_xoffset;
	}

	if ((angle >= 0 && angle < 90) || angle == 360) {
	    tiltwidth  = lengthdir_x(sqrt(sqr(enemy_width - enemy_xoffset) + sqr(enemy_height - enemy_yoffset)), 270 + darctan((enemy_width - enemy_xoffset) / (enemy_height - enemy_yoffset)) + angle) - lengthdir_x(sqrt(sqr(enemy_xoffset) + sqr(enemy_yoffset)), 90 + darctan(enemy_xoffset / enemy_yoffset) + angle);
	    tiltheight = lengthdir_y(sqrt(sqr(enemy_xoffset) + sqr(enemy_height - enemy_yoffset)), 180 + darctan((enemy_height - enemy_yoffset) / enemy_xoffset) + angle) - lengthdir_y(sqrt(sqr(enemy_width - enemy_xoffset) + sqr(enemy_yoffset)), darctan(enemy_yoffset / (enemy_width - enemy_xoffset)) + angle);
	} else if (angle >= 90 && angle < 180) {
	    tiltwidth  = lengthdir_x(sqrt(sqr(enemy_xoffset) + sqr(enemy_height - enemy_yoffset)), 180 + darctan((enemy_height - enemy_yoffset) / enemy_xoffset) + angle) - lengthdir_x(sqrt(sqr(enemy_width - enemy_xoffset) + sqr(enemy_yoffset)), darctan(enemy_yoffset / (enemy_width - enemy_xoffset)) + angle);
	    tiltheight = lengthdir_y(sqrt(sqr(enemy_xoffset) + sqr(enemy_yoffset)), 90 + darctan(enemy_xoffset / enemy_yoffset) + angle) - lengthdir_y(sqrt(sqr(enemy_width - enemy_xoffset) + sqr(enemy_height - enemy_yoffset)), 270 + darctan((enemy_width - enemy_xoffset) / (enemy_height - enemy_yoffset)) + angle);
	} else if (angle >= 180 && angle < 270) {
	    tiltwidth  = lengthdir_x(sqrt(sqr(enemy_xoffset) + sqr(enemy_yoffset)), 90 + darctan(enemy_xoffset / enemy_yoffset) + angle) - lengthdir_x(sqrt(sqr(enemy_width - enemy_xoffset) + sqr(enemy_height - enemy_yoffset)), 270 + darctan((enemy_width - enemy_xoffset) / (enemy_height - enemy_yoffset)) + angle);
	    tiltheight = lengthdir_y(sqrt(sqr(enemy_width - enemy_xoffset) + sqr(enemy_yoffset)), darctan(enemy_yoffset / (enemy_width - enemy_xoffset)) + angle) - lengthdir_y(sqrt(sqr(enemy_xoffset) + sqr(enemy_height - enemy_yoffset)), 180 + darctan((enemy_height - enemy_yoffset) / enemy_xoffset) + angle);
	} else if (angle >= 170 && angle < 360) {
	    tiltwidth  = lengthdir_x(sqrt(sqr(enemy_width - enemy_xoffset) + sqr(enemy_yoffset)), darctan(enemy_yoffset / (enemy_width - enemy_xoffset)) + angle) - lengthdir_x(sqrt(sqr(enemy_xoffset) + sqr(enemy_height - enemy_yoffset)), 180 + darctan((enemy_height - enemy_yoffset) / enemy_xoffset) + angle);
	    tiltheight = lengthdir_y(sqrt(sqr(enemy_width - enemy_xoffset) + sqr(enemy_height - enemy_yoffset)), 270 + darctan((enemy_width - enemy_xoffset) / (enemy_height - enemy_yoffset)) + angle) - lengthdir_y(sqrt(sqr(enemy_xoffset) + sqr(enemy_yoffset)), 90 + darctan(enemy_xoffset / enemy_yoffset) + angle);
	}

	var temp_suf = surface_create(tiltwidth, tiltheight);
	surface_set_target(temp_suf);
	draw_clear_alpha(0, 0);
	gpu_set_alphatestref(0);
	draw_sprite_ext(enemy.sprite_index, enemy.image_index, xoffset, yoffset, enemy.image_xscale, enemy.image_yscale, angle, enemy.image_blend, enemy.image_alpha);
	gpu_set_alphatestref(254);

	with (instance_create(enemy.x, enemy.y, obj_debris)) {
	    sprite_index        = sprite_create_from_surface(temp_suf, 0, 0, tiltwidth, round(tiltheight / 2), 0, 0, xoffset, yoffset);
	    split_sprite        = enemy.sprite_index;
	    split_sprite_index  = enemy.image_index;
	    split_sprite_xscale = enemy.image_xscale;
	    split_sprite_yscale = enemy.image_yscale;
	    split_sprite_color  = enemy.image_blend;
	    split_sprite_alpha  = enemy.image_alpha;
	    split_angle         = argument[1];
	    split_part          = 0;
	    image_angle         = -angle;
	    direction           = -angle + 45;
	    custom_sprite       = 2;
	    speed1              = 5;
	}
	with (instance_create(enemy.x, enemy.y, obj_debris)) {
	    sprite_index        = sprite_create_from_surface(temp_suf, 0, round(tiltheight / 2), tiltwidth, tiltheight - round(tiltheight / 2), 0, 0, xoffset, yoffset - round(tiltheight / 2));
	    split_sprite        = enemy.sprite_index;
	    split_sprite_index  = enemy.image_index;
	    split_sprite_xscale = enemy.image_xscale;
	    split_sprite_yscale = enemy.image_yscale;
	    split_sprite_color  = enemy.image_blend;
	    split_sprite_alpha  = enemy.image_alpha;
	    split_angle         = argument[1];
	    split_part          = 1;
	    image_angle         = -angle;
	    direction           = -angle - 45;
	    custom_sprite       = 2;
	    speed1              = 5;
	}

	surface_reset_target();
	if (surface_exists(temp_suf)) {
		surface_free(temp_suf);
	}


}
