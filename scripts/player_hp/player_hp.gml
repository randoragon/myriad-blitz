/// @description player_hp(amount, _playerid);
/// @param amount
/// @param _playerid
function player_hp() {

	var ftarget = (argument_count == 1 ? obj_player : argument[1]);

	if (!instance_exists(ftarget)) { exit; }

	with (ftarget) {
	    hpmark         = hp;
	    hp             = clamp(hp + argument[0], 0, hpmax);
	    hpmark_v       = abs(hpmark - hp) / (invtime ? invtime : 60);
	    bar_opacity[0] = 7;
	}


}
