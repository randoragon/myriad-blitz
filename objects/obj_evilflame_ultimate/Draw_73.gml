/// @description Gameplay Bars

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Draw gameplay bars

if (global.state == 1) {
    surface_set_target(GUI_SURFACE);
    gpu_set_alphatestref(0);
    //HP Bar
    if (bar_opacity[0] > 0) {
        bar_yoffset[0] = home(bar_yoffset[0], 36 + (((bar_opacity[1] > 0) + (bar_opacity[2] > 0)) * 8), 0.5);
        draw_set_alpha(min(bar_opacity[0] / 2, 0.5));
        draw_set_color(c_black);
        draw_rectangle(x - 30, y + bar_yoffset[0] + 6, x + 30, y + bar_yoffset[0], 0);
        draw_set_alpha(bar_opacity[0]);
        if (hpmark < hp) {
            draw_set_color(c_red);
            draw_rectangle(x - 29, y + bar_yoffset[0] + 6, x - 29 + (59 * hpmark / hpmax), y + bar_yoffset[0] + 1, 0);
            if (hpmark != hp) {
                draw_set_color(c_lime);
                draw_rectangle(x - 29 + (59 * hp / hpmax), y + bar_yoffset[0] + 6, x - 29 + (59 * hpmark / hpmax), y + bar_yoffset[0] + 1, 0);
            }
        } else {
            draw_set_color(c_red);
            draw_rectangle(x - 29, y + bar_yoffset[0] + 6, x - 29 + (59 * hp / hpmax), y + bar_yoffset[0] + 1, 0);
            if (hpmark != hp) {
                draw_set_color(c_yellow);
                draw_rectangle(x - 29 + (59 * hp / hpmax), y + bar_yoffset[0] + 6, x - 29 + (59 * hpmark / hpmax), y + bar_yoffset[0] + 1, 0);
            }
        }
        draw_set_color(c_black);
        draw_rectangle(x - 30, y + bar_yoffset[0] + 6, x + 30, y + bar_yoffset[0], 1);
        draw_set_alpha(1);
        if (global.gpspeed != 0) {
            bar_opacity[0] -= 0.05;
        }
    }
    //Focus Bar
    if (bar_opacity[1] > 0) {
        bar_yoffset[1] = home(bar_yoffset[1], 36 + ((bar_opacity[2] > 0) * 8), 0.5);
        draw_set_alpha(min(bar_opacity[1] / 2, 0.5));
        draw_set_color(c_black);
        draw_rectangle(x - 30, y + bar_yoffset[1] + 6, x + 30, y + bar_yoffset[1], 0);
        draw_set_alpha(bar_opacity[1]);
        draw_set_color(c_white);
        if(obj_player.focus>0) {
            draw_rectangle(x - 29, y + bar_yoffset[1] + 6, x - 29 + (59 * obj_player.focus / obj_player.foctime), y + bar_yoffset[1] + 1, 0);
        }
        draw_set_color(c_black);
        draw_rectangle(x - 30, y + bar_yoffset[1] + 6, x + 30, y + bar_yoffset[1], 1);
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
            draw_rectangle(x - 30, y + bar_yoffset[2] + 6, x + 30, y + bar_yoffset[2], 0);
            draw_set_alpha(bar_opacity[2]);
            draw_set_color(color);
            draw_rectangle(x - 29, y + bar_yoffset[2] + 6, x - 29 + ((59 * charge) / (ctime)), y + bar_yoffset[2] + 1, 0);
            draw_set_color(c_black);
            draw_rectangle(x - 30, y + bar_yoffset[2] + 6, x + 30, y + bar_yoffset[2], 1);
            draw_set_alpha(1);
        }
        else {
            //CCooldown Bar
            draw_set_alpha(min(bar_opacity[2] / 2, 0.5));
            draw_set_color(c_black);
            draw_rectangle(x - 30, y + bar_yoffset[2] + 6, x + 30, y + bar_yoffset[2], 0);
            draw_set_alpha(bar_opacity[2]);
            draw_set_color(color_shift_hsv(color, 128, 0, 0, 1));
            draw_rectangle(x - 29, y + bar_yoffset[2] + 6, x - 29 + ((59 * discharge) / ccooldown), y + bar_yoffset[2] + 1, 0);
            draw_set_color(c_black);
            draw_rectangle(x - 30, y + bar_yoffset[2] + 6, x + 30, y + bar_yoffset[2], 1);
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