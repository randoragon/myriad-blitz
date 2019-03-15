/// @description Draw Realm Overlay

#region GUI_SURFACE set

surface_set_target(GUI_SURFACE);

#endregion

#region Draw global.realm overlay

draw_self();
gpu_set_alphatestref(0);
gpu_set_blendmode_ext(bm_dest_color, bm_zero);
draw_sprite_ext(spr_realm_overlay, 0, x, y, image_xscale, image_yscale, image_angle, hsv(0, 0, 255 * (image_xscale - 0.1)), 1);
gpu_set_blendmode(bm_normal);
gpu_set_alphatestref(254);

#endregion

#region Reset surface

surface_reset_target();

#endregion