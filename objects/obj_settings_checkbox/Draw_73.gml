/// @description Draw Tooltips

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw tooltips

if (check) {
    draw_set_color(rgb(0, 60, 0));
} else {
    draw_set_color(rgb(60, 0, 0));
}

if (boss.x >= x + 25 - 2 && boss.x <= x + 25 + (3 * string_width(label)) + 2 && boss.y >= y - (1.5 * (string_height(label))) - 2 && boss.y <= y + (1.5 * (string_height(label))) + 2 && desc != "") {
    draw_tooltip(desc);
}

#endregion

#region Reset surface

surface_reset_target();

#endregion