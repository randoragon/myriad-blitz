/// @description scr_Stats_Linecount(a, b, c);
/// @param a
/// @param b
/// @param c
function scr_Stats_Linecount() {

	if (!instance_exists(obj_statboard)) { exit; }

	with (obj_statboard) {
	    var a = argument[0];
	    var b = argument[1];
	    var c = argument[2];

	    if (datatype[a, b] == 4 && string_count("\n", string(value[a, b])) > 0) {
	        var valcopy = string(value[a, b]);
	        var lines   = 1 + string_count("\n", string(value[a, b]));
	        text[a, b] += string((lines - 1) / 2);
	        var lastpos = 1;
        
	        for (var i = 0; i < lines; i++) {
	            for (var readpos = lastpos; readpos <= string_length(valcopy); readpos++) {
	                if (string_char_at(valcopy, readpos) == "\n" || readpos == string_length(valcopy)) {
	                    value[a, b] = string_copy(valcopy, lastpos, readpos - lastpos + (readpos == string_length(valcopy)));
	                    if (i > 0) { text[a, b] = text[a, b - 1]; }
	                    datatype[a, b]  = 4;
	                    elementid[a, b] = c;
	                    if (b == 0) {
	                        linecount[a, b] = 1;
	                    } else {
	                        if (datatype[a, b - 1] == 0 || datatype[a, b - 1] == 3 || datatype[a, b - 1] == 4) { linecount[a, b] = linecount[a, b - 1] + 1; }
	                        if (datatype[a, b - 1] == 1 || datatype[a, b - 1] == 2) { linecount[a, b] = linecount[a, b - 1] + 2; }
	                    }
	                    lastpos = readpos + 1;
	                    b++;
	                    if (string_char_at(valcopy, string_length(valcopy)) == "\n" && lastpos > string_length(valcopy)) {
	                        value[a, b]     = "";
	                        datatype[a, b]  = 4;
	                        elementid[a, b] = c;
	                        text[a, b]      = text[a, b - 1];
	                        linecount[a, b] = linecount[a, b - 1] + 1;
	                        b++;
	                    }
	                    break;
	                }
	            }
	        }
	        return b - 1;
	    } else {
	        if (datatype[a, b] == 4) { text[a, b] += "0"; }
	        if (b == 0) {
	            linecount[a, b] = 1;
	            return b;
	        } else {
	            if (datatype[a, b - 1] == 0 || datatype[a, b - 1] == 3 || datatype[a, b - 1] == 4) { linecount[a, b] = linecount[a, b - 1] + 1; return b; }
	            if (datatype[a, b - 1] == 1 || datatype[a, b - 1] == 2) { linecount[a, b] = linecount[a, b - 1] + 2; return b; }
	        }
	    }
	}


}
