/// @description scr_ParticlesUpdate()

// ultimate burst color
part_type_edit_lt(1, "color", c_white, global.color[global.chrsel]);

// create all varying data anew
switch (global.chrsel) {
    case 0:
        // update systems
        part_system_edit_lt(PART_SYSTEM_PLAYERTOP, 1, 0  , -1 );
        part_system_edit_lt(PART_SYSTEM_PLAYERBOT, 1, 42 , 84 );
        part_system_edit_ult(PART_SYSTEM_FRAG    , 1, 100, 500);
        part_system_edit_ult(PART_SYSTEM_CHARGE  , 1, 150, 250);
        part_system_edit_lt(PART_SYSTEM_ULTIMATE , 1, 0 , -1 );
        
        // evilflame thruster particles
        //global.player_part[1] = part_type_create_lt(part_square, 0, 18, 28);

        // evilflame fury thruster particles
        //global.player_part[2] = part_type_create_lt(part_star, 0, 18, 28);

        // evilflame frag particles
        //global.frag_part[0] = part_type_create_ult(part_square, 0);

        // evilflame charge frag ring particles
        //global.frag_part[1] = part_type_create_ult(part_square, 0);

        // evilflame fury frag particles
        //global.frag_part[2] = part_type_create_ult(part_star, 0);

        // evilflame charge particles
        //global.charge_part[0] = part_type_create_ult(part_square, 0);

        // evilflame fury charge particles
        //global.charge_part[1] = part_type_create_ult(part_star, 0);

        // dual clone particles
        //global.ultimate_part[0] = part_type_create_lt(part_square, 0, 18, 28);
    break;

    case 1:
        // update systems
        part_system_edit_lt(PART_SYSTEM_PLAYERTOP, 1, 0,   -1 );
        part_system_edit_lt(PART_SYSTEM_PLAYERBOT, 1, 0,   -1 );
        part_system_edit_ult(PART_SYSTEM_FRAG     , 1, 300, 500);
        part_system_edit_ult(PART_SYSTEM_CHARGE   , 1, 0,   -1 );
        part_system_edit_lt(PART_SYSTEM_ULTIMATE , 1, 0,   -1 );
        
        // emerald frag particles
        //global.frag_part[0] = part_type_create_ult(part_line, 0);
    break;
}