if time == movetime+pause {
	image_index = 0
}
if time == movetime+pause+5 {
	image_index = 1
}
if time == movetime+pause+10 {
	Camera_Shake(4,4,1,1)
	audio_stop_sound(snd_gb_release)
	audio_play_sound(snd_gb_release,0,0)
	image_index = 2
	alarm[1] = 3
	beam = instance_create_depth(0,0,0,battle_bullet_gb_beam)
	beam_alpha = 1
	beam.color = color
	alarm[2] = duration
	Anim_Create(id,"beam_scale",1,1,0,1,10)
	Anim_Create(id,"beam_yscale",1,1,0,image_yscale*2,10)
}
if time == movetime+pause+15{
	if follow {
		direction = follow_angle+180
		speed = 50
		Anim_Create(id,"follow_hspeed",2,1,0,hspeed,240)
		Anim_Create(id,"follow_vspeed",2,1,0,vspeed,240)
		speed = 0
	}
	else {
		direction = image_angle+180
		Anim_Create(id,"speed",2,1,0,50,240)
	}
}
time++

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
			var LEN=(25*image_xscale)
			var X=(x+lengthdir_x(LEN,image_angle))
			var Y=(y+lengthdir_y(LEN,image_angle))
			LEN=(LEN+(sprite_get_width(spr_gb_beam)*image_xscale))
			
			X=(x+lengthdir_x(LEN,image_angle))
			Y=(y+lengthdir_y(LEN,image_angle))
			
			beam.x = X
			beam.y = Y
			beam.image_angle = image_angle
		}
		beam.image_alpha = beam_alpha
	}
}