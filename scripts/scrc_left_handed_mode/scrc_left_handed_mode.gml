/// @description scrc_left_handed_mode()
function scrc_left_handed_mode() {

	global.left_handed_mode = toggle(global.left_handed_mode);

	if (global.left_handed_mode) {
	    KEYBIND_UP = ord("I");
	    KEYBIND_LEFT = ord("J");
	    KEYBIND_DOWN = ord("K");
	    KEYBIND_RIGHT = ord("L");
	    KEYBIND_SHOOT = vk_space;
	    KEYBIND_FOCUS = 222;
	    KEYBIND_ULTIMATE = ord("U");
		KEYBIND_CHARGE   = ord("N");
		KEYBIND_PAUSE    = ord("P");
	} else {
	    KEYBIND_UP = ord("W");
	    KEYBIND_LEFT = ord("A");
	    KEYBIND_DOWN = ord("S");
	    KEYBIND_RIGHT = ord("D");
	    KEYBIND_SHOOT = vk_space;
	    KEYBIND_FOCUS = vk_shift;
	    KEYBIND_ULTIMATE = ord("E");
		KEYBIND_CHARGE   = ord("C");
		KEYBIND_PAUSE    = ord("Q");
	}



}
