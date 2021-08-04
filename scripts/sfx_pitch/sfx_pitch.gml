/// @description sfx_pitch(pitch)
/// @param pitch
function sfx_pitch() {

	var asset_index;
	for (var i = 0; i < array_length(global.sfx); i++) {
	    asset_index = asset_get_index(audio_get_name(global.sfx[i]));
	    if (asset_index == sfx_scootomik_ultimate_loop || asset_index == sfx_ultimate_activation) {
	        continue;
	    }
	    if (audio_is_playing(global.sfx[i])) {
	        audio_sound_pitch(global.sfx[i], argument[0]);
	    }
	}



}
