/// @description Startup Call

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Startup code initiation

if (sprite_index == noone) { event_perform(ev_other, ev_user0); }

#endregion