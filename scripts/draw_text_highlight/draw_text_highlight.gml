/// @description draw_text_highlight(x, y, text, scale, bg_color, bg_alpha, halign, valign, hborder, vborder)
/// @param x
/// @param y
/// @param text
/// @param scale
/// @param bg_color
/// @param bg_alpha
/// @param halign
/// @param valign
/// @param hborder
/// @param vborder

var xx          = argument[0];
var yy          = argument[1];
var text        = argument[2];
var scale       = argument[3];
var text_width  = string_width (string_hash_to_newline(argument[2])) * scale;
var text_height = string_height(string_hash_to_newline(argument[2])) * scale;
var hborder     = argument[8];
var vborder     = argument[9];
var prev_alpha  = draw_get_alpha();

draw_set_color(argument[4]);
draw_set_alpha(argument[5]);

switch (argument[6]) {
    case fa_left:
        switch (argument[7]) {
            case fa_top:
                draw_rectangle(xx - hborder, yy + (3 * scale) - vborder, xx + text_width - 1 - scale + hborder, yy + text_height - 1 - (2 * scale) + vborder, 0);
            break;
            case fa_middle:
                draw_rectangle(xx - hborder, yy - (text_height/2) + (3 * scale) - vborder, xx + text_width - 1 - scale + hborder, yy + (text_height/2) - 1 - (2 * scale) + vborder, 0);
            break;
            case fa_bottom:
                draw_rectangle(xx - hborder, yy - text_height + (3 * scale) - vborder, xx + text_width - 1 - scale + hborder, yy - (2 * scale) + vborder, 0);
            break;
        }
    break;
    case fa_center:
        switch (argument[7]) {
            case fa_top:
                draw_rectangle(xx - (text_width/2) - hborder, yy + (3 * scale) - vborder, xx + (text_width/2) - 1 - scale + hborder, yy + text_height - 1 - (2 * scale) + vborder, 0);
            break;
            case fa_middle:
                draw_rectangle(xx - (text_width/2) - hborder, yy - (text_height/2) + (3 * scale) - vborder, xx + (text_width/2) - 1 - scale + hborder, yy + (text_height/2) - 1 - (2 * scale) + vborder, 0);
            break;
            case fa_bottom:
                draw_rectangle(xx - (text_width/2) - hborder, yy - text_height + (3 * scale) - vborder, xx + (text_width/2) - 1 - scale + hborder, yy - (2 * scale) + vborder, 0);
            break;
        }
    break;
    case fa_right:
        switch (argument[7]) {
            case fa_top:
                draw_rectangle(xx - text_width - hborder, yy + (3 * scale) - vborder, xx - 1 - scale + hborder, yy + text_height - 1 - (2 * scale) + vborder, 0);
            break;
            case fa_middle:
                draw_rectangle(xx - text_width - hborder, yy - (text_height/2) + (3 * scale) - vborder, xx - 1 - scale + hborder, yy + (text_height/2) - 1 - (2 * scale) + vborder, 0);
            break;
            case fa_bottom:
                draw_rectangle(xx - text_width - hborder, yy - text_height + (3 * scale) - vborder, xx - 1 - scale + hborder, yy - (2 * scale) + vborder, 0);
            break;
        }
    break;    
}

draw_set_alpha(prev_alpha);