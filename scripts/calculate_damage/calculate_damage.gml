/// @description calculate_damage(dmg, pen, def);
/// @param dmg
/// @param pen
/// @param def

return max(min(argument[0] - ((100 - argument[1]) * argument[2] / 100), argument[0]) * random_range(0.9, 1.1), 1);