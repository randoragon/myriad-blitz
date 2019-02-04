/// @description screenflash_set(fade_in,fade_hold,fade_out,script,color,alpha);
/// @param fade_in
/// @param fade_hold
/// @param fade_out
/// @param script
/// @param color
/// @param alpha
flash=instance_create(x,y,obj_screenflash);
flash.fade_in=argument[0];
flash.fade_in0=argument[0];
flash.fade_hold=argument[1];
flash.fade_hold0=argument[1];
flash.fade_out=argument[2];
flash.fade_out0=argument[2];
flash.script=argument[3];
flash.image_blend=argument[4];
flash.fade_alpha=argument[5];
return flash;

