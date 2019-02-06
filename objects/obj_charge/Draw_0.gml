/// @description Draw self & apply shaders

#region Skip if loading

if (global.loading == 1) { exit; }

#endregion

#region GENERAL_SURFACE set

surface_set_target(GENERAL_SURFACE);

#endregion

#region Blazing Fireball

if (f == 0 && e != 2) {
    if (global.shader_conditions == 0) {
        draw_self();
    } else {
        shd_sprite_effect_set(global.shader_conditions);
        draw_self();
        shader_reset();
    }
}

#endregion

#region Royal Laser

if (f == 1) {
    //register enemy hits if on gpstep
    if (real_step()) {
        var buff = buffer_create(4, buffer_grow, 4);
        buffer_seek(buff, buffer_seek_start, 0);
    }
    
    //enable shaders
    if (global.shader_conditions != 0) {
        shd_sprite_effect_set(global.shader_conditions);
    }
    
    //draw sprites
    var yscale = clamp(charge / 60, 0, 1);
    for(var i = 0; i < ceil((CANVAS_XEND - obj_player.x) / sprite_width); i++) {
        var xx = obj_player.x + lengthdir_x(22, image_angle + 28) + (sprite_width * i);
        var yy = obj_player.y + lengthdir_y(22, image_angle + 28);
        draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale, (image_yscale - clamp((5 - i) / 10, -0.5, 0.5)) * yscale, image_angle, image_blend, image_alpha);
        if (real_step()) {
            with (obj_enemy) {
                if (hp > 0 && abs(y - yy) <= (32 * (other.image_yscale - clamp((5 - i) / 10, -0.5, 0.5)) * yscale) + (sprite_height / 2) && x + (sprite_width / 2) > xx && x - (sprite_width / 2) < xx + 64) {
                    buffer_write(buff, buffer_u32, id);
                }
            }
        }
    }
    
    //disable shaders
    if (global.shader_conditions != 0) {
        shader_reset();
    }
    
    //hit registered enemies
    if (gpspeed != 0 && gpstep >= 1) {
        var buff_length = buffer_tell(buff);
        for (var i = 0; i < buff_length / 4; i++) {
            buffer_seek(buff, buffer_seek_start, 4 * i)
            with (buffer_read(buff, buffer_u32)) {
                if (object_index != obj_enemy) {
                    show_message("Critical Bug!#Please send the following error code to the developer:" + string(object_index) + "#(contact: randoragongamedev@gmail.com)");
                }
                var damage = calculate_damage(other.cdmg, other.cpen, cdef);
                var display_damage = ceil(hp) - ceil(hp - damage);
                hp = clamp(hp - damage, 0, hpmax);
                indicate(x + irandom_range(-sprite_width / 2,sprite_width / 2), clamp(yy, y - (sprite_height / 2), y + (sprite_height / 2)), display_damage, 1, rgb(255, 85, 0), c_red);
            }
        }
        buffer_delete(buff);
        charge -= gpspeed;
    }
    
    if (charge <= 0) {
        instance_destroy();
        spawn.sprite_index = spr_emerald;
    }
}

#endregion

#region Reset surface

surface_reset_target();

#endregion