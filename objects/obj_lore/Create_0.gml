/// @description Setup

#region Setup

instance_setup(irandom(image_number - 1), 0.04);
sprite_index = noone;
depth        = gui_depth.lore;
osc          = fx_wave(3, 4, -3, -4, 1, 30, 0, -1, 3, 4, -3, -4, 3, 45, 0, -1);
scr_LoreUpdate();

#endregion