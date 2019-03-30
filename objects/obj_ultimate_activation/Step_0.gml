/// @description Size & Stage Control

// Check surface
if (!surface_exists(suf_mysurface)) {
	suf_mysurface = surface_create(mysurface_width, mysurface_height);
}

if (global.gpspeed != 0) {
	progress++;
	if (stage == 0) {
		size                               = progress / 2;
		image_alpha                        = progress / 10;
		global.gpspeed_ultimate_activation = clamp(1 - (progress / 10), 0.1, 1);
		if (size >= 5) {
			play_sfx(sfx_ultimate_activation, sound_priority.ultimate_activation, 0);
			stage = 1;
		}
	} else if (stage == 1) {
		size = 5 + (progress - 10) / 40;
		if (size >= 6) { stage = 2; }
		if (global.gpspeed_ultimate_activation > 0.1) { global.gpspeed_ultimate_activation = 0.1; }
	} else if (stage == 2) {
		size = 6 + (progress - 50) / 2;
		image_alpha = 1 - ((progress - 50) / 10);
		if (size >= 11) {
			instance_destroy();
			if (surface_exists(mysurface)) {
				surface_free(suf_mysurface);
			}
		}
		global.gpspeed_ultimate_activation = clamp(progress / 10, 0.1, 1);
	}
}

// Update measurement variables
    uname_width     = (string_width(string_hash_to_newline(text)) + 2) * size * multiplier;
    uname_height    = (string_height(string_hash_to_newline(text)) + 2) * size * multiplier;
    hpadding        = 4 * size * multiplier;
	vpadding        = size * multiplier;
    image_width     = sprite_get_width(spr_slot_char) * uname_height / sprite_get_height(spr_slot_char);
    image_height    = uname_height;
    headline_width  = uname_width / 2;
    headline_height = uname_height / 2;

