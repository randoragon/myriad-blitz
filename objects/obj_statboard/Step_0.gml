/// @description GUI Elements Management

#region Hide

x=xstart+(360*global.transition);

#endregion

#region GUI elements management

if (x >= xstart + 360) {
	if (instance_exists(osc))        { wipe(osc); osc = -4;             }
	if (instance_exists(button[0]))  { wipe(button[0]); button[0] = -4; }
	if (instance_exists(button[1]))  { wipe(button[1]); button[1] = -4; }
	if (state == 1)                  { instance_destroy();              }
} else {
	if (!instance_exists(osc))       { osc       = fx_wave(3, 4, -3, -4, 1, 30, 0, -1, 3, 4, -3, -4, 3, 45, 0, -1); }
	if (!instance_exists(button[0])) { button[0] = instance_create_f(x + 115, y - 170, obj_button, 21);             }
	if (!instance_exists(button[1])) { button[1] = instance_create_f(x - 87, y - 170, obj_button, 21);              }
}

for (var i = 0; i < array_length_1d(checkbox); i++) {
	if (instance_exists(checkbox[i])) {
		checkbox[i].y = -20;
		if (listed[i] != checkbox[i].check) { listed[i] = checkbox[i].check; }
	}
}

#endregion