/// @description Size & Stage Control

#region Surface check

// Check surface
if (!surface_exists(suf_mysurface)) {
	suf_mysurface = surface_create(mysurface_width, mysurface_height);
}

#endregion

#region Size & stage control

var stage0_dur, stage1_dur, stage2_dur;
stage0_dur = 10;
stage1_dur = 40;
stage2_dur = 10;

if (global.gpspeed != 0) {
	progress++;
	if (stage == 0) {
		size                               = progress * 5 / stage0_dur;
		image_alpha                        = progress / stage0_dur;
		global.gpspeed_ultimate_activation = clamp(1 - (progress / stage0_dur), 0.1, 1);
		if (progress >= stage0_dur) {
			play_sfx(sfx_ultimate_activation, 0);
			stage = 1;
		}
	} else if (stage == 1) {
		size = 5 + (progress - stage0_dur) / stage1_dur;
		if (progress >= stage0_dur + stage1_dur) { stage = 2; }
		if (global.gpspeed_ultimate_activation > 0.1) { global.gpspeed_ultimate_activation = 0.1; }
	} else if (stage == 2) {
		size = 6 + ((progress - stage0_dur - stage1_dur) * 5 / stage2_dur);
		image_alpha = 1 - ((progress - stage0_dur - stage1_dur) / stage2_dur);
		if (progress >= stage0_dur + stage1_dur + stage2_dur) {
			instance_destroy();
			if (surface_exists(suf_mysurface)) {
				surface_free(suf_mysurface);
			}
		}
		global.gpspeed_ultimate_activation = clamp(progress / 10, 0.1, 1);
	}
}

#endregion

#region Update measurement variables

    uname_width     = (string_width(text) + 2) * size * multiplier;
    uname_height    = (string_height(text) + 2) * size * multiplier;
    hpadding        = 4 * size * multiplier;
	vpadding        = size * multiplier;
    image_width     = sprite_get_width(spr_slot_char) * uname_height / sprite_get_height(spr_slot_char);
    image_height    = uname_height;
    // headline_width  = uname_width / 2;
    headline_height = uname_height / 2;

#endregion