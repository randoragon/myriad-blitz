/// @description ascii_encode(string)
/// @param string

var output = "";

if (string_length(argument[0]) > 0) {
    for (var i = 1; i <= string_length(argument[0]); i++) {
        output += chr(real(ord(string_char_at(argument[0], i)) + i));
    }
}

return output;