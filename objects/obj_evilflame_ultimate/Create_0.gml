/// @description skip if loading
if global.loading==1 exit;

///setup

player=instance_find(obj_player,1);
if player.evilflame_sprite_swap sprite_index=spr_evilflame;
else sprite_index=spr_evilflame_ultimate;
instance_setup(obj_player.image_index,0,-obj_player.image_angle,obj_player.image_alpha);
image_yscale=-1;
depth=general_depth.wrap_helper;
hp=player.hp; hpmax=player.hpmax; hpmark=hp; hpmark_v=0;
inv=player.invtime;
invtime=player.invtime;
cb=player.cb;
charge=player.charge;
ctime=player.ctime;
discharge=player.discharge;
ccooldown=player.ccooldown;
artcharge=player.artcharge;
color=global.color[boss.chrsel];
shot=player.shot;
bar_opacity[0]=0; bar_yoffset[0]=52;
bar_opacity[1]=0; bar_yoffset[1]=44;
bar_opacity[2]=0; bar_yoffset[2]=36;

///event_inherited()
event_inherited();

