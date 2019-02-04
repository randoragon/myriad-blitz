/// @description string_readln(string,separator)
/// @param string
/// @param separator
/*
Returns "1" from string "1;2;3;" when the separator is ";".
Erases the returned value from the input string array!

String must be passed in a 1D array in the 0 index.
Seperator must be a single character.

THIS FUNCTION RETURNS A STRING!
*/

var data=argument[0];

for(var readpos=1; readpos<=string_length(data[0]); readpos++) 
{
    if string_char_at(data[0],readpos)==argument[1] {
    var snippet=string_copy(data[0],1,readpos-1);
    data[@ 0]=string_delete(data[0],1,readpos);
    return snippet;
    }
}

