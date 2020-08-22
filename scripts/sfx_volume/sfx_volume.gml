/// @description sfx_volume(volume, time)
/// @param volume
/// @param time
function sfx_volume() {

	for (var i = 0; i < array_length_1d(global.sfx); i++) {
	    if(audio_is_playing(global.sfx[i])) {
	        audio_sound_gain(global.sfx[i], argument[0], argument[1]);
	    }
	}




}
