/// @description file_text_readbit(file)
/// @param file
function file_text_readbit() {

	// returns the line of a text file with the last 2 characters removed (line breaks)

	var line = file_text_readln(argument[0]);
	return string_delete(line, string_length(line) - 1, 2);


}
