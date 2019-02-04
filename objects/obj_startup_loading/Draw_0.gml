/// @description GENERAL_SURFACE set
surface_set_target(GENERAL_SURFACE);

///draw loading bar
if stage!=0
{
    progress=(
    (audio_group_load_progress(SFX)/100) //sfx loading
    +(image_index/(image_number-1)) //present animation
    )/2;
    
    draw_set_color(hsv(90,193+(32*dsin(cycle)),255));
    draw_rectangle(CANVAS_XMID-sprite_get_xoffset(spr_loading_bar)+14,550-sprite_get_yoffset(spr_loading_bar)+14,CANVAS_XMID-sprite_get_xoffset(spr_loading_bar)+14+(progress*998),550-sprite_get_yoffset(spr_loading_bar)+88,0);
    draw_sprite(spr_loading_bar,0,CANVAS_XMID,550);
    draw_sprite_ext(spr_loading_caption,0,CANVAS_XMID,550,0.5,0.5,0,c_white,1);
    if image_index>progress*(image_number-1) image_index=progress*(image_number-1);
    if image_index>=image_number-1 && image_speed>0 {image_speed=0; image_index=image_number-1; stage=5; alarm[2]=60;}
    draw_self();
}

///SURFACE RESET
surface_reset_target();

