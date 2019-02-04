/// @description screen_transition(room,script,time,type,color);
/// @param room
/// @param script
/// @param time
/// @param type
/// @param color
/*
TRANSITION TYPES LIST:
 0 - alpha fade in-out
 1 - swipe from left to right
-1 - swipe from right to left
 2 - swipe from top to bottom
-2 - swipe from bottom to top

[NOTE] The affected area is always designated using the VIEW_CURRENT function!
*/
if(instance_exists(obj_Transition)) {
    exit;
}
if!(argument[0]==-1 && argument[1]==-1) {
    var instance=instance_create(0,0,obj_Transition);
    with(instance) {
        if(argument[0]!=-1) destination=argument[0];
        if(argument[1]!=-1) script=argument[1];
        time=argument[2];
        type=argument[3];
        color=argument[4];
    }
    return instance;
}
return -1;
