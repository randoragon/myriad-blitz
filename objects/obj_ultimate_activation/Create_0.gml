/// @description setup
instance_setup(0,0,0,1);
text=global.uname;
stage=0;
size=0;
progress=0;
multiplier=1;
depth=gui_depth.ultimate_text;
image_alpha=0;

//surface dimensions calculation
    uname_width=(string_width(string_hash_to_newline(text))+2)*11*multiplier;
    uname_height=(string_height(string_hash_to_newline(text))+2)*11*multiplier;
    hpadding=4*11*multiplier; vpadding=11*multiplier;
    image_width=sprite_get_width(spr_slot_char)*uname_height/sprite_get_height(spr_slot_char);
    image_height=uname_height;
    headline_height=uname_height/2;
mysurface_width=image_width+hpadding+uname_width;
mysurface_height=headline_height+vpadding+uname_height;
suf_mysurface=surface_create(mysurface_width,mysurface_height);

texel_width=texture_get_texel_width(surface_get_texture(suf_mysurface));
texel_height=texture_get_texel_height(surface_get_texture(suf_mysurface));

///event_inherited();
event_inherited();

