event_inherited()
gpu_set_colorwriteenable(1,1,1,0)
var SPR=spr_gb_beam
var LEN=(25*image_xscale)
var X=(x+lengthdir_x(LEN,image_angle))
var Y=(y+lengthdir_y(LEN,image_angle))
var XSCALE=image_xscale
var YSCALE=beam_yscale+(sin(time/5)*beam_scale)/4
draw_sprite_ext(SPR,0,X,Y,XSCALE,YSCALE,image_angle,image_blend,beam_alpha)
LEN=(LEN+(sprite_get_width(SPR)*image_xscale))
X=(x+lengthdir_x(LEN,image_angle))
Y=(y+lengthdir_y(LEN,image_angle))
XSCALE=999
draw_sprite_ext(SPR,1,X,Y,XSCALE,YSCALE,image_angle,image_blend,beam_alpha)
gpu_set_colorwriteenable(1,1,1,1)