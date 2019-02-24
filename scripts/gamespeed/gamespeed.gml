/// @description gamespeed(speed);
/// @param speed

var new_gpspeed = argument[0];

// prev_image_speed manipulation
if (gpspeed == 0 && new_gpspeed != 0) {
    with (all) {
        if (object_is_ancestor(object_index,obj_prev_imgspd)) {
            image_speed = prev_image_speed;
        }
    }
} else {
    if (gpspeed != 0) {
        with (all) {
            if (object_is_ancestor(object_index,obj_prev_imgspd)) {
                prev_image_speed = image_speed;
                image_speed *= new_gpspeed / gpspeed;
            }
        }
    }
}

// setting up prev_gpspeed and updating gpstep
if (gpspeed != 0) {
    prev_gpspeed = gpspeed;
    gpstep *= new_gpspeed / gpspeed;
}

// resuming after pause when holding down shift to get into focus mode immediately
if (gpspeed == 0) {
    with (obj_player) {
        if (keyboard_check(global.keybind[5]) && focus_state == 0 && new_gpspeed == 1) {
            focus_state = 1;
        }
    }
}

// changing gpspeed to the new value
gpspeed = new_gpspeed;

// if the new gpspeed isn't 0 :
if (gpspeed != 0) {
    // player variable changes
    with (obj_player) {
        if (inv > 0) {
            inv = round(inv * prev_gpspeed / gpspeed);
        }
        if (instance_exists(obj_evilflame_ultimate) && obj_evilflame_ultimate.inv > 0) {
            obj_evilflame_ultimate.inv=round(obj_evilflame_ultimate.inv * prev_gpspeed / gpspeed);
        }
        if (shot > 0) {
            shot *= prev_gpspeed / gpspeed;
        }
        if (instance_exists(obj_evilflame_ultimate) && obj_evilflame_ultimate.shot > 0) {
            obj_evilflame_ultimate.shot = round(obj_evilflame_ultimate.shot * prev_gpspeed / gpspeed);
        }
        if (xv != 0) {
            xv *= gpspeed / prev_gpspeed;
        }
        if (yv != 0) {
            yv *= gpspeed / prev_gpspeed;
        }
        hpmark_v *= gpspeed / prev_gpspeed;
        if (instance_exists(obj_evilflame_ultimate)) {
            obj_evilflame_ultimate.hpmark_v *= gpspeed / prev_gpspeed;
        }
    }

    // repitch sounds
    music_pitch(sound_gpspeed);
    sfx_pitch(sound_gpspeed);

    // knockback correction
    with (all) {
        if (object_is_ancestor(object_index,obj_knockback_physics)) {
            if (ahkb != 0 && hkb != 0) {
                var ahkb00 = ahkb;
                var hkb00  = hkb;
                var th00   = abs(hkb00 / ahkb00);
                ahkb       = abs((hkb00 * (th00+1)) / (sqr(th00 * prev_gpspeed / gpspeed)+(th00 * prev_gpspeed / gpspeed)));
                hkb        = abs(ahkb * (th00 * prev_gpspeed / gpspeed)) * sign(hkb00);
            }
            if (avkb != 0 && vkb != 0) {
                var avkb00 = avkb;
                var vkb00  = vkb;
                var tv00   = abs(vkb00 / avkb00);
                avkb       = abs((vkb00 * (tv00+1)) / (sqr(tv00 * prev_gpspeed / gpspeed)+(tv00 * prev_gpspeed / gpspeed)));
                vkb        = abs(avkb * (tv00 * prev_gpspeed / gpspeed)) * sign(vkb00);
            }
            /*show_message(
            'OBJECT: '+object_get_name(object_index)+
            ';#hkb00='+string(hkb00)+'; hkb='+string(hkb)+
            ';#ahkb00='+string(ahkb00)+'; ahkb='+string(ahkb)+
            ';#th00='+string(th00)+'; th='+string(abs(hkb/ahkb))+
            ';#vkb00='+string(vkb00)+'; vkb='+string(vkb)+
            ';#avkb00='+string(avkb00)+'; avkb='+string(avkb)+
            ';#tv00='+string(tv00)+'; tv='+string(abs(vkb/avkb))
            );*/
        }
    }
}