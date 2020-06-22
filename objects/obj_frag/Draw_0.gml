/// @description Draw self & apply shaders

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Prerequisites

if (f == PLAYER_BOBILEUSZ && e == 0) {
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
	var y0 = min(A[1], B[1], C[1], D[1]);
	surface_set_target(suf1);
	draw_clear_alpha(c_white, 1);
	surface_reset_target();
	surface_set_target(surface_overlay);
	draw_clear_alpha(0, 0);
	var tex = texture_get_uvs(surface_get_texture(suf1));
	var w   = surface_get_width(suf1);
	var h   = surface_get_height(suf1);
	var alpha = (0.7 + (0.15 * sin(global.gptime * 1.5))) * (fadeout / fadeoutmax);
	shd_quadrangle_set(tex, w, h, A[0] - x0, A[1] - y0, B[0] - x0, B[1] - y0, C[0] - x0, C[1] - y0, D[0] - x0, D[1] - y0, image_blend, alpha, 1, 2);
	draw_surface(suf1, 0, 0);
	surface_reset_target();
	shader_reset();
	surface_overlay_x = x - mean(A[0] - x0, B[0] - x0);
	surface_overlay_y = y - mean(A[1] - y0, B[1] - y0);
	
	
	// Calculate collision mask
	image_xscale = point_distance(mean(A[0], B[0]), mean(A[1], B[1]), mean(D[0], C[0]), mean(D[1], C[1]));
	image_yscale = point_distance(mean(A[0], D[0]), mean(A[1], D[1]), mean(B[0], C[0]), mean(B[1], C[1]));
	image_angle = direction;
	image_xscale /= sprite_get_width(sprite_index);
	image_yscale /= sprite_get_height(sprite_index);
}

#endregion

#region Draw self & shader implementation

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
	if (surface_exists(surface_overlay)) {
		draw_surface_ext(surface_overlay, surface_overlay_x, surface_overlay_y, surface_overlay_xscale, surface_overlay_yscale, surface_overlay_angle, c_white, surface_overlay_alpha);
	}
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
	if (surface_exists(surface_overlay)) {
		draw_surface_ext(surface_overlay, surface_overlay_x, surface_overlay_y, surface_overlay_xscale, surface_overlay_yscale, surface_overlay_angle, c_white, surface_overlay_alpha);
	}
    shader_reset();
}

gpu_set_alphatestref(254);
gpu_set_blendmode(bm_normal);

#endregion

#region Reset surface

surface_reset_target();

#endregion