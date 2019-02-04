/// @description skip if loading
if global.loading==1 exit;

///event_inherited();
event_inherited();

///wave motion, out of room & closing in on the player

//wave motion
switch(wave_cycle) {
case 0: vspeed1=home(vspeed1,1.5,0.1*sqr(gpspeed),0); if vspeed1>=1.5 wave_cycle=1; break;
case 1: vspeed1=home(vspeed1,-1.5,0.1*sqr(gpspeed),0); if vspeed1<=-1.5 wave_cycle=0; break;
}

if picked==0 {
//homing into player
var player_distance=distance_to_object(obj_player);
if player_distance<=50 {
x=home(x,obj_player.x,(50-player_distance)/25,0);
y=home(y,obj_player.y,(50-player_distance)/25,0);
}

//homing into wrap helper
if instance_exists(obj_wrap_helper) {
var player_distance=distance_to_object(obj_wrap_helper);
if player_distance<=50 {
x=home(x,obj_wrap_helper.x,(50-player_distance)/25,0);
y=home(y,obj_wrap_helper.y,(50-player_distance)/25,0);
}
}

//homing into evilflame's dual clone
if instance_exists(obj_evilflame_ultimate)
if boss.chrsel==0 {
var player_distance=distance_to_object(obj_evilflame_ultimate);
if player_distance<=50 {
x=home(x,obj_evilflame_ultimate.x,(50-player_distance)/25,0);
y=home(y,obj_evilflame_ultimate.y,(50-player_distance)/25,0);
}
}
}

//out of room boundaries
if x<-16 {instance_destroy();}

