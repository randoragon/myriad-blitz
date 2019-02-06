/// @description Call Startup

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Startup code initiation

if (sprite_index == noone) { event_perform(ev_other, ev_user0); }

#endregion