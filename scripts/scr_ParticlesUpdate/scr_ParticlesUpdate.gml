/// @description scr_ParticlesUpdate(from, to)
/// @param from
/// @param to

var from = argument[0];
var to   = argument[1];

// wipe evilflame's particles
if (from == PLAYER_EVILFLAME) {
	part_type_wipe_lt(PART_TYPE_P_EVILFLAME_THRUSTER);
}

// ultimate burst color
part_type_edit_lt(1, "color", c_white, global.color[global.chrsel]);

// update part system settings to match per-player needs
switch(to) {
    case PLAYER_EVILFLAME:
        part_system_edit_lt(PART_SYSTEM_PLAYERTOP, 1, 0, -1);
        part_system_edit_lt(PART_SYSTEM_PLAYERBOT, 1, 42, 84);
        part_system_edit_ult(PART_SYSTEM_FRAG, 1, 100, 500);
        part_system_edit_ult(PART_SYSTEM_CHARGE, 1, 150, 250);
        part_system_edit_lt(PART_SYSTEM_ULTIMATE, 1, 0, -1);
		part_system_edit_lt(PART_SYSTEM_MINION, 1, 0, -1);
    break;
    case PLAYER_EMERALD:
        part_system_edit_lt(PART_SYSTEM_PLAYERTOP, 1, 0, -1);
        part_system_edit_lt(PART_SYSTEM_PLAYERBOT, 1, 0, -1);
        part_system_edit_ult(PART_SYSTEM_FRAG, 1, 300, 500);
        part_system_edit_ult(PART_SYSTEM_CHARGE, 1, 0, -1);
        part_system_edit_lt(PART_SYSTEM_ULTIMATE, 1, 0, -1);
		part_system_edit_lt(PART_SYSTEM_MINION, 1, 0, -1);
    break;
	case PLAYER_DER_SCOOTOMIK:
        part_system_edit_lt(PART_SYSTEM_PLAYERTOP, 1, 0, -1);
        part_system_edit_lt(PART_SYSTEM_PLAYERBOT, 1, 0, -1);
        part_system_edit_ult(PART_SYSTEM_FRAG, 1, 0, 500);
        part_system_edit_ult(PART_SYSTEM_CHARGE, 1, 0, -1);
        part_system_edit_lt(PART_SYSTEM_ULTIMATE, 1, 0, -1);
		part_system_edit_lt(PART_SYSTEM_MINION, 1, 0, -1);
    break;
	case PLAYER_BOBILEUSZ:
		part_system_edit_lt(PART_SYSTEM_PLAYERTOP, 1, 0, -1);
        part_system_edit_lt(PART_SYSTEM_PLAYERBOT, 1, 0, -1);
        part_system_edit_ult(PART_SYSTEM_FRAG, 1, 300, 500);
        part_system_edit_ult(PART_SYSTEM_CHARGE, 1, 0, -1);
        part_system_edit_lt(PART_SYSTEM_ULTIMATE, 1, 0, -1);
		part_system_edit_lt(PART_SYSTEM_MINION, 1, 100, -1);
	break;
}