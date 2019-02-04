/// @description Room change && script
if destination!=-1 && room_exists(destination) room_goto(destination);
if script!=-1 && script_exists(script) script_execute(script);

