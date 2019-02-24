/// @description char_index(char)
/// @param char

var charlist = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!#$%"+"\""+"&'.?~";

return string_pos(string_upper(argument[0]), charlist) - 1;