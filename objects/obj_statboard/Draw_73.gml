/// @description GUI_SURFACE set
surface_set_target(GUI_SURFACE);

///draw self
if x<xstart+360 draw_self();

///draw stats
if x<xstart+360
{
var lineh=22;

if mouse_wheel_up() && place_meeting(x,y,boss) scrollv=max(scrollv+6,6);
else
if mouse_wheel_down() && place_meeting(x,y,boss) scrollv=min(scrollv-6,-6);
else
scrollv=home(scrollv,0,1,0);

//set scroll bounds
var prevscroll=scroll;
scroll=clamp(scroll+scrollv,-(linesum*lineh)+(sprite_height-180),0);
if prevscroll+scrollv<-(linesum*lineh)+(sprite_height-180) or prevscroll+scrollv>0 scrollv=0;

draw_set_align(fa_left,fa_middle); draw_set_color(c_black);
for(var s=0; s<array_height_2d(linecount); s++)
{
//add section offset
var yoffset=0;
var xoffset=10+(10*(button[1].customize));
if s>0 && section_length[s]>0
{
for(var i=0; i<s; i++)
if section_length[i]>0 yoffset+=(3+(datatype[i,section_length[i]-1]==1 or datatype[i,section_length[i]-1]==2)+linecount[i,section_length[i]-1])*lineh;
}
//draw section sprite
if section_length[s]>0 && (y+yoffset-(sprite_height/2)+125+scroll>=y-(sprite_height/2)+125-lineh && y+yoffset-(sprite_height/2)+125+scroll<=y+(sprite_height/2)-50)
draw_sprite(spr_stats_section,s,x-(sprite_width/2)+45,y+yoffset-(sprite_height/2)+125+scroll);

//draw all the content
for(var i=0; i<section_length[s]; i++) {
    if datatype[s,i]!=4 && (y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)>=y-(sprite_height/2)+125-lineh && y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)<=y+(sprite_height/2)-50)
    {
    if button[1].customize==1 with(checkbox[elementid[s,i]]) {y=((other.datatype[s,i]==1 or other.datatype[s,i]==2)*0.5*lineh)+other.y+yoffset-(other.sprite_height/2)+125+other.scroll+((other.linecount[s,i]+0.2)*lineh)+2; draw_self();}
    if desc[elementid[s,i]]!="" && boss.x>=xoffset+x-(sprite_width/2)+45-2 && boss.x<=xoffset+x-(sprite_width/2)+45+(2*string_width(string_hash_to_newline(text[s,i])))+2 && boss.y>=y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2-(lineh/2)+2 && boss.y<=y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2+(lineh/2)-2
    {
    draw_set_alpha_test_ref_value(0);
    draw_set_blend_mode(bm_add);
    draw_text_highlight(xoffset+x-(sprite_width/2)+45,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2,text[s,i],2,c_black,0.5,fa_left,fa_middle,3,3);
    draw_set_blend_mode(bm_normal);
    draw_set_color_write_enable(1,1,1,0);
    draw_text_highlight(xoffset+x-(sprite_width/2)+45,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2,text[s,i],2,c_black,0.5,fa_left,fa_middle,3,3);
    draw_set_color_write_enable(1,1,1,1);
    draw_set_color(c_white);
    draw_set_alpha_test_ref_value(254);
    }
    draw_text_transformed(xoffset+x-(sprite_width/2)+45,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2,string_hash_to_newline(text[s,i]),2,2,0);
    draw_set_color(c_black);
    draw_set_halign(fa_right);
    draw_text_outline(10+x+(sprite_width/2)-26,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2,display[s,i],2,2,0,global.color[boss.chrsel],1,c_black,1);
    draw_set_halign(fa_left);
    }
    if (datatype[s,i]==1 or datatype[s,i]==2) && (y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+1.2)*lineh)>=y-(sprite_height/2)+125-lineh && y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+1.2)*lineh)<=y+(sprite_height/2)-50)
    {
    draw_set_color(color_shift_hsv(global.color[boss.chrsel],0,-random_range(0,(display[s,i]>limit[s,i])*30),0,1));
    draw_rectangle(xoffset+x-(sprite_width/2)+46,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+1.2)*lineh)-8,xoffset+x-(sprite_width/2)+46+clamp(value[s,i]*(sprite_width-64-xoffset)/limit[s,i],0,sprite_width-74),y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+1.2)*lineh)+8,0);
    draw_set_color(c_black);
    draw_rectangle(xoffset+x-(sprite_width/2)+46,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+1.2)*lineh)-9,10+x+(sprite_width/2)-28,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+1.2)*lineh)+9,1);
    draw_rectangle(xoffset+x-(sprite_width/2)+45,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+1.2)*lineh)-8,10+x+(sprite_width/2)-27,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+1.2)*lineh)+8,1);
    }
    if datatype[s,i]==4 && (y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)>=y-(sprite_height/2)+125-lineh && y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)<=y+(sprite_height/2)-50)
    {
    if button[1].customize==1 && (i==0 or elementid[s,i-1]!=elementid[s,i]) with(checkbox[elementid[s,i]]) {y=other.y+yoffset-(other.sprite_height/2)+125+other.scroll+((real(string_copy(other.text[s,i],2,string_length(other.text[s,i])-1))+other.linecount[s,i]+0.2)*lineh)+2; draw_self();}
    switch(real(string_char_at(text[s,i],1)))
    {
    case 0: draw_text_transformed(xoffset+x-(sprite_width/2)+45,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2,string_hash_to_newline(value[s,i]),2,2,0); break;
    case 1: draw_text_outline(xoffset+x-(sprite_width/2)+45,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2,value[s,i],2,2,0,global.color[boss.chrsel],0,c_black,1); break;
    case 2: draw_text_outline(xoffset+x-(sprite_width/2)+45,y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2,value[s,i],2,2,0,global.color[boss.chrsel],1,c_black,1); break;
    }
    }
}
}
}

///draw cuts, arrows, headline & buttons
if x<xstart+360
{
var cut1_exists=1;
for(var i=0; i<array_length_1d(cut1); i++) {if !sprite_exists(cut1[i]) cut1_exists=0;}
if cut1_exists draw_sprite_ext(cut1[floor(image_index)%image_number],0,x,y,image_xscale,image_yscale,image_angle,image_blend,1);
var cut2_exists=1;
for(var i=0; i<array_length_1d(cut2); i++) {if !sprite_exists(cut2[i]) cut2_exists=0;}
if cut2_exists draw_sprite_ext(cut2[floor(image_index)%image_number],0,x,y,image_xscale,image_yscale,image_angle,image_blend,1);
draw_set_alpha_test_ref_value(0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(spr_stats_headline,0,x+17,y-195,1,1,0,-1,0.5);
draw_set_blend_mode(bm_normal);
draw_set_color_write_enable(1,1,1,0);
draw_sprite_ext(spr_stats_headline,0,x+17,y-195,1,1,0,-1,0.5);
draw_set_color_write_enable(1,1,1,1);
draw_set_alpha_test_ref_value(254);

if osc!=-1
{
var lineh=22;
if scroll<0 draw_sprite_ext(spr_scroll_arrow,0,x+17,y-(sprite_height/2)+91-osc.output[1],osc.output[0],-1,0,-1,1);
if scroll>-(linesum*lineh)+(sprite_height-180) draw_sprite_ext(spr_scroll_arrow,0,x+17,y+(sprite_height/2)-60+osc.output[1],osc.output[0],1,0,-1,1);
}

with(button[0]) draw_self();
with(button[1]) draw_self();
}

with (other) {
///draw stat tips
draw_set_align(fa_left,fa_middle); draw_set_color(c_black);
for(var s=0; s<array_height_2d(linecount); s++)
{
//add section offset
var yoffset=0;
var xoffset=10+(10*(button[1].customize));
if s>0 && section_length[s]>0
{
for(var i=0; i<s; i++)
if section_length[i]>0 yoffset+=(3+(datatype[i,section_length[i]-1]==1 or datatype[i,section_length[i]-1]==2)+linecount[i,section_length[i]-1])*lineh;
}

for(var i=0; i<section_length[s]; i++)
{
if datatype[s,i]!=4 && (y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)>=y-(sprite_height/2)+125-lineh && y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)<=y+(sprite_height/2)-50)
{
if desc[elementid[s,i]]!="" && boss.x>=xoffset+x-(sprite_width/2)+45-2 && boss.x<=xoffset+x-(sprite_width/2)+45+(2*string_width(string_hash_to_newline(text[s,i])))+2 && boss.y>=y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2-(lineh/2)+2 && boss.y<=y+yoffset-(sprite_height/2)+125+scroll+((linecount[s,i]+0.2)*lineh)+2+(lineh/2)-2
{
draw_tooltip(desc[elementid[s,i]]);
}
}
}
}

}
///SURFACE RESET
surface_reset_target();

