/// @description ask(question, if no[scr], if yes[scr]);
/// @param question
/// @param if no[scr]
/// @param if yes[scr]

play_sfx(sfx_popup, 0, 0);

var fobj       = instance_create(CANVAS_XMID, CANVAS_YMID, obj_popup_question);
fobj.content   = argument[0];
fobj.script[0] = argument[1];
fobj.script[1] = argument[2];

return fobj;