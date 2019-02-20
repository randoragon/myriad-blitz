/// @description Fly Out

#region Fly out

if (start) {
    switch(stage) {
        case 0:
	        if (y <= CANVAS_YMID - 100) {
				stage = 1;
	        }
        break;
        case 1:
	        if (y < CANVAS_YMID - 100) {
				vspeed += 4;
	        } else {
		        vspeed = 0;
		        stage  = 2;
	        }
        break;
        case 2:
	        cycle		= min(360, cycle + 3);
	        text_alpha	= home(text_alpha, 1, 0.05, 0);
	        if (text_alpha == 1 && cycle == 360) {
		        obj_startup_loading.alarm[0] = 90;
		        stage = 3;
		        alarm[1] = 70;
	        }
        break;
        case 4:
	        image_alpha -= 0.05;
	        text_alpha  -= 0.05;
	        if (image_alpha <= 0) { instance_destroy(); }
        break;
    }
    
    image_scale(0.5 - (dsin(cycle) * 0.1), 0.5 + (dsin(cycle) * 0.1));
    if (stage != 3) {
        if (cycle < 360) {
			y -= (dsin(cycle) - dsin(cycle - 4 - (3 * (stage == 2)))) * 0.1 * sprite_get_height(sprite_index);
		}
        cycle = min(360, cycle + 4);
    }
}

#endregion