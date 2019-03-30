/// @description Draw in some cases

#region Draw in some cases

switch (f) {
	case 5: case 6: case 14: case 16:
		surface_set_target(GUI_SURFACE);
		draw_self();
		surface_reset_target();
	break;
}

#endregion