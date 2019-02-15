/// @description Draw Self

#region

surface_set_target(GUI_SURFACE);

#endregion

#region Draw Self

if (x > xstart - 360) {
    draw_self();
    draw_set_alpha_test_ref_value(0);
    draw_sprite_ext(spr_controls, global.left_handed_mode, x - 17, y - 10, 1, 1, 0, -1, 0.9);
    draw_set_alpha_test_ref_value(254);
}

#endregion

#region Reset surface

surface_reset_target();

#endregion