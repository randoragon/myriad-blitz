#region GPSpeed Management

if (!global.loading) {
    var gpspeed_current = global.gpspeed_focus * global.gpspeed_ultimate_activation * global.gpspeed_state * global.gpspeed_ultimate;
	
    if (gpspeed_current != 0) {
        sound_gpspeed = global.gpspeed_focus * global.gpspeed_ultimate;
    }
	
    if(gpspeed != gpspeed_current) {
        gamespeed(gpspeed_current);
    }
    
    /* GPSTEP variable works like this:
    if gpspeed goes below 1 (slower than normal), things like reindeer's laser or emerald's charge
    work inaccurately, since they are executed each game step, so that gives them more steps than usual.
    That's why they are going to only be activated when this variable is >=1, which is going to occur
    regularly each time a real time step would have taken place.
    
    gptime is used as a universal time passage indicator, for example for shader animations etc.
    */
    if (room == rm_Main && state == 1 && gpspeed > 0) {
        gpstep -= (gpstep >= 1);
        gpstep += gpspeed;
        gptime += gpspeed;
    }
}

#endregion


#region global.shader_conditions Management

if (room == rm_Main && instance_exists(obj_player) && !global.loading) {
	global.shader_conditions=0;

//focus mode
if (obj_player.focus_state!=0)
	global.shader_conditions |= 1;

//ultimate activation
if (instance_exists(obj_ultimate_activation) && obj_player.flash_clock <= 40)
	global.shader_conditions |= 2;

//chip tuning
if (obj_player.status_effect[8])
	global.shader_conditions |= 4;
	
//current crush
if (obj_player.status_effect[7])
	global.shader_conditions |= 8;
}

#endregion