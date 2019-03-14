/// @description Setup

// section padding = padding between a headline and content below
// content_padding = padding between two lines of content
// content_end_padding = padding between the end of content and beginning of a new section

#region Setup

instance_setup(irandom(image_number - 1), 0.04);
sprite_index = noone;
scroll		 = 0;
scrollv		 = 0;
osc=fx_wave(3, 4, -3, -4, 1, 30, 0, -1, 3, 4, -3, -4, 3, 45, 0, -1);

if (file_exists(program_directory + "\\changelog.txt")) {
    var file = file_text_open_read(program_directory + "\\changelog.txt");
    file_text_readln(file); //skip the disclaimer
    section[0]    = "";
    date[0]       = "";
    content[0, 0] = "";
    var line, i = -1, l = 0, text;
    while (!file_text_eof(file)) {
        line = file_text_readln(file);
        if (!file_text_eof(file)) {
            line = string_delete(line, string_length(line) - 1, 2);
        }
        if (string_copy(line, 1, 3) == "///") {
            text[0]      = string_delete(line, 1, 3);
            section[++i] = string_replace(string_readln(text, ";"), "#", "\\#");
            date[i]      = text[0];
            l            = 0;
        } else {
            if (i < 0) {
                section[0]    = "INVALID CHANGELOG FILE";
                date[0]		  = "";
                content[0, 0] = "_Your changelog file has incorrect formatting.";
                content[0, 1] = "_Contact me via email or Discord to fix this.";
                content[0, 2] = "_randoragongamedev@gmail.com";
                content[0, 3] = "_Discord server invite is in the About section.";
                break;
            }
            content[i, l++]   = string_replace(line, "#", "\\#");
        }
    }
    file_text_close(file);
} else {
    section[0]    = "CHANGELOG FILE MISSING";
    date[0]		  = "";
    content[0, 0] = "_Your changelog file is missing.";
    content[0, 1] = "_Contact me via email or Discord to fix this.";
    content[0, 2] = "_randoragongamedev@gmail.com";
    content[0, 3] = "_Discord server invite is in the About section.";
}

total_height = array_length_1d(section) * ((3 * 12) + section_padding);
for (var i = 0; i < array_length_1d(section); i++) {
    total_height += (array_length_2d(content, i) * ((2 * 12) + content_padding)) - content_padding + content_end_padding;
}
total_height = max(total_height - 558 + 120, 0);

#endregion