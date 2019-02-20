/// @description Effects

#region Effects

for (var i = 0; i < 11; i++) {
	if (effect[i] == -1) {
		if (effect_clock[i] <= 0) {
			effect[i]			= irandom(7);
			effect_progress[i]	= 0;
			xx[i]				= 0;
			yy[i]				= 0;
			xscale[i]			= 1;
			yscale[i]			= 1;
			angle[i]			= 0;
		} else {
			effect_clock[i] -= 1;
		}
	} else {
		if (effect_progress[i] >= 30) {
			effect[i] = -1;
			if (effect_clock[i] <= 0) { effect_clock[i] = 210; }
		} else {
			switch (effect[i]) {
				case 0: // Y LEAP
					yy[i] = 10 * dsin(effect_progress[i] * 12);
				break;
				case 1: // X LEAP
					xx[i] = 10 * dsin(effect_progress[i] * 12);
				break;
				case 2: // CLOCKWISE ROTATION + SHRINK
					angle[i] -=     18.86 * dsin(effect_progress[i] * 6);
					xscale[i] = 1 - (0.25 * dsin(effect_progress[i] * 6));
					yscale[i] = 1 - (0.25 * dsin(effect_progress[i] * 6));
				break;
				case 3: // COUNTER-CLOCKWISE ROTATION + SHRINK
					angle[i] +=     18.86 * dsin(effect_progress[i] * 6);
					xscale[i] = 1 - (0.25 * dsin(effect_progress[i] * 6));
					yscale[i] = 1 - (0.25 * dsin(effect_progress[i] * 6));
				break;
				case 4: // X FLIP
					xscale[i] = dsin(90 + (effect_progress[i] * 12));
				break;
				case 5: // Y FLIP
					yscale[i] = dsin(90 + (effect_progress[i] * 12));
				break;
				case 6: // SQUISH
					xscale[i] = 1 + (0.25 * dsin(effect_progress[i] * 12));
					yscale[i] = 1 - (0.25 * dsin(effect_progress[i] * 12));
				break;
				case 7: // EXPANSION + SHRINK
					xscale[i] = 1 + (0.25 * dsin(effect_progress[i] * 12));
					yscale[i] = 1 + (0.25 * dsin(effect_progress[i] * 12));
				break;
			}
			effect_progress[i] += 1;
		}
	}
}

#endregion