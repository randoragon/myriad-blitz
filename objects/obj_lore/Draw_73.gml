/// @description Draw Lore & Character Names

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw self

if (y < ystart + 350) { draw_self(); }

#endregion

#region Draw text

if (y < ystart + 350) {
	var lineh = 20;

	if (mouse_wheel_up() && place_meeting(x, y, boss)) {
		scrollv = max(scrollv + 6, 6);
	} else if (mouse_wheel_down() && place_meeting(x, y, boss)) {
		scrollv = min(scrollv - 6, -6);
	} else {
		scrollv = home(scrollv, 0, 1, 0);
	}

	var linecount = string_count("\n", global.lore) + 1;
	draw_set_align(fa_center, fa_middle);
	draw_set_color(c_black);
	for (var i = 0; i < linecount; i++) {
		if (y - (sprite_height / 2) + 84 + scroll + (i * lineh) >= y - (sprite_height / 2) + 84 - lineh && y - (sprite_height / 2) + 84 + scroll + (i * lineh) <= y + (sprite_height / 2) - 69 + lineh) {
			draw_text_transformed(x, y - (sprite_height / 2) + 84 + scroll + (i * lineh), text[i], 2, 2, 0);
		}
	}

	var prevscroll = scroll;
	scroll = clamp(scroll + scrollv, -(linecount * lineh) + (sprite_height - 146), 0);
	if (prevscroll + scrollv < -(linecount * lineh) + (sprite_height - 146) || prevscroll + scrollv > 0) {
		scrollv = 0;
	}
}

#endregion

#region Draw cuts & arrows

if (x < xstart + 250) {
	var cut1_exists = 1;
	
	for (var i = 0; i < array_length(cut1); i++) {
		if (!sprite_exists(cut1[i])) {cut1_exists = 0; }
	}
	if (cut1_exists) {
		draw_sprite_ext(cut1[floor(image_index) % image_number], 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
	}
	
	var cut2_exists = 1;
	
	for (var i = 0; i < array_length(cut2); i++) {
		if (!sprite_exists(cut2[i])) { cut2_exists = 0; }
	}
	
	if (cut2_exists) {
		draw_sprite_ext(cut2[floor(image_index) % image_number], 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
	}

	if (osc != -1) {
		if (scroll < 0) { draw_sprite_ext(spr_scroll_arrow,0,x,y-(sprite_height/2)+64-osc.output[1],osc.output[0],-1,0,-1,1); }
		
		if (scroll > -((string_count("\n", global.lore) + 1) * 20) + (sprite_height - 146)) {
			draw_sprite_ext(spr_scroll_arrow, 0, x, y + (sprite_height / 2) - 56 + osc.output[1], osc.output[0], 1, 0, -1, 1);
		}
	}
}

#endregion

#region Draw character names

//CHARACTER NAMES
if (global.transition != 1) {
	draw_set_align(fa_center, fa_bottom);
	draw_text_outline(GUI_X + 683, GUI_Y + 475, global.name[global.chrsel], 4 - (4 * global.transition), 4, c_black, 2, c_black);
	draw_text_outline(GUI_X + 683, GUI_Y + 471, global.name[global.chrsel], 4 - (4 * global.transition), 4, global.color[global.chrsel], 2, color_shift_hsv(global.color[global.chrsel], 0, 0, -170, 1));
}
	
#endregion

#region Reset surface

surface_reset_target();

#endregion