/// @description Draw Realm Overlay

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw realm overlay

draw_self();
draw_set_alpha_test_ref_value(0);
draw_set_blend_mode_ext(bm_dest_color, bm_zero);
draw_sprite_ext(spr_realm_overlay, 0, x, y, image_xscale, image_yscale, image_angle, hsv(0, 0, 255 * (image_xscale - 0.1)), 1);
draw_set_blend_mode(bm_normal);
draw_set_alpha_test_ref_value(254);

#endregion

#region Reset surface

surface_reset_target();

#endregion