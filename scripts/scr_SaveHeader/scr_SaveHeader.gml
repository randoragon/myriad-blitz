/// @description scr_SaveHeader(args)
/// @param args
function scr_SaveHeader() {

	var args = argument[0];

	var fname, retry, date;

	// Convert slotname to filename and absolute file path
	fname = strip_filename(args[0]);
	args[@ 1] = working_directory + "slots\\" + fname + ".mbslot";
	retry = 1;
	while (file_exists(args[1])) {
		retry++;
		fpath = working_directory + "slots\\" + fname + string(retry) + ".mbslot";
	}

	date = date_current_datetime();
	args[@ 2] =
		string_replace(string_format(date_get_month(date), 2, 0), " ", "0") + "/" +
		string_replace(string_format(date_get_day(date), 2, 0), " ", "0") + "/" +
		string(date_get_year(date)) + " " +
		string_replace(string_format(date_get_hour(date), 2, 0), " ", "0") + ":" +
		string_replace(string_format(date_get_minute(date), 2, 0), " ", "0");



}
