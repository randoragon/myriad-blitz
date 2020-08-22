/// @description instance_setup(image_index, image_speed, image_angle, image_alpha);
/// @param image_index
/// @param image_speed
/// @param image_angle
/// @param image_alpha
function instance_setup() {

	switch (argument_count) {
		case 0: image_speed = 0; if (object_is_ancestor(object_index, obj_prev_imgspd)) { prev_image_speed = 0; } break;
		case 1: image_index = argument[0]; image_speed = 0; if (object_is_ancestor(object_index, obj_prev_imgspd)) { prev_image_speed = 0; } break;
		case 2: image_index = argument[0]; image_speed = argument[1]; if (object_is_ancestor(object_index, obj_prev_imgspd)) { prev_image_speed = argument[1]; } break
		case 3: image_index = argument[0]; image_speed = argument[1]; image_angle = argument[2]; if (object_is_ancestor(object_index, obj_prev_imgspd)) { prev_image_speed = argument[1]; } break;
		case 4: image_index = argument[0]; image_speed = argument[1]; image_angle = argument[2]; image_alpha = argument[3]; if (object_is_ancestor(object_index, obj_prev_imgspd)) { prev_image_speed = argument[1]; } break;
	}




}
