/// @description Switch Room

#region Switch room

if (room_exists(destination))		{ room_goto(destination);    }
if (script_exists(script))		    { script_execute(script);    }

#endregion