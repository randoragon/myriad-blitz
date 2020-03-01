#region GPSpeed Management

if (!global.loading) {
    var gpspeed_current = global.gpspeed_focus * global.gpspeed_ultimate_activation * global.gpspeed_state * global.gpspeed_ultimate;
	
    if (gpspeed_current != 0) {
        global.sound_gpspeed = global.gpspeed_focus * global.gpspeed_ultimate;
    }
	
    if(global.gpspeed != gpspeed_current) {
        gamespeed(gpspeed_current);
    }
    
    /* GPSTEP variable works like this:
    if global.gpspeed goes below 1 (slower than normal), things like reindeer's laser or emerald's charge
    work inaccurately, since they are executed each game step, so that gives them more steps than usual.
    That's why they are going to only be activated when this variable is >=1, which is going to occur
    regularly each time a real time step would have taken place.
    
    global.gptime is used as a universal time passage indicator, for example for shader animations etc.
    */
    if (room == rm_Main && global.state == 1 && global.gpspeed > 0) {
        global.gpstep -= (global.gpstep >= 1);
        global.gpstep += global.gpspeed;
        global.gptime += global.gpspeed;
    }
}

#endregion

#region global.shader_conditions Management

if (room == rm_Main && instance_exists(obj_player) && !global.loading) {
	global.shader_conditions = 0;

	// focus mode
	if (obj_player.focus_state != 0) {
		global.shader_conditions |= 1;
	}

	// ultimate activation
	if (instance_exists(obj_ultimate_activation) && obj_player.flash_clock <= 40) {
		global.shader_conditions |= 2;
	}

	// chip tuning
	if (STATUS_EFFECT_CHIP_TUNING) {
		global.shader_conditions |= 4;
	}
	
	// current crush
	if (STATUS_EFFECT_CURRENT_CRUSH) {
		global.shader_conditions |= 8;
	}
}

#endregion