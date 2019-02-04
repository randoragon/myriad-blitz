/// @description skip if loading
if global.loading==1 exit;

///frag behavior

switch(f)
{
case 0:
    switch(e) {
    case 0:
    vspeed1+=vacc*sqr(gpspeed);
    if real_step() part_type_spawn_ult(global.part_system[2],global.frag_part[0],2,x,y,x,y,"square","linear",1);
    break;
    case 1:
    if real_step() part_type_spawn_ult(global.part_system[2],global.frag_part[1],2,x,y,x,y,"square","linear",1);
    break;
    case 2:
    speed1+=random_range(-0.2,0.2);
    direction+=random_range(-2,2);
    if real_step() part_type_spawn_ult(global.part_system[2],global.frag_part[2],2,x,y,x,y,"square","linear",1);
    break;
    }
    image_angle+=10*gpspeed;
break;
case 1:
    if !instance_exists(obj_emerald_ultimate) {
    if enemyharm<1 {enemyharm=min(enemyharm+(0.08*gpspeed),1); direction+=2*gpspeed;}
    if enemyharm==1 && instance_exists(obj_enemy) {direction=home(direction,point_direction(x,y,instance_nearest(x,y,obj_enemy).x,instance_nearest(x,y,obj_enemy).y),4*gpspeed,1);}
    }
    else {
    direction=home(direction,point_direction(x,y,obj_emerald_ultimate.x,obj_emerald_ultimate.y),clamp((500-distance_to_point(obj_emerald_ultimate.x,obj_emerald_ultimate.y))*.05,1,15)*gpspeed,1);
    if angle_difference(direction,point_direction(x,y,obj_emerald_ultimate.x,obj_emerald_ultimate.y))>=180
    speed1-=0.1*gpspeed;
    else
    speed1+=0.025*gpspeed;
    }
    if real_step() {
        part_type_edit_ult(global.frag_part[0],"angle",image_angle,image_angle,0,0);
        part_type_spawn_ult(global.part_system[2],global.frag_part[0],2,x,y,x,y,"square","linear",1);
    }
    image_angle=direction;
break;
}

///dealing damage

if place_meeting(x,y,obj_enemy) && instance_place(x,y,obj_enemy).hp>0 && (enemy!=instance_place(x,y,obj_enemy).id or enemyharm==1)
{
    var ee=instance_place(x,y,obj_enemy);
    var damage=calculate_damage(fdmg,fpen,ee.fdef/(mean(fmin,fmax)*spawn.sspd));
    var display_damage=ceil(ee.hp)-ceil(ee.hp-damage);
    ee.hp=clamp(ee.hp-damage,0,ee.hpmax);
    knockback((100-ee.fkbres)*fkb/1000,point_direction(x,y,x,y),1);
    indicate(x,y,display_damage,1,rgb(255,85,0),c_red);
    play_sfx(sfx_evilflame_frag_hit+(boss.chrsel*4),sound_priority.player_frag_hit,0,sound_gpspeed*100);
    instance_destroy();
}

///despawn

lifespan-=gpspeed;
if lifespan<=0 or y>CANVAS_YEND+sprite_yoffset+128 or y<-sprite_height+sprite_yoffset-128 or x<-sprite_width+sprite_xoffset-128 or x>CANVAS_XEND+sprite_xoffset+128
{instance_destroy(); exit;}

///event_inherited();
event_inherited();

