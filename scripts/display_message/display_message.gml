/// @description display_message(message, script);
/// @param message
/// @param script

play_sfx(sfx_popup, 0, 0);

var fobj     = instance_create(CANVAS_XMID, CANVAS_YMID, obj_popup_message);
fobj.content = argument[0];
fobj.script  = argument[1];

return fobj;