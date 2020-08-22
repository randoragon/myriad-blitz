/// @description gamespeed(speed);
/// @param speed
function gamespeed() {

	var new_gpspeed = argument[0];

	// prev_image_speed manipulation
	if (global.gpspeed == 0 && new_gpspeed != 0) {
	    with (all) {
	        if (object_is_ancestor(object_index,obj_prev_imgspd)) {
	            image_speed = prev_image_speed;
	        }
	    }
	} else {
	    if (global.gpspeed != 0) {
	        with (all) {
	            if (object_is_ancestor(object_index,obj_prev_imgspd)) {
	                prev_image_speed = image_speed;
	                image_speed *= new_gpspeed / global.gpspeed;
	            }
	        }
	    }
	}

	// setting up global.prev_gpspeed and updating global.gpstep
	if (global.gpspeed != 0) {
	    global.prev_gpspeed = global.gpspeed;
	    global.gpstep *= new_gpspeed / global.gpspeed;
	}

	// resuming after pause when holding down shift to get into focus mode immediately
	if (global.gpspeed == 0) {
	    with (obj_player) {
	        if (keyboard_check(KEYBIND_FOCUS) && focus_state == 0 && new_gpspeed == 1) {
	            focus_state = 1;
	        }
	    }
	}

	// changing global.gpspeed to the new value
	global.gpspeed = new_gpspeed;

	// if the new global.gpspeed isn't 0 :
	if (global.gpspeed != 0) {
	    // player variable changes
	    with (obj_player) {
	        if (inv > 0) {
	            inv = round(inv * global.prev_gpspeed / global.gpspeed);
	        }
	        if (instance_exists(obj_evilflame_ultimate) && obj_evilflame_ultimate.inv > 0) {
	            obj_evilflame_ultimate.inv=round(obj_evilflame_ultimate.inv * global.prev_gpspeed / global.gpspeed);
	        }
	        if (xv != 0) {
	            xv *= global.gpspeed / global.prev_gpspeed;
	        }
	        if (yv != 0) {
	            yv *= global.gpspeed / global.prev_gpspeed;
	        }
	        hpmark_v *= global.gpspeed / global.prev_gpspeed;
	        if (instance_exists(obj_evilflame_ultimate)) {
	            obj_evilflame_ultimate.hpmark_v *= global.gpspeed / global.prev_gpspeed;
	        }
	    }

	    // repitch sounds
	    music_pitch(global.sound_gpspeed);
	    sfx_pitch(global.sound_gpspeed);

	    // knockback correction
	    with (all) {
	        if (object_is_ancestor(object_index,obj_knockback_physics)) {
	            if (ahkb != 0 && hkb != 0) {
	                var ahkb00 = ahkb;
	                var hkb00  = hkb;
	                var th00   = abs(hkb00 / ahkb00);
	                ahkb       = abs((hkb00 * (th00+1)) / (sqr(th00 * global.prev_gpspeed / global.gpspeed)+(th00 * global.prev_gpspeed / global.gpspeed)));
	                hkb        = abs(ahkb * (th00 * global.prev_gpspeed / global.gpspeed)) * sign(hkb00);
	            }
	            if (avkb != 0 && vkb != 0) {
	                var avkb00 = avkb;
	                var vkb00  = vkb;
	                var tv00   = abs(vkb00 / avkb00);
	                avkb       = abs((vkb00 * (tv00+1)) / (sqr(tv00 * global.prev_gpspeed / global.gpspeed)+(tv00 * global.prev_gpspeed / global.gpspeed)));
	                vkb        = abs(avkb * (tv00 * global.prev_gpspeed / global.gpspeed)) * sign(vkb00);
	            }
	            /*show_message(
	            'OBJECT: '+object_get_name(object_index)+
	            ';\nhkb00='+string(hkb00)+'; hkb='+string(hkb)+
	            ';\nahkb00='+string(ahkb00)+'; ahkb='+string(ahkb)+
	            ';\nth00='+string(th00)+'; th='+string(abs(hkb/ahkb))+
	            ';\nvkb00='+string(vkb00)+'; vkb='+string(vkb)+
	            ';\navkb00='+string(avkb00)+'; avkb='+string(avkb)+
	            ';\ntv00='+string(tv00)+'; tv='+string(abs(vkb/avkb))
	            );*/
	        }
	    }
	}


}
