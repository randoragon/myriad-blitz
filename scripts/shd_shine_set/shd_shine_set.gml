/// @description shd_shine_set(time, size[x], [y], suf_size[x], [y], color_blend[r], [g], [b], [a], whitelist_box[x1], [y1], [x2], [y2]);
/// @param time
/// @param size[x]
/// @param [y]
/// @param suf_size[x]
/// @param [y]
/// @param color_blend[r]
/// @param [g]
/// @param [b]
/// @param [a]
/// @param whitelist_box[x1]
/// @param [y1]
/// @param [x2]
/// @param [y2]

shader_set(shd_shine);
shader_set_uniform_f(global.shd_shine_uni[| 0], argument[0]);
shader_set_uniform_f(global.shd_shine_uni[| 1], argument[1], argument[2]);
shader_set_uniform_f(global.shd_shine_uni[| 2], argument[3], argument[4]);
shader_set_uniform_f(global.shd_shine_uni[| 3], argument[5], argument[6], argument[7], argument[8]);
shader_set_uniform_f(global.shd_shine_uni[| 4], argument[9], argument[10], argument[11], argument[12]);
