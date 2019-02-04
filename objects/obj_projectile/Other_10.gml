/// @description startup code
pdmg=spawn.pdmg;
ppen=spawn.ppen;
pkb=spawn.pkb;
pspd=spawn.pspd;
sacc=spawn.sacc;
sspd=spawn.sspd;
fmin=spawn.fmin;
fmax=spawn.fmax;

switch(e)
{
case 0:
    sprite_index=spr_evilflame_bullet+boss.chrsel;
    direction=spawn.image_angle+random_range(-45*(1-sacc),45*(1-sacc));
    speed1=pspd;
    image_angle=direction;
    image_speed=0;
    image_scale(2,2);
    lifespan=120;
break;
case 1:
    switch(f) {
    case 0: //evilflame's dual clone bullet
    sprite_index=spr_evilflame_bullet;
    direction=-spawn.image_angle+random_range(-45*(1-sacc),45*(1-sacc));
    speed1=pspd;
    image_angle=direction;
    image_speed=0;
    image_scale(2,2);
    lifespan=120;
    break;
    case 2: //scootomik's second bullet
    sprite_index=spr_scootomik_bullet;
    image_index=1;
    image_speed=0;
    direction=(spawn.image_angle+random_range(-45*(1-sacc),45*(1-sacc))+180)%360;
    speed1=pspd;
    image_angle=direction;
    image_scale(2,2);
    lifespan=120;
    break;
    }
break;
case 2:
    switch(f) {
    case 0: //evilflame twilight fury
    sprite_index=part_star;
    direction=spawn.image_angle+random_range(-45*(1-sacc),45*(1-sacc));
    speed1=pspd;
    rot=random_range(-5,5);
    image_angle=irandom(359);
    image_speed=0;
    image_alpha=0.7;
    image_scale(0.4,0.4);
    lifespan=180;
    break;
    }
break;
}

//emerald's current crush
if instance_exists(obj_emerald_ultimate) {
lifespan+=irandom_range(-10,10);
speed1/=2;
}

