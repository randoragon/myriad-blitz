/// @description Draw Health Bar

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Health bar

if (hp > 0 && !IS_STATUS_EFFECT_CURRENT_CRUSH && !IS_STATUS_EFFECT_CHIP_TUNING) {
    surface_set_target(GUI_SURFACE);
	var bar_w, bar_h, xx, yy, o;
	bar_w = 60; // including outline
	bar_h = 7;  // including outline
	o     = 1;  // bounding box thickness (included in bar_w and bar_h)
	
    if (bar_extension == 0) {
        draw_set_color(c_black);
		xx = round(x - (bar_w / 2));
		yy = round(y - (sprite_height / 2));
        draw_set_alpha(0.5);
        gpu_set_alphatestref(0);
        draw_rectangle(xx, yy - (bar_h - 1), xx + (bar_w - 1), yy, 0);
        draw_set_color(c_red);
        draw_set_alpha(1);
        gpu_set_alphatestref(254);
		draw_rectangle(xx + o, yy - (bar_h - 1) + o, xx + o + ((bar_w - 1 - 2*o) * hp / hpmax), yy - o, 0);
        draw_set_color(c_black);
        draw_rectangle(xx + o, yy - (bar_h - 1) + o, xx + (bar_w - 1) - o, yy - o, 1);
    } else {
        var text        = string(ceil(hp)) + " / " + string(ceil(hpmax));
        var text_width  = 2 * string_width(text);
        var text_height = 2 * string_height(text);
        var hgrowth     = bar_extension * max(0, text_width + 4 - 60) / 2;
        var vgrowth     = bar_extension * max(0, text_height + 4 - 6) / 2;
        draw_set_color(c_black);
		xx = round(x - (bar_w / 2));
		yy = round(y - (sprite_height / 2));
        draw_set_alpha(0.5);
        gpu_set_alphatestref(0);
        draw_rectangle(xx - hgrowth, yy - (bar_h - 1) - vgrowth, xx + (bar_w - 1) + hgrowth, yy + vgrowth, 0);
        draw_set_color(hsv(0, 255, 255 - (191 * bar_extension)));
        draw_set_alpha(1);
        gpu_set_alphatestref(254);
        draw_rectangle(xx + o - hgrowth, yy - (bar_h - 1) - vgrowth, xx + o - hgrowth + (((bar_w - 2*o) + (2 * hgrowth)) * hp / hpmax), yy + vgrowth, 0);
        draw_set_color(c_black);
        draw_rectangle(xx - hgrowth + 1, yy - (bar_h - 1) - vgrowth + 1, xx + (bar_w - 1) + hgrowth - 1, yy + vgrowth - 1, 1);
        draw_text_full(x + 1, yy - 1, text, 2, 2, 0, 1, fa_center, fa_middle, c_red);
    }
    surface_reset_target();
}

#endregion