/// @description Startup Code

#region Startup code

switch(f) {
	case 0:  sprite_index=spr_button_bar; image_speed=0; image_blend=rgb(0,255,80); break;
	case 1:  sprite_index=spr_button_bar; image_speed=0; image_blend=rgb(255,160,30); break;
	case 2:  sprite_index=spr_button_bar; image_speed=0; image_blend=rgb(255,40,130); break;
	case 3:  sprite_index=spr_button_bar; image_speed=0; image_blend=rgb(205,205,205); break;
	case 4:  sprite_index=spr_button_bar; image_speed=0; image_blend=rgb(255,88,88); break;
	case 5:  sprite_index=spr_button_arrows; image_index=0; image_speed=0; image_yscale=2; if global.state==1 image_alpha=0; break;
	case 6:  sprite_index=spr_button_arrows; image_index=1; image_speed=0; image_yscale=2; if global.state==1 image_alpha=0; break;
	case 7:  sprite_index=spr_button_back; image_index=0; image_speed=0; break;
	case 8:  sprite_index=spr_button_pause; image_index=0; image_speed=0; uni_center=shader_get_uniform(shd_clock_overlay,"u_vCenter"); uni_time=shader_get_uniform(shd_clock_overlay,"u_fTime"); break;
	case 9:  sprite_index=spr_button_pause_bar; image_index=0; image_speed=0; prev_image_speed=0; image_blend=rgb(0,255,89); break;
	case 10: sprite_index=spr_button_pause_bar; image_index=0; image_speed=0; prev_image_speed=0; image_blend=rgb(255,162,30); break;
	case 11: sprite_index=spr_button_pause_bar; image_index=0; image_speed=0; prev_image_speed=0; image_blend=rgb(4,157,255); break;
	case 12: sprite_index=spr_button_pause_bar; image_index=0; image_speed=0; prev_image_speed=0; image_blend=rgb(255,69,69); break;
	case 13: sprite_index=spr_about_button; image_index=0; image_speed=0; break;
	case 14: sprite_index=spr_discord_button; image_index=0; image_speed=0; break;
	case 15: sprite_index=spr_button_pause_bar; image_index=0; image_speed=0; image_blend=rgb(255,182,50); break;
	case 16: sprite_index=spr_waterflame_button; image_index=0; image_speed=0; break;
	case 17: sprite_index=spr_slot_load_arrows; image_index=0; image_speed=0; break;
	case 18: sprite_index=spr_slot_load_arrows; image_index=0; image_speed=0; image_xscale=-1; break;
	case 19: sprite_index=spr_slot_load_rename; image_index=2; image_speed=0; break;
	case 20: sprite_index=spr_slot_load_delete; image_index=2; image_speed=0; break;
	case 21: sprite_index=spr_button_show_stats; image_speed=0; break;
	case 22: sprite_index=spr_button_select_stats; image_index=0; image_speed=0; break;
	case 23: sprite_index=spr_stats_checkbox; image_speed=0; image_index=0; break;
	case 24: sprite_index=spr_size_button; image_index=0+(3*(global.save_chunk_size==200)); image_speed=0; break;
	case 25: sprite_index=spr_size_button; image_index=1+(3*(global.save_chunk_size==500)); image_speed=0; break;
	case 26: sprite_index=spr_size_button; image_index=2+(3*(global.save_chunk_size==1500)); image_speed=0; break;
	case 27: sprite_index=spr_gamejolt_button; image_index=0; image_speed=0; break;
	case 28: sprite_index=spr_github_button; image_index=0; image_speed=0; break;
}

#endregion