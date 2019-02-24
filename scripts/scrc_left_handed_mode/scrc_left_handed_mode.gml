/// @description scrc_left_handed_mode()

global.left_handed_mode = toggle(global.left_handed_mode);

if (global.left_handed_mode) {
    global.keybind[0] = vk_up;      // move upwards
    global.keybind[1] = vk_left;    // move left
    global.keybind[2] = vk_down;    // move downwards
    global.keybind[3] = vk_right;   // move right
    global.keybind[4] = vk_control; // shoot
    global.keybind[5] = vk_shift;   //focus
    global.keybind[6] = vk_enter;   //ultimate
} else {
    global.keybind[0] = ord("W");   // move upwards
    global.keybind[1] = ord("A");   // move left
    global.keybind[2] = ord("S");   // move downwards
    global.keybind[3] = ord("D");   // move right
    global.keybind[4] = vk_space;   // shoot
    global.keybind[5] = vk_shift;   // focus
    global.keybind[6] = ord("E");   // ultimate
}
