/// @description scrc_left_handed_mode()

global.left_handed_mode = toggle(global.left_handed_mode);

if (global.left_handed_mode) {
    KEYBIND_UP = vk_up;
    KEYBIND_LEFT = vk_left;
    KEYBIND_DOWN = vk_down;
    KEYBIND_RIGHT = vk_right;
    KEYBIND_SHOOT = vk_control;
    KEYBIND_FOCUS = vk_shift;
    KEYBIND_ULTIMATE = vk_enter;
} else {
    KEYBIND_UP = ord("W");
    KEYBIND_LEFT = ord("A");
    KEYBIND_DOWN = ord("S");
    KEYBIND_RIGHT = ord("D");
    KEYBIND_SHOOT = vk_space;
    KEYBIND_FOCUS = vk_shift;
    KEYBIND_ULTIMATE = ord("E");
}
