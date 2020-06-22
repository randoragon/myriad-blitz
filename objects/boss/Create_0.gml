#region Miscellaneous Setup

gml_release_mode(false);
gpu_set_alphatestenable(1);
window_last_width  = window_get_width();
window_last_height = window_get_height();
global.general_surface = -1;
global.gui_surface     = -1;
global.close_game	   = FALSE;
application_surface_enable(0);
window_set_cursor(cr_none);
math_set_epsilon(0.0001);
ds_set_precision(math_get_epsilon());
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
global.transition       = 0;
global.save_chunk_size  = 500;
global.save_particles   = 1;
global.left_handed_mode = 0;
global.enemy_details_selection = noone;
global.player_status_effects   = -1;

#endregion

#region Keybinds

KEYBIND_UP	     = ord("W");
KEYBIND_LEFT     = ord("A");
KEYBIND_DOWN     = ord("S");
KEYBIND_RIGHT    = ord("D");
KEYBIND_SHOOT    = vk_space;
KEYBIND_FOCUS    = vk_shift;
KEYBIND_ULTIMATE = ord("E");

#endregion

#region Players Setup

global.chrsel = 0;
scr_PlayerDataUpdate(global.chrsel);
global.color = array_setup(c_white, CHRCOUNT);
global.color[0] = c_aqua;
global.color[1] = hsv(110, 255, 255);
global.color[2] = hsv(40, 60, 200);
global.color[3] = hsv(143, 230, 255);
global.name     = array_setup("<failed to fetch name>", CHRCOUNT);
global.name[0]  = "Evilflame";
global.name[1]  = "Emerald~";
global.name[2]  = "Der Scootomik";
global.name[3]  = "Bobileusz";

#endregion

#region Realms Setup

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
	
#endregion

#region Global Particles Setup

global.part_system = [];
global.part_type   = [];

global.part_type_pro_slots = -1;
global.part_type_lt_slots = -1;
global.part_type_ult_slots = -1;

// PARTICLE SYSTEMS
PART_SYSTEM_ULTIMATE		  = part_system_create_lt(1, 42);
PART_SYSTEM_PLAYERTOP		  = part_system_create_lt(1, 6);
PART_SYSTEM_PLAYERBOT		  = part_system_create_lt(1, 42, 42);
PART_SYSTEM_FRAG			  = part_system_create_ult(1, 100, 500);
PART_SYSTEM_CHARGE			  = part_system_create_ult(1, 150, 250);
PART_SYSTEM_DAMAGE_INDICATORS = part_system_create_pro(1, 20, 250);
PART_SYSTEM_ENEMY			  = part_system_create_lt(1, 30, 100);
PART_SYSTEM_MINION			  = part_system_create_lt(1, 100, 100);

// PARTICLE TYPES
// 0. disperse particles
global.part_type[0] = part_type_create_lt(part_square, 0, 30, 30);
var part = global.part_type[0];
part_type_size_orientation_lt(part, 0.1, 0.12, -0.0036, 0, 360, 3, 1);
part_type_direction_speed_lt(part, 0, 360, 1, 2, -0.02);
part_type_blend_color_alpha_lt(part, bm_normal, c_white, c_white, 1, 1);

// 1. ultimate burst particles
global.part_type[1] = part_type_create_lt(part_star, 0, 60, 60);
part = global.part_type[1];
part_type_size_orientation_lt(part, 0.3, 0.6, -0.005, 0, 360, 4, 1);
part_type_direction_speed_lt(part, 0, 360, 3, 4, -0.06);
part_type_blend_color_alpha_lt(part, bm_add, c_white, c_white, 0.8, 0);

// 2. importance 1 indicators
var size;
global.part_type[2] = part_type_create_pro(part_ascii, 0, 0, 20, 20);
part = global.part_type[2];
size = max(sprite_get_width(part_ascii), sprite_get_height(part_ascii));
part_type_size_orientation_pro(part, 2*size, 2*size, 0, 0, 0, 0, 0, 0, 0);
part_type_direction_speed_pro(part, 0, 0, 0, 0, 0, 0, 0, 0);
part_type_blend_color_alpha_pro(part, bm_normal, rgb(255, 85, 0), c_red, 1, 1);
part_type_gravity_pro(part, 4, -0.4, 90, 90);

// 3. importance 2 indicators
global.part_type[3] = part_type_create_pro(part_ascii, 0, 0, 40, 40);
part = global.part_type[3];
part_type_size_orientation_pro(part, 4*size, 4*size, -size/20, 0, -10, 10, 0, 0, 0);
part_type_direction_speed_pro(part, 270, 270, 0, 0, 0, 0, 0, 0.5);
part_type_blend_color_alpha_pro(part, bm_normal, rgb(255, 170, 0), c_red, 1, 1);

// 4. importance 3 indicators
global.part_type[4] = part_type_create_pro(part_ascii, 0, 0, 70, 80);
part = global.part_type[4];
part_type_size_orientation_pro(part, 5*size, 5*size, -size/40, 10, 40, 40, -0.5, 0, 0);
part_type_direction_speed_pro(part, 268, 272, 0, 1, 2, 2, 0, 0);
part_type_blend_color_alpha_pro(part, bm_normal, rgb(255, 255, 0), c_red, 1, 1);
part_type_gravity_pro(part, 0, 0.05, 90, 90);

// 5. enemy ultimate loot particles
global.part_type[5] = part_type_create_lt(part_star, 0, 30, 30);
part = global.part_type[5];
part_type_size_orientation_lt(part, 0.3, 0.5, 0, 0, 360, 3, 1);
part_type_direction_speed_lt(part, 0, 360, 0.2, 0.5, 0);
part_type_blend_color_alpha_lt(part, bm_add, c_white, c_white, 0.5, 0);

// 6. enemy gingerbread man superattack particles
global.part_type[6] = part_type_create_lt(part_line, 0, 30, 45);
part = global.part_type[6];
part_type_size_orientation_lt(part, 0.3, 0.5, -0.05, 0, 360, 3, 1);
part_type_direction_speed_lt(part, 0, 360, 2, 4, 0);
part_type_blend_color_alpha_lt(part, bm_add, $FFFF50, c_white, 0.75, 0);

// 7. evilflame thruster particles
global.part_type[7] = part_type_create_lt(part_square, 0, 18, 28);
part = global.part_type[7];
part_type_size_orientation_lt(part, 0.15, 0.25, -0.008, 0, 0, 0, 0);
part_type_direction_speed_lt(part, 170, 190, 7, 11, 0);
part_type_blend_color_alpha_lt(part, bm_add, rgb(255, 140, 0), rgb(255, 140, 0), 0.7, 0.7);

// 8. evilflame fury thruster particles
global.part_type[8] = part_type_create_lt(part_star, 0, 18, 28);
part = global.part_type[8];
part_type_size_orientation_lt(part, 0.3, 0.5, -0.02, 0, 0, 0, 0);
part_type_direction_speed_lt(part, 170, 190, 7, 11, 0);
part_type_blend_color_alpha_lt(part, bm_add, c_white, rgb(83, 0, 255), 0.7, 0.7);

// 9. evilflame frag particles
global.part_type[9] = part_type_create_ult(part_square, 0);
part = global.part_type[9];
part_type_size_orientation_ult(part, 0.04, 0.04, -0.02, 0, 0, 0);
part_type_blend_color_alpha_ult(part, bm_add, rgb(255, 140, 0), 0.7, 0);

// 10. evilflame charge frag ring particles
global.part_type[10] = part_type_create_ult(part_square, 0);
part = global.part_type[10];
part_type_size_orientation_ult(part, 0.05, 0.06, -0.005, 0, 0, 0);
part_type_blend_color_alpha_ult(part, bm_add, rgb(255, 140, 0), 0.7, 0);

// 11. evilflame fury frag particles
global.part_type[11] = part_type_create_ult(part_star, 0);
part = global.part_type[11];
part_type_size_orientation_ult(part, 0.25, 0.35, -0.035, 0, 0, 0);
part_type_blend_color_alpha_ult(part, bm_add, rgb(175, 100, 255), 0.6, -0.15);

// 12. evilflame charge particles
global.part_type[12] = part_type_create_ult(part_square, 0);
part = global.part_type[12];
part_type_size_orientation_ult(part, 0.2, 0.35, -0.007, 0, 0, 0);
part_type_blend_color_alpha_ult(part, bm_add, rgb(255, 140, 0), 0.7, 0);

// 13. evilflame fury charge particles
global.part_type[13] = part_type_create_ult(part_star, 0);
part = global.part_type[13];
part_type_size_orientation_ult(part, 0.3, 0.4, -0.01, 0, 0, 0);
part_type_blend_color_alpha_ult(part, bm_add, rgb(200, 145, 255), 0.6, -0.02);

// 14. evilflame dual clone thruster particles
global.part_type[14] = part_type_create_lt(part_square, 0, 18, 28);
part = global.part_type[14];
part_type_size_orientation_lt(part, 0.15, 0.25, -0.008, 0, 0, 0, 0);
part_type_direction_speed_lt(part, 170, 190, 7, 11, 0);
part_type_blend_color_alpha_lt(part, bm_add, rgb(255, 140, 0), rgb(255, 140, 0), 0.7, 0.7);

// 15. emerald frag particles
global.part_type[15] = part_type_create_ult(part_line, 0);
part = global.part_type[15];
part_type_size_orientation_ult(part, 0.3, 0.3, -0.0625, 0, 0, 0);
part_type_blend_color_alpha_ult(part, bm_normal, rgb(0, 255, 132), 1, 0);

// 16. bobileusz water particles
global.part_type[16] = part_type_create_lt(part_circle, 0, 15, 30);
part = global.part_type[16];
part_type_size_orientation_lt(part, 0.05, 0.1, -0.0015, 0, 0, 0, 0);
part_type_direction_speed_lt(part, 0, 360, 0, 0.4, 0);
part_type_blend_color_alpha_lt(part, bm_add, rgb(255, 255, 255), rgb(25, 165, 255), 1, 0.75);

// 17. bobileusz snowflake particles
global.part_type[17] = part_type_create_lt(part_snowflake, 0, 45, 60);
part = global.part_type[17];
part_type_size_orientation_lt(part, 0.3, 0.6, -0.005, 0, 360, 4, 1);
part_type_direction_speed_lt(part, 0, 360, 3, 4, -0.06);
part_type_blend_color_alpha_lt(part, bm_add, c_white, c_white, 0.8, 0);

// 18. bobileusz icicle particles
global.part_type[18] = part_type_create_ult(part_circle, 0, 3, 7);
part = global.part_type[18];
part_type_size_orientation_ult(part, 0.02, 0.03, -0.004, 0, 0, 0);
part_type_blend_color_alpha_ult(part, bm_normal, rgb(113, 129, 227), 1, 0.75);

#endregion

#region Realm (Common) Enemies Setup

global.realm_enemy_index	= array_setup(noone, RLMCOUNT + 1);
global.realm_enemy_index[1] = obj_enemy_christmas_rocket_elf;

// last value indexes an object ID past the last existing enemy!!!
var last_realm_enemy_count  = 5;
global.realm_enemy_index[2] = global.realm_enemy_index[1] + last_realm_enemy_count;

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
global.object_layer[? obj_minion_particles]   = layer_get_id("MinionParticles");

// Entities
global.object_layer[? obj_player]	   = layer_get_id("Player");
global.object_layer[? obj_wrap_helper] = layer_get_id("PlayerUnderlay");
global.object_layer[? obj_projectile]  = layer_get_id("PlayerProjectiles");
global.object_layer[? obj_frag]		   = layer_get_id("Frags");
global.object_layer[? obj_charge]	   = layer_get_id("Charge");
global.object_layer[? obj_minion]	   = layer_get_id("Minions");
// -> ultimates
global.object_layer[? obj_evilflame_ultimate]		= layer_get_id("PlayerUnderlay");
global.object_layer[? obj_emerald_ultimate]			= layer_get_id("UnderlayEffects1");
global.object_layer[? obj_emerald_ultimate_flow]	= layer_get_id("UnderlayEffects0");
global.object_layer[? obj_emerald_ultimate_force]   = layer_get_id("OverlayEffects0");
global.object_layer[? obj_bobileusz_ultimate]		= layer_get_id("Minions");
// <- end of ultimates
for (var i = 1; i < RLMCOUNT + 1; i++) {
	for (var j = global.realm_enemy_index[i]; j < global.realm_enemy_index[i + 1]; j++) {
		global.object_layer[? j]	   = layer_get_id("Enemies");
	}
}
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

#region Object Save Map

global.save_oindex = ds_map_create();
global.save_oname  = ds_map_create();
global.save_oindex[? "boss"]                                = 0;
global.save_oname [? 0 ]                                    = "boss";
global.save_oindex[? "obj_damage_indicators"]               = 1;
global.save_oname [? 1 ]                                    = "obj_damage_indicators";
global.save_oindex[? "obj_player_tparticles"]               = 2;
global.save_oname [? 2 ]                                    = "obj_player_tparticles";
global.save_oindex[? "obj_player_bparticles"]               = 3;
global.save_oname [? 3 ]                                    = "obj_player_bparticles";
global.save_oindex[? "obj_ultimate_particles"]              = 4;
global.save_oname [? 4 ]                                    = "obj_ultimate_particles";
global.save_oindex[? "obj_charge_particles"]                = 5;
global.save_oname [? 5 ]                                    = "obj_charge_particles";
global.save_oindex[? "obj_enemy_particles"]                 = 6;
global.save_oname [? 6 ]                                    = "obj_enemy_particles";
global.save_oindex[? "obj_frag_particles"]                  = 7;
global.save_oname [? 7 ]                                    = "obj_frag_particles";
global.save_oindex[? "obj_player"]                          = 8;
global.save_oname [? 8 ]                                    = "obj_player";
global.save_oindex[? "obj_wrap_helper"]                     = 9;
global.save_oname [? 9 ]                                    = "obj_wrap_helper";
global.save_oindex[? "obj_projectile"]                      = 10;
global.save_oname [? 10]                                    = "obj_projectile";
global.save_oindex[? "obj_frag"]                            = 11;
global.save_oname [? 11]                                    = "obj_frag";
global.save_oindex[? "obj_charge"]                          = 12;
global.save_oname [? 12]                                    = "obj_charge";
global.save_oindex[? "obj_evilflame_ultimate"]              = 13;
global.save_oname [? 13]                                    = "obj_evilflame_ultimate";
global.save_oindex[? "obj_emerald_ultimate"]                = 14;
global.save_oname [? 14]                                    = "obj_emerald_ultimate";
global.save_oindex[? "obj_emerald_ultimate_flow"]           = 15;
global.save_oname [? 15]                                    = "obj_emerald_ultimate_flow";
global.save_oindex[? "obj_emerald_ultimate_force"]          = 16;
global.save_oname [? 16]                                    = "obj_emerald_ultimate_force";
global.save_oindex[? "obj_enemy"]                           = 17;          // these two stay for backwards compatibility reasons
global.save_oname [? 17]                                    = "obj_enemy"; // these two stay for backwards compatibility reasons
global.save_oindex[? "obj_eprojectile"]                     = 18;
global.save_oname [? 18]                                    = "obj_eprojectile";
global.save_oindex[? "obj_oscillator"]                      = 19;
global.save_oname [? 19]                                    = "obj_oscillator";
global.save_oindex[? "obj_screenshake"]                     = 20;
global.save_oname [? 20]                                    = "obj_screenshake";
global.save_oindex[? "obj_minion"]				            = 21;
global.save_oname [? 21]                                    = "obj_minion";
global.save_oindex[? "obj_ultimate_activation"]             = 22;
global.save_oname [? 22]                                    = "obj_ultimate_activation";
global.save_oindex[? "obj_screenflash"]                     = 23;
global.save_oname [? 23]                                    = "obj_screenflash";
global.save_oindex[? "obj_shockwave"]                       = 24;
global.save_oname [? 24]                                    = "obj_shockwave";
global.save_oindex[? "obj_enemy_christmas_crow"]            = 25;
global.save_oname [? 25]                                    = "obj_enemy_christmas_crow";
global.save_oindex[? "obj_enemy_christmas_snowman"]         = 26;
global.save_oname [? 26]                                    = "obj_enemy_christmas_snowman";
global.save_oindex[? "obj_enemy_christmas_gingerbread_man"] = 27;
global.save_oname [? 27]                                    = "obj_enemy_christmas_gingerbread_man";
global.save_oindex[? "obj_enemy_christmas_reindeer"]        = 28;
global.save_oname [? 28]                                    = "obj_enemy_christmas_reindeer";
global.save_oindex[? "obj_enemy_christmas_rocket_elf"]      = 29;
global.save_oname [? 29]                                    = "obj_enemy_christmas_rocket_elf";
global.save_oindex[? "obj_bobileusz_ultimate"]				= 30;
global.save_oname [? 30]                                    = "obj_bobileusz_ultimate";
// 31-47
global.save_oindex[? "obj_present"]                         = 48;
global.save_oname [? 48]                                    = "obj_present";
global.save_oindex[? "obj_ultimate_pickup"]                 = 49;
global.save_oname [? 49]                                    = "obj_ultimate_pickup";
global.save_oindex[? "obj_explosion"]                       = 50;
global.save_oname [? 50]                                    = "obj_explosion";
// 51-52
global.save_oindex[? "obj_debris"]                          = 53;
global.save_oname [? 53]                                    = "obj_debris";

// Sanity check
var i = 0;
while (object_exists(i)) {
	if (object_is_ancestor(i, obj_save_group)) {
		var oname = object_get_name(i);
		if (!ds_map_exists(global.save_oindex, oname)) {
			show_debug_message("WARNING: object	name \"" + string(oname) + "\" (object_index=" + string(i) + ") not found in global.save_oindex!");
		}
	}
	i++;
}

#endregion

#region Save Sprite Map

global.save_sindex = ds_map_create();
global.save_sname  = ds_map_create();
global.save_sindex [? "none"]			                  = -1;
global.save_sname  [? -1]                                 = "none";
global.save_sindex [? "spr_evilflame"]                    = 0;
global.save_sname  [? 0]                                  = "spr_evilflame";
global.save_sindex [? "spr_emerald"]                      = 1;
global.save_sname  [? 1]                                  = "spr_emerald";
global.save_sindex [? "spr_scootomik"]                    = 2;
global.save_sname  [? 2]                                  = "spr_scootomik";
global.save_sindex [? "spr_evilflame_shooting"]           = 3;
global.save_sname  [? 3]                                  = "spr_evilflame_shooting";
global.save_sindex [? "spr_emerald_shooting"]             = 4;
global.save_sname  [? 4]                                  = "spr_emerald_shooting";
global.save_sindex [? "spr_scootomik_shooting"]           = 5;
global.save_sname  [? 5]                                  = "spr_scootomik_shooting";
global.save_sindex [? "spr_evilflame_charging"]           = 6;
global.save_sname  [? 6]                                  = "spr_evilflame_charging";
global.save_sindex [? "spr_emerald_charging"]             = 7;
global.save_sname  [? 7]                                  = "spr_emerald_charging";
global.save_sindex [? "spr_scootomik_charging"]           = 8;
global.save_sname  [? 8]                                  = "spr_scootomik_charging";
global.save_sindex [? "spr_evilflame_active_charge"]      = 9;
global.save_sname  [? 9]                                  = "spr_evilflame_active_charge";
global.save_sindex [? "spr_emerald_active_charge"]        = 10;
global.save_sname  [? 10]                                 = "spr_emerald_active_charge";
global.save_sindex [? "spr_scootomik_active_charge"]      = 11;
global.save_sname  [? 11]                                 = "spr_scootomik_active_charge";
global.save_sindex [? "spr_evilflame_hitbox"]             = 12;
global.save_sname  [? 12]                                 = "spr_evilflame_hitbox";
global.save_sindex [? "spr_emerald_hitbox"]               = 13;
global.save_sname  [? 13]                                 = "spr_emerald_hitbox";
global.save_sindex [? "spr_scootomik_hitbox"]             = 14;
global.save_sname  [? 14]                                 = "spr_scootomik_hitbox";
global.save_sindex [? "spr_evilflame_bullet"]             = 15;
global.save_sname  [? 15]                                 = "spr_evilflame_bullet";
global.save_sindex [? "spr_emerald_bullet"]               = 16;
global.save_sname  [? 16]                                 = "spr_emerald_bullet";
global.save_sindex [? "spr_scootomik_bullet"]             = 17;
global.save_sname  [? 17]                                 = "spr_scootomik_bullet";
global.save_sindex [? "spr_evilflame_frag"]               = 18;
global.save_sname  [? 18]                                 = "spr_evilflame_frag";
global.save_sindex [? "spr_emerald_frag"]                 = 19;
global.save_sname  [? 19]                                 = "spr_emerald_frag";
global.save_sindex [? "spr_scootomik_frag"]               = 20;
global.save_sname  [? 20]                                 = "spr_scootomik_frag";
global.save_sindex [? "spr_evilflame_charge"]             = 21;
global.save_sname  [? 21]                                 = "spr_evilflame_charge";
global.save_sindex [? "spr_emerald_charge"]               = 22;
global.save_sname  [? 22]                                 = "spr_emerald_charge";
global.save_sindex [? "spr_scootomik_charge"]             = 23;
global.save_sname  [? 23]                                 = "spr_scootomik_charge";
global.save_sindex [? "spr_evilflame_ultimate"]           = 24;
global.save_sname  [? 24]                                 = "spr_evilflame_ultimate";
global.save_sindex [? "spr_evilflame_ultimate_shooting"]  = 25;
global.save_sname  [? 25]                                 = "spr_evilflame_ultimate_shooting";
global.save_sindex [? "spr_evilflame_ultimate_charging"]  = 26;
global.save_sname  [? 26]                                 = "spr_evilflame_ultimate_charging";
global.save_sindex [? "spr_evilflame_fury"]               = 27;
global.save_sname  [? 27]                                 = "spr_evilflame_fury";
global.save_sindex [? "spr_evilflame_fury_shooting"]      = 28;
global.save_sname  [? 28]                                 = "spr_evilflame_fury_shooting";
global.save_sindex [? "spr_evilflame_fury_charging"]      = 29;
global.save_sname  [? 29]                                 = "spr_evilflame_fury_charging";
global.save_sindex [? "spr_evilflame_fury_charge_hitbox"] = 30;
global.save_sname  [? 30]                                 = "spr_evilflame_fury_charge_hitbox";
global.save_sindex [? "spr_emerald_ultimate_center"]      = 31;
global.save_sname  [? 31]                                 = "spr_emerald_ultimate_center";
global.save_sindex [? "spr_emerald_ultimate_flow"]        = 32;
global.save_sname  [? 32]                                 = "spr_emerald_ultimate_flow";
global.save_sindex [? "spr_scootomik_ultimate_overlay"]   = 33;
global.save_sname  [? 33]                                 = "spr_scootomik_ultimate_overlay";
global.save_sindex [? "spr_scootomik_ultimate_throttle"]  = 34;
global.save_sname  [? 34]                                 = "spr_scootomik_ultimate_throttle";
global.save_sindex [? "spr_rocket_elf"]                   = 35;
global.save_sname  [? 35]                                 = "spr_rocket_elf";
global.save_sindex [? "spr_snowman"]                      = 36;
global.save_sname  [? 36]                                 = "spr_snowman";
global.save_sindex [? "spr_crow"]                         = 37;
global.save_sname  [? 37]                                 = "spr_crow";
global.save_sindex [? "spr_reindeer"]                     = 38;
global.save_sname  [? 38]                                 = "spr_reindeer";
global.save_sindex [? "spr_gingerbread_man"]              = 39;
global.save_sname  [? 39]                                 = "spr_gingerbread_man";
global.save_sindex [? "spr_snowball"]                     = 40;
global.save_sname  [? 40]                                 = "spr_snowball";
global.save_sindex [? "spr_bolt"]                         = 41;
global.save_sname  [? 41]                                 = "spr_bolt";
global.save_sindex [? "spr_laser"]                        = 42;
global.save_sname  [? 42]                                 = "spr_laser";
global.save_sindex [? "spr_gingerbread_man_attack"]	      = 43;
global.save_sname  [? 43]                                 = "spr_gingerbread_man_attack";
global.save_sindex [? "spr_gingerbread_man_attack_float"] = 44;
global.save_sname  [? 44]                                 = "spr_gingerbread_man_attack_float";
global.save_sindex [? "spr_rocket_elf_charge"]			  = 45;
global.save_sname  [? 45]                                 = "spr_rocket_elf_charge";
global.save_sindex [? "spr_rocket_elf_charge_loop"]		  = 46;
global.save_sname  [? 46]                                 = "spr_rocket_elf_charge_loop";
global.save_sindex [? "spr_crow_hover"]					  = 47;
global.save_sname  [? 47]                                 = "spr_crow_hover";
global.save_sindex [? "spr_crow_attack"]				  = 48;
global.save_sname  [? 48]                                 = "spr_crow_attack";
global.save_sindex [? "spr_bobileusz"]					  = 49;
global.save_sname  [? 49]                                 = "spr_bobileusz";
global.save_sindex [? "spr_bobileusz_shooting"]			  = 50;
global.save_sname  [? 50]                                 = "spr_bobileusz_shooting";
global.save_sindex [? "spr_bobileusz_charging"]			  = 51;
global.save_sname  [? 51]                                 = "spr_bobileusz_charging";
global.save_sindex [? "spr_bobileusz_active_charge"]	  = 52;
global.save_sname  [? 52]                                 = "spr_bobileusz_active_charge";
global.save_sindex [? "spr_bobileusz_bullet"]			  = 53;
global.save_sname  [? 53]                                 = "spr_bobileusz_bullet";
global.save_sindex [? "spr_bobileusz_frag"]				  = 54;
global.save_sname  [? 54]                                 = "spr_bobileusz_frag";
global.save_sindex [? "spr_bobileusz_bottle"]			  = 55;
global.save_sname  [? 55]                                 = "spr_bobileusz_bottle";
global.save_sindex [? "part_circle"]					  = 56;
global.save_sname  [? 56]                                 = "part_circle";
global.save_sindex [? "spr_bobileusz_ultimate"]			  = 57;
global.save_sname  [? 57]                                 = "spr_bobileusz_ultimate";
global.save_sindex [? "part_snowflake"]					  = 58;
global.save_sname  [? 58]                                 = "part_snowflake";
// 59-96
global.save_sindex [? "spr_present"]                      = 97;
global.save_sname  [? 97]                                 = "spr_present";
global.save_sindex [? "spr_ultimate"]                      = 98;
global.save_sname  [? 98]                                 = "spr_ultimate";
// 99-104
global.save_sindex [? "spr_explosion"]                    = 105;
global.save_sname  [? 105]                                = "spr_explosion";
// 106-108
global.save_sindex [? "part_square"]                      = 109;
global.save_sname  [? 109]                                = "part_square";
global.save_sindex [? "part_line"]                        = 110;
global.save_sname  [? 110]                                = "part_line";
global.save_sindex [? "part_star"]                        = 111;
global.save_sname  [? 111]                                = "part_star";
global.save_sindex [? "part_ascii"]                       = 112;
global.save_sname  [? 112]                                = "part_ascii";

// Sanity check (does NOT detect all necessary sprites!)
// It's possible that some objects use sprites that are never set as
// the starting sprite and thus are inaccessible via object_get_sprite().
var i = 0;
while (object_exists(i)) {
	if (object_is_ancestor(i, obj_save_group)) {
		var sindex = object_get_sprite(i);
		if (sindex == -1) { i++; continue; }
		var sname  = sprite_get_name(sindex);
		if (!ds_map_exists(global.save_sindex, sname)) {
			show_debug_message("WARNING: sprite	name \"" + string(sname) + "\" (sprite_index=" + string(sindex) + ") not found in global.save_sindex!");
		}
	}
	i++;
}

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
	shader_get_uniform(shd_shine, "whitelist_box")
);

global.shd_outline_uni = ds_list_create();
ds_list_add(global.shd_outline_uni,
	shader_get_uniform(shd_outline, "pixel_size"),
	shader_get_uniform(shd_outline, "color"),
	shader_get_uniform(shd_outline, "rough")
);

global.shd_quadrangle_uni = ds_list_create();
ds_list_add(global.shd_quadrangle_uni,
	shader_get_uniform(shd_quadrangle, "uvs"),
	shader_get_uniform(shd_quadrangle, "dimensions"),
	shader_get_uniform(shd_quadrangle, "A"),
	shader_get_uniform(shd_quadrangle, "B"),
	shader_get_uniform(shd_quadrangle, "C"),
	shader_get_uniform(shd_quadrangle, "D"),
	shader_get_uniform(shd_quadrangle, "color"),
	shader_get_uniform(shd_quadrangle, "trim"),
	shader_get_uniform(shd_quadrangle, "overwrite_color"),
	shader_get_uniform(shd_quadrangle, "overwrite_alpha"),
);

#endregion

#region Audio Groups Assignment

global.character_audiogroup[0] = audiogroup_character_evilflame;
global.character_audiogroup[1] = audiogroup_character_emerald;
global.character_audiogroup[2] = audiogroup_character_scootomik;
global.character_audiogroup[3] = audiogroup_character_bobileusz;

global.realm_audiogroup[0] = audiogroup_menu;
global.realm_audiogroup[1] = audiogroup_realm_christmas;

#endregion

// Texture Groups are named exactly the same as respective characters and realms, so explicit indexing isn't necessary.

#region Status Effects Setup

global.status_effect_count = 21; //this is how many status effects there are in total

global.player_status_effect_name = array_setup("", global.status_effect_count - 1);
global.player_status_effect_desc = array_setup("", global.status_effect_count - 1);

global.player_status_effect_name[0] = "EXHAUSTED";
global.player_status_effect_desc[0] =
@"Your mobility drops
significantly!";

global.player_status_effect_name[1] = "MAGIC FATIGUE";
global.player_status_effect_desc[1] = 
@"Your magic attacks
are weakened!";

global.player_status_effect_name[2] = "SPELL-DRIED";
global.player_status_effect_desc[2] =
@"You cannot use
any magic!";

global.player_status_effect_name[3] = "PARALYZED";
global.player_status_effect_desc[3] =
@"You can barely
move your body!";

global.player_status_effect_name[4] = "DIZZY";
global.player_status_effect_desc[4] = 
@"You can't bring
yourself to focus!";

global.player_status_effect_name[5] = "DUAL CLONE";
global.player_status_effect_desc[5] = 
@"All of your actions
are doubled!";

global.player_status_effect_name[6] = "ULTIMATE COOLDOWN";
global.player_status_effect_desc[6] = 
@"You cannot use
your ultimate!";

global.player_status_effect_name[7] = "CURRENT CRUSH";
global.player_status_effect_desc[7] = 
@"Your foes' fate
is sealed.";

global.player_status_effect_name[8] = "CHIP TUNING";
global.player_status_effect_desc[8] = 
@"You are moving
at enormous speeds!";

global.player_status_effect_name[9] = "TWILIGHT FURY";
global.player_status_effect_desc[9] = 
@"The power of the stars
is at your hands.";

global.player_status_effect_name[10] = "BERSERK";
global.player_status_effect_desc[10] = 
@"An uncontrollable fury
takes over your body!";

global.player_status_effect_name[11] = "GEAR 1";
global.player_status_effect_desc[11] = 
@"Damage 50%
Defense 400%
Speed 30%";

global.player_status_effect_name[12] = "GEAR 2";
global.player_status_effect_desc[12] = 
@"Damage 70%
Defense 250%
Speed 50%";

global.player_status_effect_name[13] = "GEAR 3";
global.player_status_effect_desc[13] = 
@"Damage 80%
Defense 200%
Speed 65%";

global.player_status_effect_name[14] = "GEAR 4";
global.player_status_effect_desc[14] = 
@"Damage 90%
Defense 150%
Speed 80%";

global.player_status_effect_name[15] = "GEAR 5";
global.player_status_effect_desc[15] = 
@"The default gear.
All stats normal.";

global.player_status_effect_name[16] = "GEAR 6";
global.player_status_effect_desc[16] = 
@"Damage 107.5%
Defense 90%
Speed 130%";

global.player_status_effect_name[17] = "GEAR 7";
global.player_status_effect_desc[17] = 
@"Damage 115%
Defense 70%
Speed 160%";

global.player_status_effect_name[18] = "GEAR 8";
global.player_status_effect_desc[18] = 
@"Damage 122.5%
Defense 50%
Speed 200%";

global.player_status_effect_name[19] = "GEAR 9";
global.player_status_effect_desc[19] = 
@"Damage 130%
Defense 30%
Speed 250%";

global.player_status_effect_name[20] = "GEAR 10";
global.player_status_effect_desc[20] = 
@"Damage 150%
Defense 10%
Speed 300%";

global.player_status_effect_name[21] = "PRISMATIC GLACIER";
global.player_status_effect_desc[21] = 
@"Break down light to
break down enemies.";

#endregion

#region Surface Maps Setup

global.surface_maps = ds_list_create();
global.surface_map_free = ds_list_create();

#endregion