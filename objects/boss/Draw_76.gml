/// @description Surfaces Check

if (!surface_exists(global.general_surface)) {
	global.general_surface = surface_create(room_width, room_height);
	surface_set_target(global.general_surface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}

if (!surface_exists(global.gui_surface)) {
	global.gui_surface = surface_create(room_width, room_height);
	surface_set_target(global.gui_surface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}