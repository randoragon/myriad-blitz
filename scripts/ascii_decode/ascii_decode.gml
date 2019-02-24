/// @description ascii_decode(string)
/// @param string

var output = "";

if (string_length(argument[0]) > 0) {
    for (var i = string_length(argument[0]); i >= 1; i--) {
        output = chr(real(ord(string_char_at(argument[0], i)) - i)) + output;
    }
}

return output;