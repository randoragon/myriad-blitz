/// @description indicate(x, y, content, importance[1-3], color1, color2);
/// @param x
/// @param y
/// @param content
/// @param importance[1-3]
/// @param color1
/// @param color2

var input = string_upper(string(argument[2]));
var scale = 2 + (2 * (argument[3] == 2)) + (3 * (argument[3] == 3));
var char, index, xpos, ypos, char_width, offset_width;

for (var i = 1; i <= string_length(input); i++) {
    if (string_char_at(input, i) != " ") {
        char         = string_char_at(input, i);                                                         // current character to draw
        index        = char_index(char);                                                                 // image_index of the current character in part_ascii sprite.
        part_type_edit_pro(global.indicator_part[argument[3] - 1], "image_index", index);
        part_type_edit_pro(global.indicator_part[argument[3] - 1], "color", argument[4], argument[5]);
        char_width   = string_width(string_hash_to_newline(char)) * scale;
        offset_width = (string_width(string_hash_to_newline(string_copy(input, 1, i - 1))) + 1) * scale; // the combined width of all letters to the left of the current one (+1 for padding between that and the current character)
        xpos         = argument[0] - (string_width(string_hash_to_newline(input)) * scale / 2) + offset_width;
        ypos         = argument[1] - (25 * (argument[3] == 3));
        part_type_spawn_pro(global.part_system[1], global.indicator_part[argument[3] - 1], 0, xpos, ypos, xpos, ypos, "line", "linear", 1);
    }
}