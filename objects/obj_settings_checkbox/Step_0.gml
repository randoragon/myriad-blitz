/// @description mouse functionality
if((place_meeting(x,y,boss) || (boss.x>=x+25-2 && boss.x<=x+25+(3*string_width(string_hash_to_newline(label)))+2 && boss.y>=y-(1.5*(string_height(string_hash_to_newline(label))))-2 && boss.y<=y+(1.5*(string_height(string_hash_to_newline(label))))+2)) && mouse_check_button_pressed(mb_left))
{
if script_exists(script) {script_execute(script); check=toggle(check); play_sfx(sfx_button3,0,0);}
}

image_index=check;

