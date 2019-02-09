/// @description Draw Health Bar

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Health bar

if (hp > 0 && !obj_player.status_effect[7] && !obj_player.status_effect[8]) {
    surface_set_target(GUI_SURFACE);
    if (bar_extension == 0) {
        draw_set_color(c_black);
        draw_set_alpha(0.5);
        draw_set_alpha_test_ref_value(0);
        draw_rectangle(x - 30, y - (sprite_height / 2) - 6, x + 30, y - (sprite_height / 2), 0);
        draw_set_color(c_red);
        draw_set_alpha(1);
        draw_set_alpha_test_ref_value(254);
        draw_rectangle(x - 29, y - (sprite_height / 2) - 5, x - 29 + (59 * hp / hpmax), y - (sprite_height / 2), 0);
        draw_set_color(c_black);
        draw_rectangle(x - 30, y - (sprite_height / 2) - 6, x + 30, y - (sprite_height / 2), 1);
    } else {
        var text        = string(ceil(hp)) + " / " + string(ceil(hpmax));
        var text_width  = 2 * string_width(string_hash_to_newline(text));
        var text_height = 2 * string_height(string_hash_to_newline(text));
        var hgrowth     = bar_extension * max(0, text_width + 4 - 60) / 2;
        var vgrowth     = bar_extension * max(0, text_height + 4 - 6) / 2;
        draw_set_color(c_black);
        draw_set_alpha(0.5);
        draw_set_alpha_test_ref_value(0);
        draw_rectangle(x - 30 - hgrowth, y - (sprite_height / 2) - 6 - vgrowth, x + 30 + hgrowth, y - (sprite_height / 2) + vgrowth, 0);
        draw_set_color(hsv(0, 255, 255 - (191 * bar_extension)));
        draw_set_alpha(1);
        draw_set_alpha_test_ref_value(254);
        draw_rectangle(x - 29 - hgrowth, y - (sprite_height / 2) - 5 - vgrowth, x - 29 - hgrowth + ((59 + (2 * hgrowth)) * hp / hpmax), y - (sprite_height / 2) + vgrowth, 0);
        draw_set_color(c_black);
        draw_rectangle(x - 30 - hgrowth, y - (sprite_height / 2) - 6 - vgrowth, x + 30 + hgrowth, y - (sprite_height / 2) + vgrowth, 1);
        if (bar_extension) {
            draw_text_full(x + 2, y - (sprite_height / 2) - 3, text, 2, 2, 0, 1, fa_center, fa_middle, c_red);
        }
    }
    surface_reset_target();
}

#endregion