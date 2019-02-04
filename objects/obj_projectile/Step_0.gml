/// @description skip if loading
if global.loading==1 exit;

///emerald's current crush
if instance_exists(obj_emerald_ultimate)
if gpspeed!=0 {
if hspeed1!=0 or vspeed1!=0 {
speed1+=sqrt(sqr(hspeed1)+sqr(vspeed1));
hspeed1=0; vspeed1=0;
}
direction=home(direction,point_direction(x,y,obj_emerald_ultimate.x,obj_emerald_ultimate.y),clamp((500-distance_to_point(obj_emerald_ultimate.x,obj_emerald_ultimate.y))*.05,1,20)*gpspeed,1);
if angle_difference(direction,point_direction(x,y,obj_emerald_ultimate.x,obj_emerald_ultimate.y))>=180
speed1-=0.2*gpspeed;
else
speed1+=0.1*gpspeed;
image_angle=direction;
}

///bullet behavior
switch(f) {
case 0:
    switch(e) { //evilflame fury bullets
    case 2:
    speed1=max(speed1-(0.08*gpspeed),1);
    direction+=random_range(-2,2)*gpspeed;
    if real_step() part_type_spawn_ult(global.part_system[2],global.frag_part[2],6,x,y,x,y,"square","linear",1);
    break;
    }
break;
}

///dealing damage & spawning frags

if(place_meeting(x,y,obj_enemy) && instance_place(x,y,obj_enemy).hp>0) {
    var ee=instance_place(x,y,obj_enemy);
    var damage=calculate_damage(pdmg,ppen,ee.pdef/sspd);
    var display_damage=ceil(ee.hp)-ceil(ee.hp-damage);
    ee.hp=clamp(ee.hp-damage,0,ee.hpmax);
    knockback((100-ee.pkbres)*pkb/1000,point_direction(x,y,x,y),1);
    indicate(x,y,display_damage,1,rgb(255,85,0),c_red);
    play_sfx(sfx_evilflame_bullet_hit+(boss.chrsel*4),sound_priority.player_bullet_hit,0,sound_gpspeed*100);
    if(global.enemy_details_selection_auto_aim) {
        global.enemy_details_selection=ee;
    }
    //spawning frags
    var angle=irandom(359);
    var frag_e=0;
    if(boss.chrsel==0 && e==2) {
        frag_e=2;
    } else
    if(boss.chrsel==2 && e==1) {
        frag_e=1;
    }
    spawn_bullet_ring(x,y,obj_frag,boss.chrsel,frag_e,ee.id,spawn,irandom_range(floor(fmin),ceil(fmax)),0);
    instance_destroy();
}

///despawn & rotation
image_angle+=rot*gpspeed;
lifespan-=gpspeed;
if lifespan<=0 or y>CANVAS_YEND+sprite_yoffset+128 or y<-sprite_height+sprite_yoffset-128 or x<-sprite_width+sprite_xoffset-128 or x>CANVAS_XEND+sprite_xoffset+128 instance_destroy();

///event_inherited();
event_inherited();

