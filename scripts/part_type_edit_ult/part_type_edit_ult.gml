/// @description part_type_edit_ult(part,trait,val1,...)
/// @param part
/// @param trait
/// @param val1
/// @param ...
/*
Available Traits:
"sprite"
"image_index"

"size" (min, max, incr)
"angle" (min, max, incr)

"blend_mode"
"color" (c)
"alpha" (a, incr)
*/

var source=global.part_type_ult_grid[0];
var part=argument[0];
var a=argument[2];
if argument_count>3 var b=argument[3];
if argument_count>4 var c=argument[4];

switch(argument[1]) {
case "sprite": source[# part,0]=a; break;
case "image_index": source[# part,1]=a; break;
case "size": source[# part,2]=a; source[# part,3]=b; source[# part,4]=c; break;
case "angle": source[# part,5]=a; source[# part,6]=b; source[# part,7]=c; break;
case "blend_mode": source[# part,8]=a; break;
case "color": source[# part,9]=a; break;
case "alpha": source[# part,10]=a; source[# part,11]=b; break;
}

