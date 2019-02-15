/// @description Spawn Slot (+)

#region Go to next spawn slot

if (spawncount < 6) {
	spawncount++;
	
	var xshift = 300;
	var yshift = 115;
	switch (spawncount) {
		case 1: xx = x - (0.5 * xshift); yy = y - 213 + (1 * yshift); break;
		case 2: xx = x + (0.5 * xshift); yy = y - 213 + (1 * yshift); break;
		case 3: xx = x - (0.5 * xshift); yy = y - 213 + (2 * yshift); break;
		case 4: xx = x + (0.5 * xshift); yy = y - 213 + (2 * yshift); break;
		case 5: xx = x - (0.5 * xshift); yy = y - 213 + (3 * yshift); break;
		case 6: xx = x + (0.5 * xshift); yy = y - 213 + (3 * yshift); break;
	}
	with (instance_create(xx, yy, obj_slot)) {
		slotid      = working_directory+"slots\\"+other.slot[(other.page*6)+other.spawncount-1];
		name		= other.slotname   [(other.page * 6) + other.spawncount - 1];
		date		= other.slotdate   [(other.page * 6) + other.spawncount - 1];
		ver			= other.slotversion[(other.page * 6) + other.spawncount - 1];
		points		= other.slotpoints [(other.page * 6) + other.spawncount - 1];
		char		= other.slotchar   [(other.page * 6) + other.spawncount - 1];
		rlm         = other.slotrealm  [(other.page * 6) + other.spawncount - 1];
		image_blend = hsv(color_get_hue(global.color[char]), 150, 255);
	}
	alarm[1] = 2;
}

#endregion