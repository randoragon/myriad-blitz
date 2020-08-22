/// @description scr_Save(slot_name);
/// @param slot_name
function scr_Save() {

	with (instance_create_layer(0, 0, "Transition", obj_slot_saving)) {
	    slotname = argument[0];
	}


}
