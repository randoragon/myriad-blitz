/// @description version_check(string to check);
/// @param string to check

var current_version = VER;
var slot_version    = argument[0];

switch (current_version) {
    case "1.1.0": case "1.1.1":
        if (slot_version == "1.1.0" || slot_version == "1.1.1") {
            return true;
        }
    break;
    default:
        return false;
    break;
}
