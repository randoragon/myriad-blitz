/// @description scr_Rename(file path, new filename);
/// @param file path
/// @param  new filename
var fname=string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(argument[1],"?",""),"/",""),"|",""),"\\",""),"*",""),":",""),"<",""),">",""),"\"","");
var fullname=working_directory+"slots\\"+fname+".mbslot";
var retry=1;
while(file_exists(fullname))
{
retry++;
fullname=working_directory+"slots\\"+fname+string(retry)+".mbslot";
}

if !file_rename(argument[0],fullname) {exit; indicate(x,y,"FAILED TO RENAME FILE",3,c_yellow,c_red);}

var ff=file_text_open_read(fullname);
file_text_readln(ff);
file_text_readln(ff);
var ffcontent="";
while(!file_text_eof(ff))
{
ffcontent+=file_text_readln(ff);
}
file_text_close(ff);

ff=file_text_open_write(fullname);
file_text_write_string(ff,SLOT_DISCLAIMER);
file_text_writeln(ff);
file_text_write_string(ff,argument[1]);
file_text_writeln(ff);
file_text_write_string(ff,ffcontent);
file_text_close(ff);
