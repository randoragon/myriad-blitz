#region Miscellaneous Setup

gml_release_mode(false);
window_last_width  = window_get_width();
window_last_height = window_get_height();
global.general_surface = -1;
global.gui_surface     = -1;
global.close_game	   = FALSE;
application_surface_enable(0);
window_set_cursor(cr_none);
math_set_epsilon(0.0001);
audio_channel_num(32);
global.kill_count    = 0;
global.loading       = FALSE;
global.fullscreen    = 1;
global.screenshake   = 1;
global.points        = 0;
global.music[0]      = -1;
global.sfx[0]        = -1;
global.spawnrate     = 10;
global.gpspeed       = 1;
global.sound_gpspeed = global.gpspeed;
global.prev_gpspeed  = global.gpspeed;
global.gpstep        = 1;
global.busy          = 0;
global.realm         = 0;
global.gptime        = 0;
global.gpspeed_focus               = 1;
global.gpspeed_ultimate_activation = 1;
global.gpspeed_ultimate            = 1;
global.gpspeed_state               = 1;
global.state             = 0;
global.viewxstartpos     = 0;
global.viewystartpos     = 0;
global.shader_conditions = 0;
global.chrsel			 = 0;
scr_PlayerDataUpdate(global.chrsel);
global.color = array_setup(c_white, CHRCOUNT);
global.color[0] = c_aqua;
global.color[1] = hsv(110, 255, 255);
global.color[2] = hsv(40, 60, 200);
global.name     = array_setup("<failed to fetch name>", CHRCOUNT);
global.name[0]  = "Evilflame";
global.name[1]  = "Emerald~";
global.name[2]  = "Der Scootomik";
global.transition     = 0;
global.realm_name[1]  = "Christmas Realm";
global.realm_name[0]  = "Menu";
global.background_sprite       = array_setup(noone, 8);
global.background_sprite_index = array_setup(0,     8);
global.background_image_speed  = array_setup(0,     8);
global.background_x            = array_setup(0,     8);
global.background_y            = array_setup(0,     8);
global.background_htiled       = array_setup(FALSE, 8);
global.background_vtiled	   = array_setup(FALSE, 8);
global.background_hspeed	   = array_setup(0,     8);
global.background_vspeed	   = array_setup(0,     8);
global.enemy_details_selection = noone;
global.player_status_effects   = -1;

global.save_chunk_size  = 500;
global.save_particles   = 1;
global.left_handed_mode = 0;
global.keybind[0]	    = ord("W"); // move upwards
global.keybind[1]       = ord("A"); // move left
global.keybind[2]       = ord("S"); // move downwards
global.keybind[3]       = ord("D"); // move right
global.keybind[4]       = vk_space; // shoot
global.keybind[5]       = vk_shift; // focus
global.keybind[6]       = ord("E"); // ultimate
	
#endregion

#region Global Particles Setup

global.part_type_pro_grid = array_setup(-1, 2);
global.part_type_pro_grid[0] = ds_grid_create(1, 31);
ds_grid_set(global.part_type_pro_grid[0], 0, 0, -1);
global.part_type_lt_grid = array_setup(-1, 2);
global.part_type_lt_grid[0] = ds_grid_create(1, 21);
ds_grid_set(global.part_type_lt_grid[0], 0, 0, -1);
global.part_type_ult_grid = array_setup(-1, 2);
global.part_type_ult_grid[0] = ds_grid_create(1, 12);
ds_grid_set(global.part_type_ult_grid[0], 0, 0, -1);
global.part_system = array_setup(-1, 7);
global.player_part = array_setup(-1, 1);
global.indicator_part = array_setup(-1, 3);
global.frag_part = array_setup(-1, 2);
global.charge_part = array_setup(-1, 1);
global.ultimate_part = array_setup(-1, 1);
global.enemy_part = array_setup(-1, 1);

// DISPERSE PARTICLES
global.disperse_part = part_type_setup_lt(part_square, 0, 30, 30);
var part = global.disperse_part;
part_type_size_orientation_lt(part, 0.1, 0.12, -0.0036, 0, 360, 3, 1);
part_type_direction_speed_lt(part, 0, 360, 1, 2, -0.02);
part_type_blend_color_alpha_lt(part, bm_normal, c_white, c_white, 1, 1);


PART_SYSTEM_PLAYERTOP = part_system_create_lt(1, 0);
// ultimate burst particles
global.player_part[0] = part_type_setup_lt(part_star, 0, 60, 60);
part = global.player_part[0];
part_type_size_orientation_lt(part, 0.3, 0.6, -0.005, 0, 360, 4, 1);
part_type_direction_speed_lt(part, 0, 360, 3, 4, -0.06);
part_type_blend_color_alpha_lt(part, bm_add, c_white, c_white, 0.8, 0);

PART_SYSTEM_PLAYERBOT = part_system_create_lt(1, 42, 42);

PART_SYSTEM_FRAG = part_system_create_ult(1, 100, 500);

PART_SYSTEM_CHARGE = part_system_create_ult(1, 150, 250);

PART_SYSTEM_ULTIMATE = part_system_create_lt(1, 42);

PART_SYSTEM_DAMAGE_INDICATORS = part_system_create_pro(1, 20, 250);
var size;
// importance 1 indicators
global.indicator_part[0] = part_type_setup_pro(part_ascii, 0, 0, 20, 20);
part = global.indicator_part[0];
size = max(sprite_get_width(part_ascii), sprite_get_height(part_ascii));
part_type_size_orientation_pro(part, 2*size, 2*size, 0, 0, 0, 0, 0, 0, 0);
part_type_direction_speed_pro(part, 0, 0, 0, 0, 0, 0, 0, 0);
part_type_blend_color_alpha_pro(part, bm_normal, rgb(255, 85, 0), c_red, 1, 1);
part_type_gravity_pro(part, 4, -0.4, 90, 90);
// importance 2 indicators
global.indicator_part[1] = part_type_setup_pro(part_ascii, 0, 0, 40, 40);
part = global.indicator_part[1];
part_type_size_orientation_pro(part, 4*size, 4*size, -size/20, 0, -10, 10, 0, 0, 0);
part_type_direction_speed_pro(part, 270, 270, 0, 0, 0, 0, 0, 0.5);
part_type_blend_color_alpha_pro(part, bm_normal, rgb(255, 170, 0), c_red, 1, 1);
// importance 3 indicators
global.indicator_part[2] = part_type_setup_pro(part_ascii, 0, 0, 70, 80);
part = global.indicator_part[2];
part_type_size_orientation_pro(part, 5*size, 5*size, -size/40, 10, 40, 40, -0.5, 0, 0);
part_type_direction_speed_pro(part, 268, 272, 0, 1, 2, 2, 0, 0);
part_type_blend_color_alpha_pro(part, bm_normal, rgb(255, 255, 0), c_red, 1, 1);
part_type_gravity_pro(part, 0, 0.05, 90, 90);

// ENEMY PARTICLES
PART_SYSTEM_ENEMY = part_system_create_lt(1, 30, 100);
// ultimate loot particles
global.enemy_part[0] = part_type_setup_lt(part_star, 0, 30, 30);
part = global.enemy_part[0];
part_type_size_orientation_lt(part, 0.3, 0.5, 0, 0, 360, 3, 1);
part_type_direction_speed_lt(part, 0, 360, 0.2, 0.5, 0);
part_type_blend_color_alpha_lt(part, bm_add, c_white, c_white, 0.5, 0);

#endregion

#region Depth Hierarchy

global.object_layer = ds_map_create();
layer_set_target_room(rm_Main);

// Particle Drawers
global.object_layer[? obj_damage_indicators]  = layer_get_id("Indicators");
global.object_layer[? obj_player_tparticles]  = layer_get_id("PlayerTopParticles");
global.object_layer[? obj_player_bparticles]  = layer_get_id("PlayerBotParticles");
global.object_layer[? obj_ultimate_particles] = layer_get_id("UltimateBurstParticles");
global.object_layer[? obj_charge_particles]   = layer_get_id("ChargeParticles");
global.object_layer[? obj_enemy_particles]    = layer_get_id("EnemyParticles");
global.object_layer[? obj_frag_particles]     = layer_get_id("FragParticles");

// Entities
global.object_layer[? obj_player]	   = layer_get_id("Player");
global.object_layer[? obj_wrap_helper] = layer_get_id("PlayerUnderlay");
global.object_layer[? obj_projectile]  = layer_get_id("PlayerProjectiles");
global.object_layer[? obj_frag]		   = layer_get_id("Frags");
global.object_layer[? obj_charge]	   = layer_get_id("Charge");
// -> ultimates
global.object_layer[? obj_evilflame_ultimate]		= layer_get_id("PlayerUnderlay");
global.object_layer[? obj_emerald_ultimate]			= layer_get_id("UnderlayEffects1");
global.object_layer[? obj_emerald_ultimate_flow]	= layer_get_id("UnderlayEffects0");
global.object_layer[? obj_emerald_ultimate_force]   = layer_get_id("OverlayEffects0");
// <- end of ultimates
global.object_layer[? obj_enemy]	   = layer_get_id("Enemies");
global.object_layer[? obj_eprojectile] = layer_get_id("EnemyProjectiles");

// FX
global.object_layer[? obj_ultimate_activation] = layer_get_id("UltimateActivation");
global.object_layer[? obj_screenflash]		   = layer_get_id("ScreenFlash");
global.object_layer[? obj_shockwave]		   = layer_get_id("Explosions");
global.object_layer[? obj_oscillator]		   = layer_get_id("Player");

// collectibles
global.object_layer[? obj_present]		   = layer_get_id("Collectibles");
global.object_layer[? obj_ultimate_pickup] = layer_get_id("UltimateBurstParticles");

// decorations
global.object_layer[? obj_explosion] = layer_get_id("Explosions");
global.object_layer[? obj_debris]    = layer_get_id("Debris");

layer_reset_target_room();
/*
enum gui_depth {
    // Misc GUI
    popup = -6, 
    back_button = -4, 
    settings_checkbox = -4, 
    pause_menu = -4, 
    pause_button = -3, 
    
    // rm_Realms GUI
    slot_name = -5, 
    slot = -2, 
    slot_load_button = -2, 
    slot_load = -1, 
    realm_button = 0, 
    
    // rm_Main GUI
    statboard = -4, 
    keyboard = -3,
    lore = -3, 
    main_arrow = -3, 
    
    // Gameplay Overlays
    ultimate_text = -1, 
    damage_indicators = 0
}

enum general_depth {
    // Gameplay
    ultimate_pickup = -6, 
    emerald_ultimate_flow_top = -5, 
    projectile = -4, 
    scootomik_ultimate = -3, 
    scootomik_ultimate_particles = -2, 
    player_tparticles = -1, // also particles for projectiles
    player = 0, // also draws hp_bar in Draw_End
    wrap_helper = 1, 
    player_bparticles = 2, 
    evilflame_ultimate_particles = 2, 
    emerald_ultimate_particles = 2, 
    eprojectile = 3, 
    charge = 4, 
    charge_particles = 5, 
    enemy_particles = 6, 
    enemy = 7, // also draws hp_bar in Draw_End
    frag = 8, 
    frag_particles = 9, 
    present = 10, 
    explosion = 11, 
    debris = 12, 
    emerald_ultimate_center = 13, 
    emerald_ultimate_flow_bottom = 14
}
*/
#endregion

#region Sound Hierarchy

enum sound_priority {
    music = 100, 
    
    // gameplay sfx
    player_death = 10, 
    emerald_ultimate_loop = 9, 
    scootomik_ultimate_loop = 9, 
    player_charge_shot = 8, 
    ultimate_activation = 7, 
    player_hurt = 6, 
    explosion = 5, 
    player_charging = 4, 
    enemy_shoot = 3, 
    player_shoot = 2, 
    player_bullet_hit = 1, 
    player_frag_hit = 0, 
}

#endregion

#region Save Index Map

global.save_index = ds_map_create();
global.save_name  = ds_map_create();
global.save_index[? "boss"]                       = 0;
global.save_name [? 0 ]                           = "boss";
global.save_index[? "obj_damage_indicators"]      = 1;
global.save_name [? 1 ]	                          = "obj_damage_indicators";
global.save_index[? "obj_player_tparticles"]      = 2;
global.save_name [? 2 ]	                          = "obj_player_tparticles";
global.save_index[? "obj_player_bparticles"]      = 3;
global.save_name [? 3 ]	                          = "obj_player_bparticles";
global.save_index[? "obj_ultimate_particles"]     = 4;
global.save_name [? 4 ]	                          = "obj_ultimate_particles";
global.save_index[? "obj_charge_particles"]       = 5;
global.save_name [? 5 ]	                          = "obj_charge_particles";
global.save_index[? "obj_enemy_particles"]        = 6;
global.save_name [? 6 ]	                          = "obj_enemy_particles";
global.save_index[? "obj_frag_particles"]         = 7;
global.save_name [? 7 ]	                          = "obj_frag_particles";
global.save_index[? "obj_player"]				  = 8;
global.save_name [? 8 ]	                          = "obj_player";
global.save_index[? "obj_wrap_helper"]            = 9;
global.save_name [? 9 ]	                          = "obj_wrap_helper";
global.save_index[? "obj_projectile"]             = 10;
global.save_name [? 10]	                          = "obj_projectile";
global.save_index[? "obj_frag"]                   = 11;
global.save_name [? 11]	                          = "obj_frag";
global.save_index[? "obj_charge"]                 = 12;
global.save_name [? 12]	                          = "obj_charge";
global.save_index[? "obj_evilflame_ultimate"]     = 13;
global.save_name [? 13]	                          = "obj_evilflame_ultimate";
global.save_index[? "obj_emerald_ultimate"]       = 14;
global.save_name [? 14]	                          = "obj_emerald_ultimate";
global.save_index[? "obj_emerald_ultimate_flow"]  = 15;
global.save_name [? 15]	                          = "obj_emerald_ultimate_flow";
global.save_index[? "obj_emerald_ultimate_force"] = 16;
global.save_name [? 16]	                          = "obj_emerald_ultimate_force";
global.save_index[? "obj_enemy"]              = 17;
global.save_name [? 17]	                          = "obj_enemy";
global.save_index[? "obj_eprojectile"]            = 18;
global.save_name [? 18]	                          = "obj_eprojectile";
global.save_index[? "obj_oscillator"]             = 19;
global.save_name [? 19]	                          = "obj_oscillator";
global.save_index[? "obj_screenshake"]            = 20;
global.save_name [? 20]	                          = "obj_screenshake";
global.save_index[? "obj_ultimate_activation"]    = 22;
global.save_name [? 22]	                          = "obj_ultimate_activation";
global.save_index[? "obj_screenflash"]            = 23;
global.save_name [? 23]	                          = "obj_screenflash";
global.save_index[? "obj_shockwave"]              = 24;
global.save_name [? 24]	                          = "obj_shockwave";
global.save_index[? "obj_present"]                = 48;
global.save_name [? 48]	                          = "obj_present";
global.save_index[? "obj_ultimate_pickup"]        = 49;
global.save_name [? 49]	                          = "obj_ultimate_pickup";
global.save_index[? "obj_explosion"]              = 50;
global.save_name [? 50]	                          = "obj_explosion";
global.save_index[? "obj_debris"]                 = 53;
global.save_name [? 53]	                          = "obj_debris";

#endregion

#region Fetch Shader Uniform Data

global.shd_sprite_effect_uni = ds_list_create();
ds_list_add(global.shd_sprite_effect_uni, 
	shader_get_uniform(shd_sprite_effect, "u_gpspeed"), 
	shader_get_uniform(shd_sprite_effect, "u_gptime"), 
	shader_get_uniform(shd_sprite_effect, "u_contrastIntensity"), 
	shader_get_uniform(shd_sprite_effect, "u_minColorAvg"), 
	shader_get_uniform(shd_sprite_effect, "u_maxColorAvg"), 
	shader_get_uniform(shd_sprite_effect, "u_desaturationIntensity"), 
	shader_get_uniform(shd_sprite_effect, "u_brightnessIntensity"), 
	shader_get_uniform(shd_sprite_effect, "u_flickerInterval"), 
);

global.shd_background_effect_uni = ds_list_create();
ds_list_add(global.shd_background_effect_uni, 
	shader_get_uniform(shd_background_effect, "u_blendIntensity"), 
	shader_get_uniform(shd_background_effect, "u_colorBlend"), 
	shader_get_uniform(shd_background_effect, "u_gptime"), 
	shader_get_uniform(shd_background_effect, "u_contrastIntensity"), 
	shader_get_uniform(shd_background_effect, "u_desaturationIntensity"), 
	shader_get_uniform(shd_background_effect, "u_brightnessIntensity")
);

global.shd_application_surface_effect_uni = ds_list_create();
ds_list_add(global.shd_application_surface_effect_uni, 
	shader_get_uniform(shd_application_surface_effect, "u_waveAmplitude"), 
	shader_get_uniform(shd_application_surface_effect, "u_waveClock"), 
	shader_get_uniform(shd_application_surface_effect, "u_wavingSpeed"), 
	shader_get_uniform(shd_application_surface_effect, "u_waveLength"), 
	shader_get_uniform(shd_application_surface_effect, "u_blendIntensity"), 
	shader_get_uniform(shd_application_surface_effect, "u_colorBlend"), 
	shader_get_uniform(shd_application_surface_effect, "u_gptime"), 
	shader_get_uniform(shd_application_surface_effect, "u_contrastIntensity"), 
	shader_get_uniform(shd_application_surface_effect, "u_desaturationIntensity"), 
	shader_get_uniform(shd_application_surface_effect, "u_brightnessIntensity"), 
	shader_get_uniform(shd_application_surface_effect, "u_velocityLines")
);

global.shd_shine_uni = ds_list_create();
ds_list_add(global.shd_shine_uni, 
	shader_get_uniform(shd_shine, "time"), 
	shader_get_uniform(shd_shine, "size"), 
	shader_get_uniform(shd_shine, "suf_size"), 
	shader_get_uniform(shd_shine, "color_blend"), 
	shader_get_uniform(shd_shine, "pixel_size"), 
	shader_get_uniform(shd_shine, "whitelist_box")
);

#endregion