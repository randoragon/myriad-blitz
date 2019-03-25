/// @description scr_toggle_stats_selection(bool);
/// @param bool

if (!instance_exists(obj_statboard) || !instance_exists(obj_statboard.button[1])) { exit; }

with (obj_statboard.button[1]) {
    customize   = argument[0];
    image_index = 2 * customize;
    if (customize == 1) {
        with (obj_statboard) {
            for (var i = 0; i < elementid[array_height_2d(elementid) - 1, array_length_2d(elementid, array_height_2d(elementid) - 1) - 1] + 1; i++) {
                checkbox[i] = instance_create_depth_f(x - 130, -20, obj_statboard.depth - 1, obj_button, 23);
                checkbox[i].check = listed[i];
                if (listed[i] == 1) { checkbox[i].image_index = 2; }
            }
        }
    } else {
        with (obj_statboard) {
            ini_open(working_directory + "userconfig.mbdat");
            for (var i = 0; i < array_length_1d(checkbox); i++) {
                if (instance_exists(checkbox[i])) {
                    ini_write_real("shown_stats", string(i), checkbox[i].check);
                    wipe(checkbox[i]);
                    checkbox[i] = -4;
                }
            }
            ini_close();
        }
    }
}