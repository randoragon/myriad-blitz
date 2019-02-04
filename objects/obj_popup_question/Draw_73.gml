/// @description GUI_SURFACE set
surface_set_target(GUI_SURFACE);

///draw content
if busy==start_busy {
screen_darken(image_xscale*(3-(gpspeed==0 or instance_exists(obj_slot_load)))/4); //basically it's 0.75, but it lowers to 0.5 if gpspeed==0 or slot_load exists
}
draw_self();
draw_set_align(fa_left,fa_middle);
draw_text_transformed(x-(210*image_xscale),y-(15*image_yscale),string_hash_to_newline(content),image_xscale*2,image_yscale*2,0);

///SURFACE RESET
surface_reset_target();

