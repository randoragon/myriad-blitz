/// @description player_hp(amount,_playerid);
/// @param amount
/// @param _playerid
if argument_count==1 var ftarget=obj_player; else var ftarget=argument[1];
if !instance_exists(ftarget) exit;

with(ftarget)
{
hpmark=hp;
hp=clamp(hp+argument[0],0,hpmax);
hpmark_v=abs(hpmark-hp)/invtime;
bar_opacity[0]=7;
}
