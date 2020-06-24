/// @description Setup

#region Inherit parent event

global.busy++; // additionally because of overlay buttons
event_inherited();

#endregion

#region Setup

image_speed		= 0;
image_index		= 0;
keyboard_string = "";
slot[0]			= file_find_first(working_directory+"slots\\*mbslot",0);

if (slot[0] != "") {
    button[0] = instance_create_depth_f(x - 250, y + 218, depth - 1, obj_button, 19);
    button[1] = instance_create_depth_f(x - 196, y + 218, depth - 1, obj_button, 20);
    button[2] = instance_create_depth_f(x - 100, y + 210, depth - 1, obj_button, 17);
    button[3] = instance_create_depth_f(x + 100, y + 210, depth - 1, obj_button, 18);
    
    do {
        slotcount++;
        slot[slotcount] = file_find_next();
    }
    until (slot[slotcount] == "");
    
    var f, data, datatype;
    for(var i = 0; i < slotcount; i++) {
        f = file_text_open_read(working_directory + "slots\\" + slot[i]);
        file_text_readln(f); // skip disclaimer
        slotname[i] = file_text_readbit(f);
        slotdate[i] = file_text_readbit(f);
        
		/* Only slot name and datetime are stored unencrypted in the save file.
		 * Thus, to extract information about slot version, character, points and realm
		 * we need to decrypt part of the slot file. Fortunately, all of these
		 * are guaranteed to be stored within the first line of the file.
		 */
        data[0]		   = flip_decode(file_text_readbit(f), slotdate[i]);
		datatype	   = string_readln(data, ";");
		if (datatype == "1.1.0" || datatype == "1.1.1") {
			// Slot comes from old versions before SAVE_DATA types were a thing
			slotversion[i] = datatype;
			slotchar[i]    = CHRCOUNT;
	        slotchar[i]    = string_readln_real(data, ";");
	        slotpoints[i]  = 0;
	        slotpoints[i]  = string_readln_real(data, ";");
	        slotrealm[i]   = RLMCOUNT;
	        slotrealm[i]   = string_readln_real(data, ";");
		} else if (datatype != string(SAVE_DATA_GLOBALS)) {
			slotversion[i] = "ERROR";
	        slotchar[i]    = CHRCOUNT;
	        slotpoints[i]  = 0;
	        slotrealm[i]   = RLMCOUNT;
		} else {
	        slotversion[i] = string_readln(data, ";");
	        slotchar[i]    = CHRCOUNT;
	        slotchar[i]    = string_readln_real(data, ";");
	        slotpoints[i]  = 0;
	        slotpoints[i]  = string_readln_real(data, ";");
	        slotrealm[i]   = RLMCOUNT;
	        slotrealm[i]   = string_readln_real(data, ";");
		}
        file_text_close(f);
    }
    spawncount = 7;
    alarm[0]   = 1;
}

#endregion