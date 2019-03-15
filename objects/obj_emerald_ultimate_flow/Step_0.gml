/// @description Size & Misc

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region Size & misc

if (global.gpspeed != 0) {
    if (scale_stage == 0) {
        if (scale_v < 0.3 * global.gpspeed) {
            scale_v += 0.05 * sqr(global.gpspeed);
        } else {
            scale_stage = 1;
        }
    } else {
        if (scale_stage == 1) {
            scale_v -= 0.1 * sqr(global.gpspeed);
            if (image_xscale <= 1 * global.gpspeed) {
                scale_v = 0;
                image_scale(1, 1);
                scale_stage = 2;
            }
        } else {
            if (scale_stage == 3) {
                scale_v -= 0.05 * sqr(global.gpspeed);
                if (image_xscale <= 0) {
                    instance_destroy();
                }
            }
        }
    }
    
    if (scale_stage != 2 && scale_v != 0) {
        image_scale(image_xscale + scale_v, image_yscale + scale_v);
    }
    image_angle += rot * global.gpspeed;

    clock -= global.gpspeed;
    if (clock <= 0) {
        scale_stage = 3;
    }
}

#endregion