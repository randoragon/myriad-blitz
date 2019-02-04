/// @description skip if loading
if global.loading==1 exit;

///event_inherited();
event_inherited();

///destroy condition

if image_index+image_speed>=image_number instance_destroy();

