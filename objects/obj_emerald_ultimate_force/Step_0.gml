/// @description Countdown

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Countdown

clock -= global.gpspeed;
if (clock <= 0) { instance_destroy(); }
image_alpha = (clock / 60) + 0.2;

#endregion