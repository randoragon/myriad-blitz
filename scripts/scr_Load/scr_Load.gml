/// @description scr_Load(slot_path, version)
/// @param slot_path
/// @param version
function scr_Load() {

	if (file_exists(argument[0])) {
		if (version_gt(argument[1], "1.1.1")) {
			var inst = instance_create_layer(0, 0, "Transition", obj_slot_loading);
			inst.fpath = argument[0];
		} else {
			var inst = instance_create_layer(0, 0, "Transition", obj_slot_loading_legacy);
			inst.fname = argument[0];
		}
	} else {
	    display_message("ERROR: file missing!", scrm_do_nothing);
	}


}
