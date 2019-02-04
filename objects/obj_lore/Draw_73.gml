/// @description GUI_SURFACE set
surface_set_target(GUI_SURFACE);

///draw self
if y<ystart+350 draw_self();

///draw text

if y<ystart+350
{
var lineh=20;

if mouse_wheel_up() && place_meeting(x,y,boss) scrollv=max(scrollv+6,6);
else
if mouse_wheel_down() && place_meeting(x,y,boss) scrollv=min(scrollv-6,-6);
else
scrollv=home(scrollv,0,1,0);

var linecount=string_count("#",global.lore)+1;
draw_set_align(fa_center,fa_middle); draw_set_color(c_black);
for(var i=0; i<linecount; i++)
{
if y-(sprite_height/2)+84+scroll+(i*lineh)>=y-(sprite_height/2)+84-lineh && y-(sprite_height/2)+84+scroll+(i*lineh)<=y+(sprite_height/2)-69+lineh
draw_text_transformed(x,y-(sprite_height/2)+84+scroll+(i*lineh),string_hash_to_newline(text[i]),2,2,0);
}

var prevscroll=scroll;
scroll=clamp(scroll+scrollv,-(linecount*lineh)+(sprite_height-146),0);
if prevscroll+scrollv<-(linecount*lineh)+(sprite_height-146) or prevscroll+scrollv>0 scrollv=0;
}

///draw cuts & arrows
if x<xstart+250
{

var cut1_exists=1;
for(var i=0; i<array_length_1d(cut1); i++) {if !sprite_exists(cut1[i]) cut1_exists=0;}
if cut1_exists draw_sprite_ext(cut1[floor(image_index)%image_number],0,x,y,image_xscale,image_yscale,image_angle,image_blend,1);
var cut2_exists=1;
for(var i=0; i<array_length_1d(cut2); i++) {if !sprite_exists(cut2[i]) cut2_exists=0;}
if cut2_exists draw_sprite_ext(cut2[floor(image_index)%image_number],0,x,y,image_xscale,image_yscale,image_angle,image_blend,1);

if osc!=-1
{
if scroll<0 draw_sprite_ext(spr_scroll_arrow,0,x,y-(sprite_height/2)+64-osc.output[1],osc.output[0],-1,0,-1,1);
if scroll>-((string_count("#",global.lore)+1)*20)+(sprite_height-146) draw_sprite_ext(spr_scroll_arrow,0,x,y+(sprite_height/2)-56+osc.output[1],osc.output[0],1,0,-1,1);
}
}

///SURFACE RESET
surface_reset_target();

