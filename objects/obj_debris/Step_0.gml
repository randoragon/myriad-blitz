/// @description skip if loading
if global.loading==1 exit;

///event_inherited();
event_inherited();

///destroy condition
image_alpha-=0.08*gpspeed;

if x<sprite_xoffset-sprite_width or x>CANVAS_XEND+sprite_xoffset or y<sprite_yoffset-sprite_height or y>CANVAS_YEND+sprite_yoffset
or (image_alpha<=0 && (!ds_exists(afterimage_ds_grid,ds_type_grid) or ds_grid_get_max(afterimage_ds_grid,1,7,ds_grid_width(afterimage_ds_grid),7)<=0))
or custom_sprite==2 && !(global.shader_conditions>=4 && global.shader_conditions<=7) {
explode(x,y,1,-1);
instance_destroy();
}

