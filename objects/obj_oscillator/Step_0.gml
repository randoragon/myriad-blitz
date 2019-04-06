/// @description Wave

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region Wave

for(var i = 0; i < 2; i++) {
    if (cyclecount[i] <= duration[i] || duration[i] == -1) {
        for (var l = 0; l < 4; l++) {
	        if (time[i] / cycle[i] <= (l + 1) * 0.25) {
		        var multiplier = 0;
		        if (abs(waveform[l, i]) == 1) {
					output[i] = sign(waveform[l, i]) * radius[i] * ((time[i] - (cycle[i] * (l * 0.25))) / (cycle[i] * 0.25));
				} else if (abs(waveform[l, i]) == 2) {
					output[i] = (sign(waveform[l, i]) * radius[i]) + (sign(waveform[l, i]) * -radius[i] * ((time[i] - (cycle[i] * (l * 0.25))) / (cycle[i] * 0.25)));
				} else if (abs(waveform[l, i]) == 3) {
					for (var j = cycle[i] / 4; j >= -(time[i] - (cycle[i] * (l * 0.25))) + (cycle[i] / 4) + 1; j--) {
						multiplier += j;
					}
					output[i] = sign(waveform[l, i]) * multiplier * acceleration[i];
				} else if (abs(waveform[l, i]) == 4) {
					for (var j = 0; j <= time[i] - (cycle[i] * (l * 0.25)); j++) {
						multiplier += j;
					}
					output[i] = (sign(waveform[l, i]) * radius[i]) + (sign(waveform[l, i]) * -1 * (multiplier * acceleration[i]));
				}
		        break;
	        }
        }
        time[i]++;
        if (time[i] - 1 <= cycle[i] * 0.25 && time[i] > cycle[i] * 0.25) || (time[i] - 1 <= cycle[i] * 0.5 && time[i] > cycle[i] * 0.5) ||
			(time[i] - 1 <= cycle[i] * 0.75 && time[i] > cycle[i] * 0.75) || (time[i] - 1 <= cycle[i] && time[i] > cycle[i]) {
				cyclecount[i]++;
		}
        if (time[i] > cycle[i]) { time[i] = 1; }
    } else {
	    var wavetype = (duration[i] + 3) % 4;
	    if (waveform[wavetype, i] == 1 || waveform[wavetype, i] == 3) {
			output[i] = radius[i];
		} else if (waveform[wavetype, i] == -1 || waveform[wavetype, i] == -3) {
			output[i] = -radius[i];
		} else if (abs(waveform[wavetype, i]) == 0 || abs(waveform[wavetype, i]) == 2) {
			output[i] = 0;
		}
	    instance_destroy();
    }
}

#endregion