/// @description Draw Statboard

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion



if (x < xstart + 360) {
	
	#region Draw self
	
	draw_self();
	
	#endregion
	
	#region Draw stats
	
	var lineh = 22;

	if (mouse_wheel_up() && place_meeting(x, y, boss)) {
		scrollv = max(scrollv + 6, 6);
	} else if (mouse_wheel_down() && place_meeting(x, y, boss)) {
		scrollv = min(scrollv - 6, -6);
	} else {
		scrollv = home(scrollv, 0, 1, 0);
	}

	// Set scroll bounds
	var scroll_limit = -(linesum * lineh) + (sprite_height - 180);
	var prevscroll   = scroll;
	scroll           = clamp(scroll + scrollv, scroll_limit, 0);
	if (prevscroll + scrollv < scroll_limit || prevscroll + scrollv > 0) { scrollv = 0; }

	draw_set_align(fa_left, fa_middle); draw_set_color(c_black);
	for (var s = 0; s < array_height_2d(linecount); s++) {
		//add section offset
		var yoffset = 0;
		var xoffset = 10 + (10 * (button[1].customize));
		if (s > 0 && section_length[s] > 0) {
			for (var i = 0; i < s; i++) {
				if (section_length[i] > 0) {
					yoffset += (3 + (datatype[i, section_length[i] - 1] == 1 || datatype[i, section_length[i] - 1] == 2) + linecount[i, section_length[i] - 1]) * lineh;
				}
			}
		}
		
		// Draw section sprite
		if (section_length[s] > 0 && (y + yoffset - (sprite_height / 2) + 125 + scroll >= y - (sprite_height / 2) + 125 - lineh && y + yoffset - (sprite_height / 2) + 125 + scroll <= y + (sprite_height / 2) - 50)) {
			draw_sprite(spr_stats_section, s, x - (sprite_width / 2) + 45, y + yoffset - (sprite_height / 2) + 125 + scroll);
		}

		// Draw all the content
		for (var i = 0; i < section_length[s]; i++) {
		    if (datatype[s, i] != 4 && (y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) >= y - (sprite_height / 2) + 125 - lineh && y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) <= y + (sprite_height / 2) - 50)) {
			    if (button[1].customize == 1) {
					with (checkbox[elementid[s, i]]) {
						y = ((other.datatype[s, i] == 1 || other.datatype[s, i] == 2) * 0.5 * lineh) + other.y + yoffset - (other.sprite_height / 2) + 125 + other.scroll + ((other.linecount[s, i] + 0.2) * lineh) + 2;
						draw_self();
					}
				}
			    if (desc[elementid[s, i]] != "" && boss.x >= xoffset + x - (sprite_width / 2) + 45 - 2 && boss.x <= xoffset + x - (sprite_width / 2) + 45 + (2 * string_width(text[s, i])) + 2 && boss.y >= y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2 - (lineh / 2) + 2 && boss.y <= y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2 + (lineh / 2) - 2) {
				    gpu_set_alphatestref(0);
				    gpu_set_blendmode(bm_add);
				    draw_text_highlight(xoffset + x-(sprite_width / 2) + 45, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2, text[s, i], 2, c_black, 0.5, fa_left, fa_middle, 3, 3);
				    gpu_set_blendmode(bm_normal);
				    gpu_set_colorwriteenable(1, 1, 1, 0);
				    draw_text_highlight(xoffset + x - (sprite_width / 2) + 45, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2, text[s, i], 2, c_black, 0.5, fa_left, fa_middle, 3, 3);
				    gpu_set_colorwriteenable(1, 1, 1, 1);
				    draw_set_color(c_white);
				    gpu_set_alphatestref(254);
				}
			    draw_text_transformed(xoffset + x - (sprite_width / 2) + 45, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2, text[s, i], 2, 2, 0);
			    draw_set_color(c_black);
			    draw_set_halign(fa_right);
			    draw_text_outline(10 + x + (sprite_width / 2) - 26, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2, display[s, i], 2, 2, global.color[global.chrsel], 2, c_black);
			    draw_set_halign(fa_left);
		    }
		    if (datatype[s, i] == 1 || datatype[s, i] == 2) && (y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 1.2) * lineh) >= y - (sprite_height / 2) + 125 - lineh && y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 1.2) * lineh) <= y + (sprite_height / 2) - 50) {
				var ratio = value[s, i] / limit[s, i];
			    draw_set_color(color_shift_hsv(global.color[global.chrsel], -20 + (ratio * 40), -ratio * 100, -100 + (ratio * 100), 1));
			    draw_rectangle(xoffset + x - (sprite_width / 2) + 46, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 1.2) * lineh) - 8, xoffset + x - (sprite_width / 2) + 46 + clamp(ratio * (sprite_width - 64 - xoffset), 0, sprite_width - 74), y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 1.2) * lineh) + 8, 0);
			    draw_set_color(c_black);
			    draw_rectangle(xoffset + x - (sprite_width / 2) + 46, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 1.2) * lineh) - 9, 10 + x + (sprite_width / 2) - 28, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 1.2) * lineh) + 9, 1);
			    draw_rectangle(xoffset + x - (sprite_width / 2) + 45, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 1.2) * lineh) - 8, 10 + x + (sprite_width / 2) - 27, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 1.2) * lineh) + 8, 1);
		    }
		    if datatype[s, i] == 4 && (y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) >= y - (sprite_height / 2) + 125 - lineh && y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) <= y + (sprite_height / 2) - 50) {
			    if button[1].customize == 1 && (i == 0 || elementid[s, i - 1] != elementid[s, i]) with (checkbox[elementid[s, i]]) {
					y = other.y + yoffset - (other.sprite_height / 2) + 125 + other.scroll + ((real(string_copy(other.text[s, i], 2, string_length(other.text[s, i]) - 1)) + other.linecount[s, i] + 0.2) * lineh) + 2;
					draw_self();
				}
			    switch(real(string_char_at(text[s, i], 1))) {
				    case 0: draw_text_transformed(xoffset + x - (sprite_width / 2) + 45, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2, value[s, i], 2, 2, 0); break;
				    case 1: draw_text_outline(xoffset + x - (sprite_width / 2) + 45, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2, value[s, i], 2, 2, global.color[global.chrsel], 0, c_black); break;
				    case 2: draw_text_outline(xoffset + x - (sprite_width / 2) + 45, y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2, value[s, i], 2, 2, global.color[global.chrsel], 2, c_black); break;
			    }
		    }
		}
	}

	#endregion
	
	#region Draw cuts, arrows, headline & buttons
	
	var cut1_exists = 1;
	for (var i = 0; i < array_length_1d(cut1); i++) {
		if (!sprite_exists(cut1[i])) { cut1_exists = 0; }
	}
	if (cut1_exists) { draw_sprite_ext(cut1[floor(image_index) % image_number], 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 1); }
	
	var cut2_exists = 1;
	for (var i = 0; i < array_length_1d(cut2); i++) {
		if (!sprite_exists(cut2[i])) { cut2_exists = 0; }
	}
	if (cut2_exists) { draw_sprite_ext(cut2[floor(image_index) % image_number], 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 1); }
	
	gpu_set_alphatestref(0);
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(spr_stats_headline, 0, x + 17, y - 195, 1, 1, 0, -1, 0.5);
	gpu_set_blendmode(bm_normal);
	gpu_set_colorwriteenable(1, 1, 1, 0);
	draw_sprite_ext(spr_stats_headline, 0, x + 17, y - 195, 1, 1, 0, -1, 0.5);
	gpu_set_colorwriteenable(1, 1, 1, 1);
	gpu_set_alphatestref(254);

	if (osc != -1) {
		var lineh = 22;
		if scroll < 0 draw_sprite_ext(spr_scroll_arrow, 0, x + 17, y - (sprite_height / 2) + 91 - osc.output[1], osc.output[0], -1, 0, -1, 1);
		if scroll > -(linesum * lineh) + (sprite_height - 180) draw_sprite_ext(spr_scroll_arrow, 0, x + 17, y + (sprite_height / 2) - 60 + osc.output[1], osc.output[0], 1, 0, -1, 1);
	}

	with (button[0]) { draw_self(); }
	with (button[1]) { draw_self(); }
	
	#endregion

	#region Draw stat tips
	// This entire region used to be enclosed in with (other) {}. I couldn't understand why, and it seems to work flawlessly without it, so it's been removed.
	
	draw_set_align(fa_left, fa_middle); draw_set_color(c_black);
	for (var s = 0; s < array_height_2d(linecount); s++) {
		//add section offset
		var yoffset = 0;
		var xoffset = 10 + (10 * (button[1].customize));
		if (s > 0 && section_length[s] > 0) {
			for (var i = 0; i < s; i++) {
				if (section_length[i] > 0) { yoffset += (3 + (datatype[i, section_length[i] - 1] == 1 || datatype[i, section_length[i] - 1] == 2) + linecount[i, section_length[i] - 1]) * lineh; }
			}
		}

		for (var i = 0; i < section_length[s]; i++) {
			if (datatype[s, i] != 4 && (y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) >= y - (sprite_height / 2) + 125 - lineh && y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) <= y + (sprite_height / 2) - 50)) {
				if (desc[elementid[s, i]] != "" && boss.x >= xoffset + x - (sprite_width / 2) + 45 - 2 && boss.x <= xoffset + x - (sprite_width / 2) + 45 + (2 * string_width(text[s, i])) + 2 && boss.y >= y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2 - (lineh / 2) + 2 && boss.y <= y + yoffset - (sprite_height / 2) + 125 + scroll + ((linecount[s, i] + 0.2) * lineh) + 2 + (lineh / 2) - 2) {
					draw_tooltip(desc[elementid[s, i]]);
				}
			}
		}
	}
	
	#endregion

}

	

#region Reset surface

surface_reset_target();

#endregion