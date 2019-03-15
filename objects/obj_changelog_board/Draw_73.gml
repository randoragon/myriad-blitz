/// @description Draw UI

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw self

draw_self();

#endregion

#region Draw text

if (global.busy == 0 && mouse_wheel_up() && place_meeting(x, y, boss)) {
    scrollv = max(scrollv + 6, 6);
} else if (global.busy == 0 && mouse_wheel_down() && place_meeting(x, y, boss)) {
    scrollv = min(scrollv - 6,  -6);
} else {
    scrollv = home(scrollv, 0, 1, 0);
}

draw_set_align(fa_center, fa_top);
var distance = 0, yy;
for (var i = 0; i < array_length_1d(section); i++) {
    yy = y - sprite_yoffset + 50 + scroll + distance;
    if (yy + (3 * 12) >= y - sprite_yoffset + 50 && yy <= y - sprite_yoffset + sprite_height - 70) {
        if (date[i] == "" || !(boss.x >= x - (0.5 * 3 * string_width(string_hash_to_newline(section[i]))) - 2 && boss.x <= x + (0.5 * 3 * string_width(string_hash_to_newline(section[i]))) && boss.y > yy - 2 && boss.y < yy + (3 * 12) + 2)) {
            draw_text_outline(x, yy, section[i], 3, 3, 0, rgb(0, 200, 255), 1, c_black, 1);
        } else {
            gpu_set_alphatestref(0);
            gpu_set_blendmode(bm_add);
            draw_text_highlight(x, yy, section[i], 3, c_black, 0.3, fa_center, fa_top, 6, 6);
            gpu_set_blendmode(bm_normal);
            gpu_set_colorwriteenable(1, 1, 1, 0);
            draw_text_highlight(x, yy, section[i], 3, c_black, 0.3, fa_center, fa_top, 6, 6);
            gpu_set_colorwriteenable(1, 1, 1, 1);
            gpu_set_alphatestref(254);
            draw_text_outline(x, yy, section[i], 3, 3, 0, rgb(0, 255, 255), 1, c_black, 1);
        }
    }
    for (var l = 0; l < array_length_2d(content, i); l++) {
        if (yy + (3 * 12) + (2 * 12) + section_padding + (l * ((2 * 12) + content_padding)) >= y - sprite_yoffset + 50 && yy + (3 * 12) + section_padding + (l * ((2 * 12) + content_padding)) <= y - sprite_yoffset + sprite_height - 70) {
	        draw_set_color(c_black);
	        switch (string_copy(content[i, l], 1, 1)) {
		        case "<":
			        draw_set_halign(fa_left);
			        draw_text_transformed(x - sprite_xoffset + 40, yy + (3 * 12) + section_padding + (l * ((2 * 12) + content_padding)), string_hash_to_newline(string_delete(content[i, l], 1, 1)), 2, 2, 0);
			        draw_set_halign(fa_center);
		        break;
		        case "_":
					draw_text_transformed(x, yy + (3 * 12) + section_padding + (l * ((2 * 12) + content_padding)), string_hash_to_newline(string_delete(content[i, l], 1, 1)), 2, 2, 0);
		        break;
		        case ">":
			        draw_set_halign(fa_right);
			        draw_text_transformed(x - sprite_xoffset + sprite_width - 40, yy + (3 * 12) + section_padding + (l * ((2 * 12) + content_padding)), string_hash_to_newline(string_delete(content[i, l], 1, 1)), 2, 2, 0);
			        draw_set_halign(fa_center);
		        break;
	        }
        }
    }
    distance += (3 * 12) + section_padding + (array_length_2d(content, i) * ((2 * 12) + content_padding)) - content_padding + content_end_padding;
}

var prevscroll = scroll;
scroll = clamp(scroll + scrollv, -total_height, 0);
if (prevscroll + scrollv < -total_height || prevscroll + scrollv > 0) {
    scrollv = 0;
}

#endregion

#region Draw cuts, tooltips && arrows

//cuts
var cut1_exists = 1;
for (var i = 0; i < array_length_1d(cut1); i++) {
    if (!sprite_exists(cut1[i])) {
        cut1_exists = 0;
    }
}
if (cut1_exists) {
    draw_sprite_ext(cut1[floor(image_index) % image_number], 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
}
var cut2_exists = 1;
for (var i = 0; i < array_length_1d(cut2); i++) {
    if (!sprite_exists(cut2[i])) {
        cut2_exists = 0;
    }
}
if (cut2_exists) {
    draw_sprite_ext(cut2[floor(image_index) % image_number], 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
}

//arrows
if (osc != -1) {
    if (scroll < 0) {
        draw_sprite_ext(spr_scroll_arrow, 0, x, y - sprite_yoffset + 35 - osc.output[1], osc.output[0], -1, 0, -1, 1);
    }
    if (scroll > -total_height) {
        draw_sprite_ext(spr_scroll_arrow, 0, x, y - sprite_yoffset + sprite_height - 53 + osc.output[1], osc.output[0], 1, 0, -1, 1);
    }
}

//tooltips
var distance = 0, yy;
for (var i = 0; i < array_length_1d(section); i++) {
    yy = y - sprite_yoffset + 50 + scroll + distance;
    if (yy + (3 * 12) >= y - sprite_yoffset + 50 && yy <= y - sprite_yoffset + sprite_height - 70) {
        if (date[i] != "" && (boss.x >= x - (0.5 * 3 * string_width(string_hash_to_newline(section[i]))) - 2 && boss.x <= x + (0.5 * 3 * string_width(string_hash_to_newline(section[i]))) && boss.y > yy - 2 && boss.y < yy + (3 * 12) + 2)) {
            draw_tooltip(date[i]);
        }
    }
    distance += (3 * 12) + section_padding + (array_length_2d(content, i) * ((2 * 12) + content_padding)) - content_padding + content_end_padding;
}

#endregion

#region Reset surface

surface_reset_target();

#endregion