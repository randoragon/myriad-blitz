/// @description Gameplay Bars

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Draw gameplay bars

if (global.state == 1) {
    surface_set_target(GUI_SURFACE);
	var bar_w, bar_h, bar_pad, xx, yy, o;
	bar_w   = 60; // including outline
	bar_h   = 7;  // including outline
	bar_pad = 2;  // vertical distance between two adjacent bars
	o       = 1;  // bounding box thickness (included in bar_w and bar_h)
	
    gpu_set_alphatestref(0);
    //HP Bar
    if (bar_opacity[0] > 0) {
        bar_yoffset[0] = home(bar_yoffset[0], 36 + (((bar_opacity[1] > 0) + (bar_opacity[2] > 0)) * (bar_h + bar_pad)), 0.5);
        draw_set_alpha(min(bar_opacity[0] / 2, 0.5));
        draw_set_color(c_black);
		xx = round(x - (bar_w / 2));
		yy = round(y + bar_yoffset[0]);
		draw_rectangle(xx, yy, xx + (bar_w - 1), yy + (bar_h - 1), 0);
        draw_set_alpha(bar_opacity[0]);
        if (hpmark < hp) {
            draw_set_color(c_red);
			draw_rectangle(xx + o, yy + o, xx + o + ((bar_w - 1 - 2*o) * hpmark / hpmax), yy + (bar_h - 1) - o, 0);
            if (hpmark != hp) {
                draw_set_color(c_lime);
				draw_rectangle(xx + o + ((bar_w - 1 - 2*o) * hp / hpmax), yy + o, xx + o + ((bar_w - 1 - 2*o) * hpmark / hpmax), yy + (bar_h - 1) - o, 0);
            }
        } else {
            draw_set_color(c_red);
			draw_rectangle(xx + o, yy + o, xx + o + ((bar_w - 1 - 2*o) * hp / hpmax), yy + (bar_h - 1) - o, 0);
            if (hpmark != hp) {
                draw_set_color(c_yellow);
				draw_rectangle(xx + o + ((bar_w - 1 - 2*o) * hp / hpmax), yy + o, xx + o + ((bar_w - 1 - 2*o) * hpmark / hpmax), yy + (bar_h - 1) - o, 0);
            }
        }
        draw_set_color(c_black);
		draw_rectangle(xx + o, yy + o, xx + (bar_w - 1) - o, yy + (bar_h - 1) - o, 1);
        draw_set_alpha(1);
        if (global.gpspeed != 0) {
            bar_opacity[0] -= 0.05;
        }
    }
    //Focus Bar
    if (bar_opacity[1] > 0) {
        bar_yoffset[1] = home(bar_yoffset[1], 36 + ((bar_opacity[2] > 0) * (bar_h + bar_pad)), 0.5);
        draw_set_alpha(min(bar_opacity[1] / 2, 0.5));
        draw_set_color(c_black);
		xx = round(x - (bar_w / 2));
		yy = round(y + bar_yoffset[1]);
        draw_rectangle(xx, yy, xx + (bar_w - 1), yy + (bar_h - 1), 0);
        draw_set_alpha(bar_opacity[1]);
        draw_set_color(c_white);
        if (obj_player.focus > 0) {
			draw_rectangle(xx + o, yy + o, xx + o + ((bar_w - 1 - 2*o) * obj_player.focus / obj_player.foctime), yy + (bar_h - 1) - o, 0);
        }
        draw_set_color(c_black);
        draw_rectangle(xx + o, yy + o, xx + (bar_w - 1) - o, yy + (bar_h - 1) - o, 1);
        draw_set_alpha(1);
        if (global.gpspeed != 0) {
            bar_opacity[1] -= 0.05;
        }
    }
    //Charging & CCooldown
    if (bar_opacity[2] > 0) {
        bar_yoffset[2] = 36;
        if (charge > 0) {
            //Charging Bar
            draw_set_alpha(min(bar_opacity[2] / 2, 0.5));
            draw_set_color(c_black);
			xx = round(x - (bar_w / 2));
			yy = round(y + bar_yoffset[2]);
            draw_rectangle(xx, yy, xx + (bar_w - 1), yy + (bar_h - 1), 0);
            draw_set_alpha(bar_opacity[2]);
            draw_set_color(color);
			draw_rectangle(xx + o, yy + o, xx + o + ((bar_w - 1 - 2*o) * charge / ctime), yy + (bar_h - 1) - o, 0);
            draw_set_color(c_black);
            draw_rectangle(xx + o, yy + o, xx + (bar_w - 1) - o, yy + (bar_h - 1) - o, 1);
            draw_set_alpha(1);
        }
        else {
            //CCooldown Bar
            draw_set_alpha(min(bar_opacity[2] / 2, 0.5));
            draw_set_color(c_black);
			xx = round(x - (bar_w / 2));
			yy = round(y + bar_yoffset[2]);
            draw_rectangle(xx, yy, xx + (bar_w - 1), yy + (bar_h - 1), 0);
            draw_set_alpha(bar_opacity[2]);
            draw_set_color(color_shift_hsv(color, 128, 0, 0, 1));
			draw_rectangle(xx + o, yy + o, xx + o + ((bar_w - 1 - 2*o) * discharge / ccooldown), yy + (bar_h - 1) - o, 0);
            draw_set_color(c_black);
            draw_rectangle(xx + o, yy + o, xx + (bar_w - 1) - o, yy + (bar_h - 1) - o, 1);
            draw_set_alpha(1);
        }
        if (global.gpspeed != 0) {
            bar_opacity[2] -= 0.05;
        }
    }
    gpu_set_alphatestref(254);
    surface_reset_target();
}

#endregion