/// @description Draw Self & Label

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw self & label

draw_self();

draw_set_align(fa_left, fa_middle);
if (boss.x >= x + 25 - 2 && boss.x <= x + 25 + (3 * string_width(label)) + 2 && boss.y >= y - (1.5 * (string_height(label))) - 2 && boss.y <= y + (1.5 * (string_height(label))) + 2) {
    gpu_set_alphatestref(0);
    gpu_set_blendmode(bm_add);
    draw_text_highlight(x + 25, y, label, 3, c_black, 0.5, fa_left, fa_middle, 4, 4);
    gpu_set_colorwriteenable(1, 1, 1, 0);
    gpu_set_blendmode(bm_normal);
    draw_text_highlight(x + 25, y, label, 3, c_black, 0.5, fa_left, fa_middle, 4, 4);
    gpu_set_colorwriteenable(1, 1, 1, 1);
    gpu_set_alphatestref(254);
    if(check == 1) {
        draw_set_color(rgb(0, 255, 0));
    } else {
        draw_set_color(rgb(255, 0, 0));
    }
    draw_text_transformed(x + 25, y, label, 3, 3, 0);
} else {
    if (check == 1) {
        draw_set_color(rgb(0, 60, 0));
    } else {
        draw_set_color(rgb(60, 0, 0));
    }
    draw_text_transformed(x + 25, y, label, 3, 3, 0);
}

#endregion


#region Reset surface

surface_reset_target();

#endregion