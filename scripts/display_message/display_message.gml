/// @description display_message(message, script);
/// @param message
/// @param script
function display_message() {

	play_sfx(sfx_popup, 0);

	var fobj     = instance_create_layer(CANVAS_XMID, CANVAS_YMID, "Popups", obj_popup_message);
	fobj.content = argument[0];
	fobj.script  = argument[1];

	return fobj;


}
