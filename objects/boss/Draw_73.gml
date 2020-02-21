
#region Set GUI_SURFACE as target

surface_set_target(GUI_SURFACE);

#endregion

#region draw ABOUT

if (room == rm_About) {
    draw_set_align(fa_center,fa_top);
    var about =
    "\nDEVELOPED BY" + 
    "\n\n\n" + 
    "SOUNDTRACK" + 
    "\n\n\n" + 
    "SPECIAL THANKS TO" + 
	"\n\n\n\n\n" + 
    "THANK YOU FOR PLAYING MYRIAD BLITZ!";    
    draw_set_color(c_black);
    draw_set_align(fa_right, fa_bottom);
    draw_text_transformed(1013, 710, "v" + VER, 2, 2, 0);
    draw_set_align(fa_center, fa_top);
    draw_text_transformed(703, 200, about, 3, 3, 0);
    var highlight;
    highlight =
    (1 * (boss.x >= 703 - 5 - (0.5 * 3 * string_width("Waterflame"))		   && boss.x <= 703 + 5 + (0.5 * 3 * string_width("Waterflame"))		   && boss.y >= 200 + (5 * 3 * 12) - 5 && boss.y <= 200 + (5 * 3 * 12) + 32)) +
    (2 * (boss.x >= 703 - 5 - (0.5 * 3 * string_width("Mahlarian"))			   && boss.x <= 703 + 5 + (0.5 * 3 * string_width("Mahlarian"))			   && boss.y >= 200 + (8 * 3 * 12) - 5 && boss.y <= 200 + (8 * 3 * 12) + 32)) +
    (3 * (boss.x >= 703 - 5 - (0.5 * 3 * string_width("My Discord Community")) && boss.x <= 703 + 5 + (0.5 * 3 * string_width("My Discord Community")) && boss.y >= 200 + (9 * 3 * 12) - 5 && boss.y <= 200 + (9 * 3 * 12) + 32));
    //Randoragon
    draw_text_outline(703, 200 + (2 * 3 * 12), "Randoragon", 3, 3, rgb(128, 255, 0), 2, c_black);
	
    //Waterflame
    if (highlight == 1) {
        gpu_set_alphatestref(0);
		gpu_set_blendmode(bm_add);
        draw_text_highlight(703, 200 + (5 * 3 * 12), "Waterflame", 3, c_black, 0.25, fa_center, fa_top, 7, 7);
		gpu_set_colorwriteenable(1, 1, 1, 0);
		gpu_set_blendmode(bm_normal);
		draw_text_highlight(703, 200 + (5 * 3 * 12), "Waterflame", 3, c_black, 0.25, fa_center, fa_top, 7, 7);
		gpu_set_colorwriteenable(1, 1, 1, 1);
		gpu_set_alphatestref(254);
        draw_text_outline(703, 200 + (5 * 3 * 12), "Waterflame", 3, 3, rgb(0,165,255), 2, c_black);
        draw_tooltip_raw("Menu Song: "+"\"Battletown\"\n"+"Christmas Realm: "+"\"8-bit Jingle Twist\"");
        draw_set_align(fa_center, fa_top);
    } else {
        draw_text_outline(703, 200 + (5 * 3 * 12), "Waterflame", 3, 3, rgb(0, 135, 205), 2, c_black);
    }
    //Mahlarian
    if (highlight == 2) {
        gpu_set_alphatestref(0);
		gpu_set_blendmode(bm_add);
        draw_text_highlight(703, 200 + (8 * 3 * 12), "Mahlarian", 3, c_black, 0.25, fa_center, fa_top, 7, 7);
		gpu_set_colorwriteenable(1, 1, 1, 0);
		gpu_set_blendmode(bm_normal);
		draw_text_highlight(703, 200 + (8 * 3 * 12), "Mahlarian", 3, c_black, 0.25, fa_center, fa_top, 7, 7);
        gpu_set_alphatestref(254);
		gpu_set_colorwriteenable(1, 1, 1, 1);
        draw_text_outline(703, 200 + (8 * 3 * 12), "Mahlarian", 3, 3, rgb(255, 0, 255), 2, c_black);
        draw_tooltip_raw("For useful suggestions, tips,\nplaytesting and being a good friend.");
        draw_set_align(fa_center, fa_top);
    } else {
        draw_text_outline(703, 200 + (8 * 3 * 12), "Mahlarian", 3, 3, rgb(255, 0, 234), 2, c_black);
    }
    //Discord Community
    if (highlight == 3) {
        gpu_set_alphatestref(0);
		gpu_set_blendmode(bm_add);
        draw_text_highlight(703, 200 + (9 * 3 * 12), "My Discord Community", 3, c_black, 0.25, fa_center, fa_top, 7, 7);
		gpu_set_blendmode(bm_normal);
		gpu_set_colorwriteenable(1, 1, 1, 0);
		draw_text_highlight(703, 200 + (9 * 3 * 12), "My Discord Community", 3, c_black, 0.25, fa_center, fa_top, 7, 7);
		gpu_set_colorwriteenable(1, 1, 1, 1);
        gpu_set_alphatestref(254);
        draw_text_outline(703, 200 + (9 * 3 * 12), "My Discord Community", 3, 3, c_white, 2, c_black);
        draw_tooltip_raw("For partaking in polls, supporting my work\nand patiently waiting for delayed updates <3");
        draw_set_align(fa_center, fa_top);
    } else {
        draw_text_outline(703, 200 + (9 * 3 * 12), "My Discord Community", 3, 3, c_ltgray, 2, c_black);
    }
    draw_sprite_ext(spr_logo, 0, 703, 180, 0.4, 0.4, 0, c_white, 1);
}

#endregion

#region draw HELP

if (room == rm_Help) {
    draw_set_align(fa_center, fa_top);
    var sections =
    "HOW TO PLAY" +
    "\n\n\n\n\n\n" +
    "UNIQUE MECHANICS";
    
    var help1 =
    "In this infinity run shooter game your goal is to obtain" +
    "\nas many points as you can by killing enemies." +
    "\n" +
    "You have " + string(CHRCOUNT) + " characters to choose from, each with its own strengths" +
    "\nand weaknesses. Their characteristics can be viewed in detail" +
    "\nin the character selection menu. Controls are listed there as well.";
    
    var help2 =
    "Other than moving and shooting, there are two kinds of moves:" +
    "\n" +
    "\nCharge is a periodic move you can use if it's not" +
    "\nunder a cooldown, which it goes into after being used." +
    "\n" +
    "\nUltimate is your strongest move, it costs a Power Point to use." +
    "\nYou can see your Power Points on the right side of the HP bar." +
    "\nTo obtain a Power Point you have to kill a special kind of enemy," +
    "\nwhich is guaranteed to spawn exactly once every 100 killed enemies." +
    "\nYou'll recognize this enemy by unique star particles it emits.";
    
    draw_text_outline(CANVAS_XMID, 164, sections, 3, 3, rgb(0, 200, 255), 2, c_black);
    draw_set_color(c_black);
    draw_text_transformed(CANVAS_XMID, 164 + (1 * 3 * 12), help1, 2, 2, 0);
    draw_text_transformed(CANVAS_XMID, 164 + (7 * 3 * 12), help2, 2, 2, 0);
}

#endregion

#region obj_transition management

with (obj_transition) {
	if (type == 0) {
	    progress += 1;
	    draw_set_color(color);
		if (abs(progress - time) > 1) {
		    if (progress < time - 1) {
				draw_set_alpha(progress / (time - 1));
			} else if (progress > time + 1) {
				draw_set_alpha(2 - (progress / (time + 1)));
			}
		    gpu_set_alphatestref(0);
			gpu_set_blendmode(bm_add);
		    draw_rectangle(GUI_X, GUI_Y, GUI_XEND, GUI_YEND, 0);
			gpu_set_blendmode(bm_normal);
			gpu_set_colorwriteenable(1, 1, 1, 0);
			draw_rectangle(GUI_X, GUI_Y, GUI_XEND, GUI_YEND, 0);
			gpu_set_colorwriteenable(1, 1, 1, 1);
		    draw_set_alpha(1);
		    gpu_set_alphatestref(254);
		} else {
			draw_rectangle(GUI_X, GUI_Y, GUI_XEND, GUI_YEND, 0);
			if (progress == time) { event_perform(ev_other, ev_user0); }
		}
		
	    if (progress >= 2 * time) { instance_destroy(); }
	} else if (type == 1) {
	    progress += CANVAS_WIDTH * 2 / time;
	    draw_set_color(color);
	    draw_rectangle(GUI_X - CANVAS_WIDTH + progress, GUI_Y, GUI_X + progress, GUI_YEND, 0);
	    if (progress == CANVAS_WIDTH)     { event_perform(ev_other, ev_user0); }
	    if (progress >= CANVAS_WIDTH * 2) { instance_destroy(); }
	} else if (type == -1) {
	    progress += CANVAS_WIDTH * 2 / time;
	    draw_set_color(color);
	    draw_rectangle(GUI_X + (2*CANVAS_WIDTH) - progress, GUI_Y, GUI_XEND - progress, GUI_YEND, 0);
	    if (progress == CANVAS_WIDTH)     { event_perform(ev_other, ev_user0); }
	    if (progress >= CANVAS_WIDTH * 2) { instance_destroy(); }
	} else if (type == 2) {
	    progress += CANVAS_HEIGHT * 2 / time;
	    draw_set_color(color);
	    draw_rectangle(GUI_X, GUI_Y - CANVAS_HEIGHT + progress, GUI_XEND, GUI_Y + progress, 0);
	    if (progress == CANVAS_HEIGHT)     { event_perform(ev_other, ev_user0); }
	    if (progress >= CANVAS_HEIGHT * 2) { instance_destroy(); }
	} else if (type == -2) {
	    progress += CANVAS_HEIGHT * 2 / time;
	    draw_set_color(color);
	    draw_rectangle(GUI_X, GUI_Y + (2 * CANVAS_HEIGHT) - progress, GUI_XEND, GUI_YEND - progress, 0);
	    if (progress == CANVAS_HEIGHT)     { event_perform(ev_other, ev_user0); }
	    if (progress >= CANVAS_HEIGHT * 2) { instance_destroy(); }
	}
}

#endregion

#region draw_self

draw_self();

#endregion

#region SURFACE RESET

surface_reset_target();

#endregion