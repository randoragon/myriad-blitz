/// @description scr_Stats_Update(show all);
/// @param show all
if !instance_exists(obj_statboard) exit;
with(obj_statboard)
{
var a=0; var b=-1; var c=0; 
/*
datatype[a,b] can either be: 0 - just value, no bar; 1 - value and bar, the higher, the better; 2 - value and bar, the lower, the better; 3 - snippet of text; 4 - unlimited text;
text[a,b] for data types "4" marks the following: "0" - regular, black text; "1" - player colored text with black outline type 0; "2" - player colored text with black outline type 1; (...)
(...) the following digits are the offset of the checkbox.
*/

if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="MAXIMUM HP";
value[a,b]=global.hp;
display[a,b]=string(global.hp);
limit[a,b]=1300;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="TOP SPEED";
value[a,b]=global.spd;
display[a,b]=string(global.spd);
limit[a,b]=20;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="ACCELERATION";
value[a,b]=global.acc;
display[a,b]=string(global.acc*100);
limit[a,b]=1.5;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="COUNTER ACCELERATION";
value[a,b]=global.counteracc;
display[a,b]=string(global.counteracc*100);
limit[a,b]=1.5;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="INVINCIBILITY TIME";
value[a,b]=global.invtime;
display[a,b]=string_format(value[a,b]/60,-1,2)+"s";
limit[a,b]=90;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="MAXIMUM FOCUS TIME";
value[a,b]=global.foctime;
display[a,b]=string_format(value[a,b]/60,-1,2)+"s";
limit[a,b]=450;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);}
section_length[a]=b+1;

a++; b=-1; c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="DAMAGE";
value[a,b]=global.bdmg;
display[a,b]=string(global.bdmg);
limit[a,b]=120;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="DEFENSE";
value[a,b]=global.bdef;
display[a,b]=string(global.bdef);
limit[a,b]=120;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="PENETRATION";
value[a,b]=global.bpen;
display[a,b]=string(value[a,b])+"%";
limit[a,b]=100;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="KNOCKBACK";
value[a,b]=global.bkb;
display[a,b]=string(global.bkb);
limit[a,b]=150;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="KNOCKBACK RESISTANCE";
value[a,b]=global.bkbres;
display[a,b]=string(value[a,b])+"%";
limit[a,b]=100;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);}
section_length[a]=b+1;

a++; b=-1; c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="DAMAGE";
value[a,b]=global.pdmg;
display[a,b]=string(global.pdmg);
limit[a,b]=25;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="SHOOTING SPEED";
value[a,b]=global.sspd;
display[a,b]=string_format(value[a,b],-1,2)+"/s";
limit[a,b]=30;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="DAMAGE PER SECOND";
value[a,b]=global.pdmg*global.sspd;
display[a,b]=string_format(global.pdmg*global.sspd,-1,2);
limit[a,b]=150;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="DEFENSE";
value[a,b]=global.pdef;
display[a,b]=string(global.pdef);
limit[a,b]=100;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="PENETRATION";
value[a,b]=global.ppen;
display[a,b]=string(value[a,b])+"%";
limit[a,b]=100;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="KNOCKBACK";
value[a,b]=global.pkb;
display[a,b]=string(global.pkb);
limit[a,b]=100;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="KNOCKBACK RESISTANCE";
value[a,b]=global.pkbres;
display[a,b]=string(value[a,b])+"%";
limit[a,b]=100;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="SHOOTING ACCURACY";
value[a,b]=global.sacc;
display[a,b]=string(value[a,b]*100)+"%";
limit[a,b]=1;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);}
section_length[a]=b+1;

a++; b=-1; c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="QUANTITY";
value[a,b]=string(global.fmin)+"-"+string(global.fmax);
display[a,b]=value[a,b];
datatype[a,b]=3;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="DAMAGE";
value[a,b]=global.fdmg;
display[a,b]=string(global.fdmg);
limit[a,b]=10;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="PENETRATION";
value[a,b]=global.fpen;
display[a,b]=string(value[a,b])+"%";
limit[a,b]=100;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="KNOCKBACK";
value[a,b]=global.fkb;
display[a,b]=string(global.fkb);
limit[a,b]=50;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);}
section_length[a]=b+1;

a++; b=-1; c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="2";
value[a,b]=global.cname;
display[a,b]=global.cname;
datatype[a,b]=4;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="0";
value[a,b]=global.cdesc;
display[a,b]=global.cdesc;
datatype[a,b]=4;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="DAMAGE";
value[a,b]=global.cdmg;
display[a,b]=string(global.cdmg);
limit[a,b]=150;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="PENETRATION";
value[a,b]=global.cpen;
display[a,b]=string(value[a,b])+"%";
limit[a,b]=100;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="KNOCKBACK";
value[a,b]=global.ckb;
display[a,b]=string(global.ckb);
limit[a,b]=250;
datatype[a,b]=1;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="CHARGING TIME";
value[a,b]=global.ctime;
display[a,b]=string_format(value[a,b]/60,-1,2)+"s";
limit[a,b]=180;
datatype[a,b]=2;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="COOLDOWN TIME";
value[a,b]=global.ccooldown;
display[a,b]=string_format(value[a,b]/60,-1,2)+"s";
limit[a,b]=1800;
datatype[a,b]=2;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);}
section_length[a]=b+1;

a++; b=-1; c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="2";
value[a,b]=global.uname;
display[a,b]=global.uname;
datatype[a,b]=4;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="TYPE";
display[a,b]=global.utype;
value[a,b]=global.utype;
datatype[a,b]=3;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="COOLDOWN TIME";
value[a,b]=global.ucooldown;
display[a,b]=string_format(value[a,b]/60,-1,2)+"s";
limit[a,b]=3600;
datatype[a,b]=2;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);
} c++;
if argument[0]==1 or listed[c]==1 {
b++;
text[a,b]="0";
value[a,b]=global.udesc;
datatype[a,b]=4;
elementid[a,b]=c;
b=scr_Stats_Linecount(a,b,c);}
section_length[a]=b+1;

var count=0;
linesum=0;
for(var i=0; i<a+1; i++)
{
if section_length[i]>0
{
linesum+=linecount[i,section_length[i]-1]+(datatype[i,section_length[i]-1]==1 or datatype[i,section_length[i]-1]==2);
count+=1.2;
}
}
linesum+=1+((count-1)*2.8);
}

