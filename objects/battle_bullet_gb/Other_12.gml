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
if time >= movetime+pause+10 {
	if instance_exists(beam) {
		beam.image_yscale=beam_yscale*collision_scale
		beam.follow = follow
		beam.follow_target = follow_target
		if follow {
				beam.follow_x = follow_x+lengthdir_x(25*image_xscale,follow_angle)
				beam.follow_y = follow_y+lengthdir_y(25*image_yscale,follow_angle)
				beam.follow_angle = follow_angle
			with(beam) {
				var F_a = variable_instance_exists(follow_target,"angle") ? follow_target.angle : follow_target.image_angle
				var F = RotateXY(follow_x,follow_y,follow_target.x,follow_target.y,F_a)
				x = F[0]
				y = F[1]
				image_angle = follow_angle+F_a
			}
		}
		else {
			beam.x = X
			beam.y = Y
			beam.image_angle = image_angle
		}
		beam.image_alpha = beam_alpha
	}
}