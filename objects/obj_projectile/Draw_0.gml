/// @description Draw self & apply shaders

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Prerequisites

if (f == PLAYER_BOBILEUSZ) {
	if (e == 0) {
		var gear = 5;
		for (var i = STATUS_EFFECT_GEAR1; i < STATUS_EFFECT_GEAR10 + 1; i++) {
			if (obj_player.status_effect[i]) {
				gear = i - STATUS_EFFECT_GEAR1 + 1;
				break;
			}
		}
		var length = 90 - (gear * 2);
		var angle  = 4 + (gear / 2);
		var d = point_distance(xstart, ystart, x, y);
		var l1 = d / dcos(angle / 2);
		var l2 = (d + length) / dcos(angle / 2);
		var A = [xstart + lengthdir_x(l1, direction - angle / 2), ystart + lengthdir_y(l1, direction - angle / 2)];
		var B = [xstart + lengthdir_x(l1, direction + angle / 2), ystart + lengthdir_y(l1, direction + angle / 2)];
		var C = [xstart + lengthdir_x(l2, direction + angle / 2), ystart + lengthdir_y(l2, direction + angle / 2)];
		var D = [xstart + lengthdir_x(l2, direction - angle / 2), ystart + lengthdir_y(l2, direction - angle / 2)];
	
		var x0 = min(A[0], B[0], C[0], D[0]);
		var x1 = max(A[0], B[0], C[0], D[0]);
		var y0 = min(A[1], B[1], C[1], D[1]);
		var y1 = max(A[1], B[1], C[1], D[1]);
		var suf1 = surface_create(x1 - x0 + 1, y1 - y0 + 1);
		surface_set_target(suf1);
		draw_clear_alpha(c_white, 1);
		surface_reset_target();
		var suf2 = surface_create(x1 - x0 + 1, y1 - y0 + 1);
		surface_set_target(suf2);
		draw_clear_alpha(0, 0);
		var tex = texture_get_uvs(surface_get_texture(suf1));
		var w   = surface_get_width(suf1);
		var h   = surface_get_height(suf1);
		var alpha = (0.7 + (0.15 * sin(global.gptime * 2))) * (fadeout / fadeoutmax);
		shd_quadrangle_set(tex, w, h, A[0] - x0, A[1] - y0, B[0] - x0, B[1] - y0, C[0] - x0, C[1] - y0, D[0] - x0, D[1] - y0, image_blend, alpha, 1, 2);
		draw_surface(suf1, 0, 0);
		surface_reset_target();
		shader_reset();
		if (sprite_exists(sprite_index) && sprite_index != spr_bobileusz_bullet) {
			sprite_delete(sprite_index);
		}
		sprite_index = sprite_create_from_surface(suf2, 0, 0, w, h, 0, 0, abs(mean(A[0] - x0, B[0] - x0)), abs(mean(A[1] - y0, B[1] - y0)));
		sprite_collision_mask(sprite_index, 0, 0, 0, 0, w, h, bboxkind_precise, 0);
		surface_free(suf1);
		surface_free(suf2);
	} else {
		exit;
	}
}

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw self & apply shaders

// enable transparency only when necessary (increases overhead)
if (f == PLAYER_BOBILEUSZ) {
	gpu_set_alphatestref(0);
}

// enable additive blending for extra effects
if ((f == PLAYER_EVILFLAME && e == 2) || f == PLAYER_BOBILEUSZ) {
    gpu_set_blendmode(bm_add);
}

if (global.shader_conditions == 0) {
    draw_afterimage_remove();
    draw_self();
} else {
    shd_sprite_effect_set(global.shader_conditions);
    if (global.shader_conditions >= 4 && global.shader_conditions <= 7) {
        if (global.gpspeed != 0) {
            draw_afterimage(30, 0.5, 1, 0, 4);
        } else {
            draw_afterimage_pause(0);
        }
    }
    draw_self();
    shader_reset();
}

gpu_set_alphatestref(254);
gpu_set_blendmode(bm_normal);

#endregion

#region Reset surface

surface_reset_target();

#endregion