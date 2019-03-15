/// @description Draw Overlay

#region set GUI_SURFACE

surface_set_target(GUI_SURFACE);

#endregion

#region Draw overlay

if (global.gpspeed != 0) {
    screen_darken(image_alpha * 3 / 4);
}
draw_set_alpha(image_alpha);
gpu_set_alphatestref(0);
surface_set_target(suf_mysurface);
draw_clear_alpha(0, 0);
draw_set_align(fa_center, fa_top);
draw_text_outline((image_width + hpadding + uname_width) / 2, 0, "ULTIMATE MOVE!!!", size * multiplier / 2, size * multiplier / 2, 0, c_white, 1, c_black, 1);
draw_set_align(fa_left, fa_top);
draw_text_outline(image_width + hpadding, headline_height + vpadding, text, size * multiplier, size * multiplier, 0, c_white, 1, c_black, 1);
draw_sprite_ext(spr_slot_char, global.chrsel, sprite_get_xoffset(spr_slot_char) * image_width / sprite_get_width(spr_slot_char), headline_height + vpadding + (sprite_get_yoffset(spr_slot_char) * image_height / sprite_get_height(spr_slot_char)), image_width / sprite_get_width(spr_slot_char), image_height / sprite_get_height(spr_slot_char), 0, c_white, image_alpha);
surface_reset_target();
draw_set_alpha(1);
shd_shine_set(
	progress,
	image_width + hpadding + uname_width, headline_height + vpadding + uname_height, 
	mysurface_width, mysurface_height,
	color_get_red(global.color[global.chrsel]) / 255.0, color_get_green(global.color[global.chrsel])/255.0, color_get_blue(global.color[global.chrsel])/255.0, image_alpha,
	texel_width * size* multiplier, texel_height * size * multiplier,
	0.0, (headline_height + vpadding) / mysurface_height, (image_width) / mysurface_width, 1.0);
draw_surface(suf_mysurface, CANVAS_XMID - ((image_width + hpadding + uname_width) / 2), CANVAS_YMID - ((headline_height + vpadding + uname_height) / 2));
gpu_set_alphatestref(254);
shader_reset();

#endregion

#region Reset surface

surface_reset_target();

#endregion