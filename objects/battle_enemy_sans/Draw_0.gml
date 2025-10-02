var lw = sprite_get_width(legs_sprite)
var lh = sprite_get_height(legs_sprite)*2
var offset = 2
draw_sprite_pos(legs_sprite,legs_image,x-lw+body_x+slambody_x+offset,y-lh+body_y+slambody_y,x+lw+body_x+slambody_x+offset,y-lh+body_y+slambody_y,x+lw+offset,y,x-lw+offset,y,1)
draw_sprite_ext(body_sprite,body_image,x+body_x-2+slambody_x,y+body_y-48+slambody_y,2,2,0,c_white,1)
if eye_flash {
	draw_sprite_ext(flasheye_sprite,flasheye_image,x+head_x+slamhead_x,y+head_y+-86+slamhead_y,2,2,0,c_white,1)
	flasheye_image+=0.25
}
else {
	draw_sprite_ext(head_sprite,head_image,x+head_x+slamhead_x,y+head_y+-86+slamhead_y,2,2,0,c_white,1)
}
draw_sprite_ext(sweat_sprite,sweat_image,x+head_x+slamhead_x,y+head_y+-86+slamhead_y,2,2,0,c_white,1)