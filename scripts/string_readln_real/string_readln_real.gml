/// @description string_readln_real(string, 'separator)
/// @param string
/// @param 'separator

// Does the same thing as string_readln(), but returns the value as a real number.

var data = argument[0];
var sep = (argument_count < 2)? ";" : argument[1];

for (var readpos = 1; readpos <= string_length(data[0]); readpos++)  {
        if (string_char_at(data[0], readpos) == sep) {
            var snippet = real(string_copy(data[0], 1, readpos - 1));
            data[@ 0] = string_delete(data[0], 1, readpos);
            return snippet;
        }
}
