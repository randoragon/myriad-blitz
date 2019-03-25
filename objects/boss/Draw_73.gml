#region Set GUI_SURFACE as target

surface_set_target(GUI_SURFACE);

#endregion

#region draw ABOUT

if (room == rm_About) {
    draw_set_align(fa_center,fa_top);
    var about =
    "#DEVELOPED BY"+
    "##"+
    "#SOUNDTRACK"+
    "##"+
    "#SPECIAL THANKS TO"+
    "#####"+
    "THANK YOU FOR PLAYING MYRIAD BLITZ!";
    
    draw_set_color(c_black);
    draw_set_align(fa_right, fa_bottom);
    draw_text_transformed(1013, 710, string_hash_to_newline("v" + VER), 2, 2, 0);
    draw_set_align(fa_center, fa_top);
    draw_text_transformed(703, 200, string_hash_to_newline(about), 3, 3, 0);
    var highlight;
    highlight =
    (1 * (boss.x >= 703 - 5 - (0.5 * 3 * string_width(string_hash_to_newline("Waterflame")))		   && boss.x <= 703 + 5 + (0.5 * 3 * string_width(string_hash_to_newline("Waterflame")))		   && boss.y >= 200 + (5 * 3 * 12) - 5 && boss.y <= 200 + (5 * 3 * 12) + 32)) +
    (2 * (boss.x >= 703 - 5 - (0.5 * 3 * string_width(string_hash_to_newline("Mahlarian")))			   && boss.x <= 703 + 5 + (0.5 * 3 * string_width(string_hash_to_newline("Mahlarian")))			   && boss.y >= 200 + (8 * 3 * 12) - 5 && boss.y <= 200 + (8 * 3 * 12) + 32)) +
    (3 * (boss.x >= 703 - 5 - (0.5 * 3 * string_width(string_hash_to_newline("My Discord Community"))) && boss.x <= 703 + 5 + (0.5 * 3 * string_width(string_hash_to_newline("My Discord Community"))) && boss.y >= 200 + (9 * 3 * 12) - 5 && boss.y <= 200 + (9 * 3 * 12) + 32));
    //Randoragon
    draw_text_outline(703, 200 + (2 * 3 * 12), "Randoragon", 3, 3, 0, rgb(128, 255, 0), 1, c_black, 1);
    //Waterflame
    if (highlight == 1) {
        gpu_set_alphatestref(0);
		gpu_set_blendmode(bm_add);
        draw_text_highlight(703, 200 + (5 * 3 * 12), "Waterflame", 3, c_black, 0.5, fa_center, fa_top, 7, 7);
		gpu_set_colorwriteenable(1, 1, 1, 0);
		gpu_set_blendmode(bm_normal);
		draw_text_highlight(703, 200 + (5 * 3 * 12), "Waterflame", 3, c_black, 0.5, fa_center, fa_top, 7, 7);
		gpu_set_colorwriteenable(1, 1, 1, 1);
		gpu_set_alphatestref(254);
        draw_text_outline(703, 200 + (5 * 3 * 12), "Waterflame", 3, 3, 0, rgb(0,165,255), 1, c_black, 1);
        draw_tooltip("Menu Song: "+"\"Battletown\"#"+"Christmas Realm: "+"\"8-bit Jingle Twist\"");
        draw_set_align(fa_center, fa_top);
    } else {
        draw_text_outline(703, 200 + (5 * 3 * 12), "Waterflame", 3, 3, 0, rgb(0, 135, 205), 1, c_black, 1);
    }
    //Mahlarian
    if (highlight == 2) {
        gpu_set_alphatestref(0);
		gpu_set_blendmode(bm_add);
        draw_text_highlight(703, 200 + (8 * 3 * 12), "Mahlarian", 3, c_black, 0.5, fa_center, fa_top, 7, 7);
		gpu_set_colorwriteenable(1, 1, 1, 0);
		gpu_set_blendmode(bm_normal);
		draw_text_highlight(703, 200 + (8 * 3 * 12), "Mahlarian", 3, c_black, 0.5, fa_center, fa_top, 7, 7);
        gpu_set_alphatestref(254);
		gpu_set_colorwriteenable(1, 1, 1, 1);
        draw_text_outline(703, 200 + (8 * 3 * 12), "Mahlarian", 3, 3, 0, rgb(255, 0, 255), 1, c_black, 1);
        draw_tooltip("For useful suggestions, tips,#playtesting and being a good friend.");
        draw_set_align(fa_center, fa_top);
    } else {
        draw_text_outline(703, 200 + (8 * 3 * 12), "Mahlarian", 3, 3, 0, rgb(255, 0, 234), 1, c_black, 1);
    }
    //Discord Community
    if (highlight == 3) {
        gpu_set_alphatestref(0);
		gpu_set_blendmode(bm_add);
        draw_text_highlight(703, 200 + (9 * 3 * 12), "My Discord Community", 3, c_black, 0.5, fa_center, fa_top, 7, 7);
		gpu_set_blendmode(bm_normal);
		gpu_set_colorwriteenable(1, 1, 1, 0);
		draw_text_highlight(703, 200 + (9 * 3 * 12), "My Discord Community", 3, c_black, 0.5, fa_center, fa_top, 7, 7);
		gpu_set_colorwriteenable(1, 1, 1, 1);
        gpu_set_alphatestref(254);
        draw_text_outline(703, 200 + (9 * 3 * 12), "My Discord Community", 3, 3, 0, c_white, 1, c_black, 1);
        draw_tooltip("For partaking in polls, supporting my work#and patiently waiting for delayed updates <3");
        draw_set_align(fa_center, fa_top);
    } else {
        draw_text_outline(703, 200 + (9 * 3 * 12), "My Discord Community", 3, 3, 0, c_ltgray, 1, c_black, 1);
    }
    draw_sprite_ext(spr_logo, 0, 703, 180, 0.4, 0.4, 0, c_white, 1);
}

#endregion

#region draw HELP

if (room == rm_Help) {
    draw_set_align(fa_center, fa_top);
    var sections =
    "HOW TO PLAY" +
    "######" +
    "UNIQUE MECHANICS";
    
    var help1 =
    "In this infinity run shooter game your goal is to obtain" +
    "#as many points as you can by killing enemies." +
    "#" +
    "You have " + string(CHRCOUNT) + " characters to choose from, each with its own strengths" +
    "#and weaknesses. Their characteristics can be viewed in detail" +
    "#in the character selection menu. Controls are listed there as well.";
    
    var help2 =
    "Other than moving and shooting, there are two kinds of moves:" +
    "#" +
    "#Charge is a periodic move you can use if it's not" +
    "#under a cooldown, which it goes into after being used." +
    "#" +
    "#Ultimate is your strongest move, it costs a Power Point to use." +
    "#You can see your Power Points on the right side of the HP bar." +
    "#To obtain a Power Point you have to kill a special kind of enemy," +
    "#which is guaranteed to spawn exactly once every 100 killed enemies." +
    "#You'll recognize this enemy by unique star particles it emits.";
    
    draw_text_outline(CANVAS_XMID, 164, sections, 3, 3, 0, rgb(0, 200, 255), 1, c_black, 1);
    draw_set_color(c_black);
    draw_text_transformed(CANVAS_XMID, 164 + (1 * 3 * 12), string_hash_to_newline(help1), 2, 2, 0);
    draw_text_transformed(CANVAS_XMID, 164 + (7 * 3 * 12), string_hash_to_newline(help2), 2, 2, 0);
}

#endregion

#region obj_transition Management

with (obj_transition) {
	if (type == 0) {
	    progress += 2/time;
	    draw_set_color(color);
	    if (progress <= 1) { draw_set_alpha(progress); } else { draw_set_alpha(2 - progress); }
	    gpu_set_alphatestref(254);
	    draw_rectangle(GUI_X, GUI_Y, GUI_XEND, GUI_YEND, 0);
	    draw_set_alpha(1);
	    gpu_set_alphatestref(0);
	    if (progress==1)   { event_perform(ev_other, ev_user0); }
	    if (progress >= 2) { instance_destroy(); }
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
	    if (progress == CANVAS_WIDTH)   { event_perform(ev_other, ev_user0); }
	    if (progress >= CANVAS_WIDTH*2) { instance_destroy(); }
	} else if (type == 2) {
	    progress += CANVAS_HEIGHT * 2 / time;
	    draw_set_color(color);
	    draw_rectangle(GUI_X, GUI_Y - CANVAS_HEIGHT + progress, GUI_XEND, GUI_Y + progress, 0);
	    if (progress == CANVAS_HEIGHT)   { event_perform(ev_other, ev_user0); }
	    if (progress >= CANVAS_HEIGHT*2) { instance_destroy(); }
	} else if (type == -2) {
	    progress += CANVAS_HEIGHT * 2 / time;
	    draw_set_color(color);
	    draw_rectangle(GUI_X, GUI_Y + (2 * CANVAS_HEIGHT) - progress, GUI_XEND, GUI_YEND - progress, 0);
	    if (progress == CANVAS_HEIGHT)   { event_perform(ev_other, ev_user0); }
	    if (progress >= CANVAS_HEIGHT*2) { instance_destroy(); }
	}
}

#endregion

#region draw_self

draw_self();

#endregion

#region SURFACE RESET

surface_reset_target();

#endregion