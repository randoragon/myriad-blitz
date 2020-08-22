/// @description scr_BackgroundUpdate(global.realm)
/// @param global.realm
function scr_BackgroundUpdate() {

	var a;

	switch (argument[0]) {
	    case 0: // Menu
			a = 0;
			global.background_sprite[a]  = bg_Menu0;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = 0;
			global.background_vspeed[a]  = 0;
        
			a = 1;
			global.background_sprite[a]  = bg_Menu1;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -1;
			global.background_vspeed[a]  = 0;
        
			a = 2;
			global.background_sprite[a]  = bg_Menu2;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -2;
			global.background_vspeed[a]  = 0;
		
			a = 3;
			global.background_sprite[a]  = bg_Menu3;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -3;
			global.background_vspeed[a]  = 0;
		
			a = 4;
			global.background_sprite[a]  = bg_Menu4;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -4;
			global.background_vspeed[a]  = 0;
        
			a = 5;
			global.background_sprite[a]  = bg_Menu5;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -5;
			global.background_vspeed[a]  = 0;
        
			a = 6;
			global.background_sprite[a]  = bg_Menu6;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -6;
			global.background_vspeed[a]  = 0;
        
	        a = 7;
			global.background_sprite[a]  = noone;
	    break;
	    case 1: // Christmas Realm
			a = 0;
			global.background_sprite[a]  = bg_Christmas0;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = 0;
			global.background_vspeed[a]  = 0;
        
			a = 1;
			global.background_sprite[a]  = bg_Christmas1;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -1;
			global.background_vspeed[a]  = 0;
        
			a = 2;
			global.background_sprite[a]  = bg_Christmas2;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -2;
			global.background_vspeed[a]  = 0;
		
			a = 3;
			global.background_sprite[a]  = bg_Christmas3;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -3;
			global.background_vspeed[a]  = 0;
		
			a = 4;
			global.background_sprite[a]  = bg_Christmas4;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -4;
			global.background_vspeed[a]  = 0;
        
			a = 5;
			global.background_sprite[a]  = bg_Christmas5;
			global.background_htiled[a]  = TRUE;
			global.background_vtiled[a]  = FALSE;
			global.background_hspeed[a]  = -6;
			global.background_vspeed[a]  = 0;
        
			a = 6;
			global.background_sprite[a]  = noone;
        
	        a = 7;
			global.background_sprite[a]  = noone;
	    break;
	}


}
