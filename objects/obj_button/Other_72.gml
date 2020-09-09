/// @description Start run

if (async_load != -1 && async_load[? "type"] == "audiogroup_load" && async_load[? "group_id"] == global.character_audiogroup[global.chrsel] && !global.loading && global.state == 0) {
	scr_RunStart();
}