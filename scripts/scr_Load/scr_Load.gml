/// @description scr_Load(slot_path)
/// @param slot_path

if (file_exists(argument[0])) {
    with (instance_create_layer(0, 0, "Transition", obj_slot_loading)) { fpath = argument[0]; }
} else {
    display_message("ERROR: file missing!", scrm_do_nothing);
}