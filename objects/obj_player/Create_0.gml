/// @description setup
xv=0;
yv=0;
shot=0;
inv=0;
focus=0;
focus_state=0;
charge=0;
discharge=0;
artcharge=0;
cb=0;
ultcount=0;
ultblink=0;
flash_clock=0; //for white flash when activating an ultimate
spawn=id;
hpmark=0;
hpmark_v=0;
helper=noone;
bar_opacity[0]=0; bar_yoffset[0]=52;
bar_opacity[1]=0; bar_yoffset[1]=44;
bar_opacity[2]=0; bar_yoffset[2]=36;
evilflame_sprite_swap=0;
evilflame_twilight_fury=0;
afterimage_ds_grid=-1;
image_speed=0.4*gpspeed;
sprite_index=spr_evilflame+boss.chrsel;
image_alpha=1;
image_angle=0;
x=CANVAS_XMID; y=CANVAS_YMID-32;
if !global.loading {
    scr_PlayerDataUpdate(boss.chrsel);
    scr_PlayerGetData();
    scr_ParticlesUpdate();
    scr_BackgroundUpdate(realm);
    image_scale(2,2);
}

///status effects

global.status_effect_count=11; //this is how many status effects there are in total
for(var i=global.status_effect_count-1; i>=0; i--) status_effect[i]=0;

if !global.loading {
globalvar player_status_effects;
player_status_effects=ds_grid_create(3,0);
ds_grid_clear(player_status_effects,-1);
}

global.player_status_effect_name[global.status_effect_count-1]="";
global.player_status_effect_desc[global.status_effect_count-1]="";

global.player_status_effect_name[0]="EXHAUSTED";
global.player_status_effect_desc[0]=
"Your mobility drops"+
"#significantly!";

global.player_status_effect_name[1]="MAGIC FATIGUE";
global.player_status_effect_desc[1]=
"Your magic attacks"+
"#are weakened!";

global.player_status_effect_name[2]="SPELL-DRIED";
global.player_status_effect_desc[2]=
"You cannot use"+
"#any magic!";

global.player_status_effect_name[3]="PARALYZED";
global.player_status_effect_desc[3]=
"You can barely"+
"#move your body!";

global.player_status_effect_name[4]="DIZZY";
global.player_status_effect_desc[4]=
"You can't bring"+
"#yourself to focus!";

global.player_status_effect_name[5]="DUAL CLONE";
global.player_status_effect_desc[5]=
"All of your actions"+
"#are doubled!";

global.player_status_effect_name[6]="ULTIMATE COOLDOWN";
global.player_status_effect_desc[6]=
"You cannot use"+
"#your ultimate!";

global.player_status_effect_name[7]="CURRENT CRUSH";
global.player_status_effect_desc[7]=
"Your foes' fate"+
"#is sealed.";

global.player_status_effect_name[8]="CHIP TUNING";
global.player_status_effect_desc[8]=
"You are moving"+
"#at enormous speeds!";

global.player_status_effect_name[9]="TWILIGHT FURY";
global.player_status_effect_desc[9]=
"The power of the stars"+
"#is at your hands.";

global.player_status_effect_name[10]="BERSERK";
global.player_status_effect_desc[10]=
"An uncontrollable fury"+
"#takes over your body!";

///event_inherited();
event_inherited();

///fetch enum depth
depth=general_depth.player;

