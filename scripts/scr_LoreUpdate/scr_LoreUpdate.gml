/// @description scr_LoreUpdate()

with(obj_lore) {
    var linecount = 0;
    while (linecount < string_count("\n", global.lore) + 1) {
        var lastpos = 1;
        for (var pos = 1; pos <= string_length(global.lore); pos++) {
            if (string_char_at(global.lore, pos) == "\n") {
                text[linecount] = string_copy(global.lore, lastpos, pos - lastpos);
                lastpos = pos + 1;
                linecount++;
            }
            if (pos == string_length(global.lore)) {
                text[linecount] = string_copy(global.lore, lastpos, pos - lastpos + 1);
                linecount++;
                break;
            }
        }
    }
}