surface_set_target(Battle_GetBoardSurface())
var draw_x = x + lengthdir_x(1,image_angle+90)
var draw_y = y + lengthdir_y(1,image_angle+90)
draw_sprite_ext(sprite_index,image_index,draw_x,draw_y,image_xscale,2,image_angle,image_blend,image_alpha);
surface_reset_target()
