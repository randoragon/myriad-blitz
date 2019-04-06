/// @description Draw Current Flow

#region Skip if loading

if (global.loading) { exit; }

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Draw current flow

var maxlength = sqrt(sqr(CANVAS_WIDTH) + sqr(CANVAS_HEIGHT));
gpu_set_alphatestref(0);
var xx, yy, yscale;
for(var i = 0; i < ceil(maxlength / 16); i++) {
    xx     = x + lengthdir_x(16 * i, image_angle - (rot * i));
    yy     = y + lengthdir_y(16 * i, image_angle - (rot * i));
    yscale = (size_growth * i / ceil(maxlength / 16)) + 1;
	
    if (xx < -24 * yscale && xx > CANVAS_XEND + (24 * yscale) && yy < -24 * yscale && yy > CANVAS_YEND + (24 * yscale)) {
        break;
    }
    draw_sprite_ext(sprite_index, image_index, xx, yy, 1, (image_yscale * yscale), image_angle - (rot * i), c_white, image_alpha);
}
gpu_set_alphatestref(254);

#endregion

#region Reset surface

surface_reset_target();

#endregion