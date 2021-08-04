/// @description scrq_delete_slot();
function scrq_delete_slot() {

	play_sfx(sfx_slot_delete, 0);

	var prevpage      = obj_slot_load.page;
	var prevslotcount = array_length(obj_slot_load.slot)-1;

	with (obj_slot_load) {
	    file_delete(selection);
	    wipe(obj_slot);
	    wipe(button[0]);
	    wipe(button[1]);
	    wipe(button[2]);
	    wipe(button[3]);
	    instance_destroy();
	}

	instance_destroy();
	var newinstance = instance_create_layer(CANVAS_XMID, CANVAS_YMID, "Popups", obj_slot_load);
	newinstance.page = prevpage;

	if (ceil((prevslotcount - 1) / 6) - 1 < prevpage) {
	    newinstance.page--;
	}



}
