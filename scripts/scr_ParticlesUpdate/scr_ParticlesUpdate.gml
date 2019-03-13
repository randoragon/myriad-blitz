/// @description scr_ParticlesUpdate()

// remove all varying data
for (var i = 1; i < array_length_1d(global.player_part); i++) {
    if (part_type_exists_lt(global.player_part[i])) {
        part_type_remove_lt(global.player_part[i]);
        for (var j = 0; j < array_length_1d(global.part_system); j++) { part_type_wipe_lt(global.player_part[i], global.part_system[j]); }
        global.player_part[i] = -1;
    }
}
for (var i = 0; i < array_length_1d(global.frag_part); i++) {
    if (part_type_exists_ult(global.frag_part[i])) {
        part_type_remove_ult(global.frag_part[i]);
        for (var j = 0; j < array_length_1d(global.part_system); j++) { part_type_wipe_ult(global.frag_part[i], global.part_system[j]); }
        global.frag_part[i] = -1;
    }
}
for (var i = 0; i < array_length_1d(global.charge_part); i++) {
    if (part_type_exists_ult(global.charge_part[i])) {
        part_type_remove_ult(global.charge_part[i]);
        for (var j = 0; j < array_length_1d(global.part_system); j++) { part_type_wipe_ult(global.charge_part[i], global.part_system[j]); }
        global.charge_part[i] = -1;
    }
}
for (var i = 0; i < array_length_1d(global.ultimate_part); i++) {
    if (part_type_exists_lt(global.ultimate_part[i])) {
        part_type_remove_lt(global.ultimate_part[i]);
        for (var j = 0; j < array_length_1d(global.part_system); j++) { part_type_wipe_lt(global.ultimate_part[i], global.part_system[j]); }
        global.ultimate_part[i] = -1;
    }
}

// ultimate burst color
part_type_edit_lt(global.player_part[0], "color", c_white, global.color[global.chrsel]);

// create all varying data anew
var part;
switch (global.chrsel) {
    case 0:
        // update systems
        part_system_edit_lt(global.part_system[5],  1, 0,   -1);  // PLAYER   PARTICLES (top)
        part_system_edit_lt(global.part_system[0],  1, 42,  42);  // PLAYER   PARTICLES (bottom)
        part_system_edit_ult(global.part_system[2], 1, 100, 500); // FRAG     PARTICLES
        part_system_edit_ult(global.part_system[3], 1, 150, 250); // CHARGE   PARTICLES
        part_system_edit_lt(global.part_system[6],  1, 42,  -1);  // ULTIMATE PARTICLES
        
        // evilflame thruster particles
        global.player_part[1] = part_type_setup_lt(part_square, 0, 18, 28);
        part = global.player_part[1];
        part_type_size_orientation_lt(part, 0.15, 0.25, -0.008, 0, 0, 0, 0);
        part_type_direction_speed_lt(part, 170, 190, 7, 11, 0);
        part_type_blend_color_alpha_lt(part, bm_add, rgb(255, 140, 0), rgb(255, 140, 0), 0.7, 0.7);

        // evilflame fury thruster particles
        global.player_part[2] = part_type_setup_lt(part_star, 0, 18, 28);
        part = global.player_part[2];
        part_type_size_orientation_lt(part, 0.3, 0.5, -0.02, 0, 0, 0, 0);
        part_type_direction_speed_lt(part, 170, 190, 7, 11, 0);
        part_type_blend_color_alpha_lt(part, bm_add, c_white, rgb(83, 0, 255), 0.7, 0.7);

        // evilflame frag particles
        global.frag_part[0] = part_type_setup_ult(part_square, 0);
        part = global.frag_part[0];
        part_type_size_orientation_ult(part, 0.04, 0.04, -0.02, 0, 0, 0);
        part_type_blend_color_alpha_ult(part, bm_add, rgb(255, 140, 0), 0.7, 0);

        // evilflame charge frag ring particles
        global.frag_part[1] = part_type_setup_ult(part_square, 0);
        part = global.frag_part[1];
        part_type_size_orientation_ult(part, 0.05, 0.06, -0.005, 0, 0, 0);
        part_type_blend_color_alpha_ult(part, bm_add, rgb(255, 140, 0), 0.7, 0);

        // evilflame fury frag particles
        global.frag_part[2] = part_type_setup_ult(part_star, 0);
        part = global.frag_part[2];
        part_type_size_orientation_ult(part, 0.25, 0.35, -0.035, 0, 0, 0);
        part_type_blend_color_alpha_ult(part, bm_add, rgb(175, 100, 255), 0.6, -0.15);

        // evilflame charge particles
        global.charge_part[0] = part_type_setup_ult(part_square, 0);
        part = global.charge_part[0];
        part_type_size_orientation_ult(part, 0.2, 0.35, -0.007, 0, 0, 0);
        part_type_blend_color_alpha_ult(part, bm_add, rgb(255, 140, 0), 0.7, 0);

        // evilflame fury charge particles
        global.charge_part[1] = part_type_setup_ult(part_star, 0);
        part = global.charge_part[1];
        part_type_size_orientation_ult(part, 0.3, 0.4, -0.01, 0, 0, 0);
        part_type_blend_color_alpha_ult(part, bm_add, rgb(200, 145, 255), 0.6, -0.02);

        // dual clone particles
        global.ultimate_part[0] = part_type_setup_lt(part_square, 0, 18, 28);
        part = global.ultimate_part[0];
        part_type_size_orientation_lt(part, 0.15, 0.25, -0.008, 0, 0, 0, 0);
        part_type_direction_speed_lt(part, 170, 190, 7, 11, 0);
        part_type_blend_color_alpha_lt(part, bm_add, rgb(255, 140, 0), rgb(255, 140, 0), 0.7, 0.7);
    break;

    case 1:
        // update systems
        part_system_edit_lt(global.part_system[5],  1, 0,   -1);  // PLAYER   PARTICLES (top)
        part_system_edit_lt(global.part_system[0],  1, 0,   -1);  // PLAYER   PARTICLES (bottom)
        part_system_edit_ult(global.part_system[2], 1, 300, 500); // FRAG     PARTICLES
        part_system_edit_ult(global.part_system[3], 1, 0,   -1);  // CHARGE   PARTICLES
        part_system_edit_lt(global.part_system[6],  1, 0,   -1);  // ULTIMATE PARTICLES
        
        // emerald frag particles
        global.frag_part[0] = part_type_setup_ult(part_line, 0);
        part = global.frag_part[0];
        part_type_size_orientation_ult(part, 0.3, 0.3, -0.0625, 0, 0, 0);
        part_type_blend_color_alpha_ult(part, bm_normal, rgb(0, 255, 132), 1, 0);
    break;
}